#!/usr/bin/env python3
"""generate_useritem_code.py - Game-master generator of personal `useritem` codes.

Reference: `.docs/steps/10.md` and `.docs/gamemaster/useritemcode.md` (algorithm, binary format and
test vectors - this script follows them exactly).

A generated code is bound to ONE UUID, grants ONE item (a booster or a card) in a given quantity,
and can be claimed only once, by the app, offline. It looks like:

    040G-40R4-0M2R-Q5R0-0CG6-BF0Z-HP5Q-WZ30

and is shared as a direct link:

    index.html?Redeem=040G-40R4-0M2R-Q5R0-0CG6-BF0Z-HP5Q-WZ30

USAGE
    python generate_useritem_code.py                 # interactive
    python generate_useritem_code.py --self-test     # replay the document test vectors
    python generate_useritem_code.py --uuid <UUID> --type booster --item A1 --qty 3
    python generate_useritem_code.py --list          # print the catalogue and exit

The shared key is read from `settings/config.json` (`useritemCode.key`); use `--key-base64` or
`--key-hex` only to test against another key. The app verifies codes with the SAME key, so a code
generated with a test key is rejected in the game.

Every emitted code is appended to the registry (`useritem_codes.csv` by default). That file maps an
UUID to a code: keep it private and never commit it (see `.gitignore`). It exists so the same nonce
or code is never issued twice, and so a lost code can be resent instead of regenerated.
"""

from __future__ import annotations

import argparse
import base64
import csv
import hashlib
import hmac
import json
import os
import secrets
import sys
from datetime import datetime, timezone

ALPHABET = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
UIC_CONTEXT = b"UIC1"
VERSION = 0x01
CODE_LENGTH = 32
MAX_QUANTITY = 65535
VERSION_HEX = "01"  # prefix of the `version` column of the registry

ROOT = os.path.dirname(os.path.abspath(__file__))
CONFIG_PATH = os.path.join(ROOT, "settings", "config.json")
DEFAULT_REGISTRY = os.path.join(ROOT, "useritem_codes.csv")
REGISTRY_HEADER = "createdAt,uuid,item,quantity,version,nonce,code,note"

# --- Test material from `.docs/gamemaster/useritemcode.md` section 9 (never production). ---------
TEST_KEY = bytes(range(32))  # 00 01 02 ... 1f
TEST_UUID = "123e4567-e89b-12d3-a456-426614174000"
TEST_OTHER_UUID = "00000000-0000-4000-8000-000000000000"
TEST_VECTORS = (
    {
        "canonical": "booster:A1",
        "uuid": TEST_UUID,
        "quantity": 3,
        "nonce": "0102030405",
        "itemHash": "058b97",
        "bytes": "010102030405058b9700032065bc1f8d8b7e7c60",
        "code": "040G-40R4-0M2R-Q5R0-0CG6-BF0Z-HP5Q-WZ30",
    },
    {
        "canonical": "card:SERIE-A1 / P004|fullart",
        "uuid": TEST_UUID,
        "quantity": 1,
        "nonce": "a1b2c3d4e5",
        "itemHash": "b75d84",
        "bytes": "01a1b2c3d4e5b75d8400012065e1c817d43eb5f8",
        "code": "06GV-5GYM-WPVN-V100-04G6-BRE8-2ZA3-XDFR",
    },
    {
        "canonical": "booster:A1",
        "uuid": TEST_OTHER_UUID,
        "quantity": 3,
        "nonce": "0102030405",
        "itemHash": "058b97",
        "bytes": "010102030405058b9700039318a069dae05e8d8b",
        "code": "040G-40R4-0M2R-Q5R0-0E9H-H839-VBG5-X3CB",
    },
)


# --------------------------------------------------------------------------------------- encoding


def b32encode(data: bytes) -> str:
    """Encodes bytes into Crockford Base32 (no padding)."""
    bits = 0
    value = 0
    out = []
    for byte in data:
        value = (value << 8) | byte
        bits += 8
        while bits >= 5:
            bits -= 5
            out.append(ALPHABET[(value >> bits) & 31])
        value &= (1 << bits) - 1
    return "".join(out)


def b32decode(text: str):
    """Decodes Crockford Base32 into bytes (None when a character is out of the alphabet)."""
    bits = 0
    value = 0
    out = bytearray()
    for character in text:
        if character not in ALPHABET:
            return None
        value = (value << 5) | ALPHABET.index(character)
        bits += 5
        if bits >= 8:
            bits -= 8
            out.append((value >> bits) & 0xFF)
        value &= (1 << bits) - 1
    return bytes(out)


def normalize_code(raw: str) -> str:
    """Mirrors `UserItemCode.normalize`: uppercase, drop separators, map O/I/L."""
    text = "".join(raw.upper().split())
    text = text.replace("-", "").replace("O", "0").replace("I", "1").replace("L", "1")
    return text


def format_code(text: str) -> str:
    """Groups a 32-character code into 8 groups of 4 separated by `-`."""
    return "-".join(text[i : i + 4] for i in range(0, len(text), 4))


def uuid_bytes(uuid: str) -> bytes:
    """Converts an UUID into its 16 raw bytes (raises ValueError when malformed)."""
    hex_text = uuid.replace("-", "").strip()
    if len(hex_text) != 32:
        raise ValueError(f"UUID invalide : {uuid!r} (32 chiffres hex attendus)")
    try:
        return bytes.fromhex(hex_text)
    except ValueError as error:
        raise ValueError(f"UUID invalide : {uuid!r}") from error


def item_hash(canonical: str) -> str:
    """Hex of `SHA-256(canonical)[0..3]` (3 bytes), as stored in the code."""
    return hashlib.sha256(canonical.encode("utf-8")).digest()[:3].hex()


def build_payload(uuid: str, canonical: str, quantity: int, nonce: bytes, key: bytes) -> bytes:
    """Assembles the 20-byte payload (without encoding it)."""
    if len(nonce) != 5:
        raise ValueError("le nonce doit faire exactement 5 octets")
    if not 1 <= quantity <= MAX_QUANTITY:
        raise ValueError(f"la quantité doit être entre 1 et {MAX_QUANTITY} (reçu : {quantity})")

    unique_id = uuid_bytes(uuid)
    head = bytearray(13)
    head[0] = VERSION
    head[1:6] = nonce
    head[6:9] = hashlib.sha256(canonical.encode("utf-8")).digest()[:3]
    head[9:11] = quantity.to_bytes(2, "big")
    head[11:13] = hashlib.sha256(unique_id).digest()[:2]
    mac = hmac.new(key, UIC_CONTEXT + unique_id + bytes(head), hashlib.sha256).digest()[:7]
    return bytes(head) + mac


def generate_code(key: bytes, uuid: str, canonical: str, quantity: int, nonce=None) -> str:
    """Generates a formatted code for one item and one quantity."""
    payload = build_payload(uuid, canonical, quantity, nonce or secrets.token_bytes(5), key)
    return format_code(b32encode(payload))


def canonical_booster(set_id: str) -> str:
    return f"booster:{set_id.strip()}"


def canonical_card(index: str, layout: str) -> str:
    return f"card:{index.strip()}|{layout.strip().lower()}"


# -------------------------------------------------------------------------------------- catalogue


def load_config() -> dict:
    try:
        with open(CONFIG_PATH, "r", encoding="utf-8") as handle:
            return json.load(handle)
    except FileNotFoundError:
        sys.exit(f"settings/config.json introuvable (chemin attendu : {CONFIG_PATH})")
    except json.JSONDecodeError as error:
        sys.exit(f"settings/config.json illisible : {error}")


def load_key(config: dict, args) -> bytes:
    """Returns the 32-byte shared key (config `useritemCode.key`, or a test override)."""
    if args.key_hex:
        key = bytes.fromhex(args.key_hex)
    elif args.key_base64:
        key = base64.b64decode(args.key_base64)
    else:
        section = config.get("useritemCode") or {}
        encoded = section.get("key")
        if not isinstance(encoded, str) or not encoded.strip():
            sys.exit("settings/config.json ne déclare pas 'useritemCode.key'")
        try:
            key = base64.b64decode(encoded.strip(), validate=True)
        except ValueError as error:
            sys.exit(f"'useritemCode.key' n'est pas du base64 valide : {error}")

    if len(key) != 32:
        sys.exit(f"la clé doit faire exactement 32 octets (reçu : {len(key)})")
    if key == bytes(32) and not (args.key_hex or args.key_base64):
        print(
            "ATTENTION : la clé de settings/config.json est encore la valeur d'exemple (32 octets nuls). "
            "Remplacez-la par 'openssl rand -base64 32' avant de distribuer des codes.",
            file=sys.stderr,
        )
    return key


def load_catalog(config: dict):
    """Builds the catalogue: `booster:<setId>` and `card:<Index>|<Layout>` for every declared set."""
    directory = (config.get("boosters") or {}).get("directory") or "data/boosters"
    sets = (config.get("boosters") or {}).get("sets") or []
    catalog = {}

    for set_id in sets:
        path = os.path.join(ROOT, directory, f"{set_id}.json")
        if not os.path.isfile(path):
            sys.exit(f"fichier d'extension introuvable : {path}")
        with open(path, "r", encoding="utf-8") as handle:
            data = json.load(handle)

        booster = canonical_booster(set_id)
        catalog[booster] = {"canonical": booster, "kind": "booster", "setId": set_id}

        for entry in data.get("Cards") or []:
            index = entry.get("Index")
            layout = entry.get("Layout")
            if not isinstance(index, str) or not isinstance(layout, str):
                continue
            canonical = canonical_card(index, layout)
            catalog[canonical] = {
                "canonical": canonical,
                "kind": "card",
                "index": index,
                "layout": layout,
                "name": entry.get("Name_FR") or entry.get("Name_EN") or "",
            }

    return catalog


def find_collisions(catalog: dict) -> dict:
    """Maps an item hash to the canonicals that share it (a non-singleton entry must never be used)."""
    hashes = {}
    for canonical in catalog:
        hashes.setdefault(item_hash(canonical), []).append(canonical)
    return {digest: items for digest, items in hashes.items() if len(items) > 1}


# --------------------------------------------------------------------------------------- registry


def load_registry(path: str) -> tuple:
    """Reads the registry; returns `(nonces, codes)` seen so far."""
    nonces, codes = set(), set()
    if not os.path.isfile(path):
        return nonces, codes

    with open(path, "r", encoding="utf-8-sig", newline="") as handle:
        for row in csv.DictReader(handle):
            nonce = (row.get("nonce") or "").strip().lower()
            code = (row.get("code") or "").strip().upper()
            if nonce:
                nonces.add(nonce)
            if code:
                codes.add(code)
    return nonces, codes


def append_registry(path: str, row: dict) -> None:
    """Appends one row (append-only registry; the header is written once)."""
    is_new = not os.path.isfile(path)
    os.makedirs(os.path.dirname(path) or ".", exist_ok=True)
    with open(path, "a", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=REGISTRY_HEADER.split(","))
        if is_new:
            writer.writeheader()
        writer.writerow(row)


# ------------------------------------------------------------------------------------ interaction


def ask(prompt: str, default=None) -> str:
    suffix = f" [{default}]" if default is not None else ""
    while True:
        answer = input(f"{prompt}{suffix} : ").strip()
        if answer:
            return answer
        if default is not None:
            return default
        print("  valeur requise.")


def choose_item(catalog: dict, kind: str) -> str:
    """Asks for one catalogue item of the requested kind."""
    if kind == "booster":
        options = sorted(entry["setId"] for entry in catalog.values() if entry["kind"] == "booster")
        print("Extensions disponibles : " + ", ".join(options))
        answer = ask("Identifiant de l'extension")
        canonical = canonical_booster(answer)
        if canonical not in catalog:
            sys.exit(f"extension inconnue : {answer}")
        return canonical

    cards = sorted(
        (entry for entry in catalog.values() if entry["kind"] == "card"),
        key=lambda entry: (entry["index"], entry["layout"]),
    )
    for position, entry in enumerate(cards, start=1):
        print(f"  {position:>4}. {entry['index']} ({entry['layout']}) — {entry['name']}")
    answer = ask("Numéro de la carte (ou 'Index|Layout')")
    if answer.isdigit():
        position = int(answer)
        if not 1 <= position <= len(cards):
            sys.exit(f"numéro hors liste : {answer}")
        return cards[position - 1]["canonical"]
    if "|" in answer:
        index, _, layout = answer.partition("|")
        canonical = canonical_card(index, layout)
        if canonical not in catalog:
            sys.exit(f"carte inconnue : {answer}")
        return canonical
    sys.exit("réponse attendue : un numéro, ou 'Index|Layout'")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Génère un code personnel 'useritem' (usage unique, lié à un UUID).",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--uuid", help="UUID du destinataire (sinon demandé)")
    parser.add_argument("--type", choices=["booster", "card"], help="type de récompense (sinon demandé)")
    parser.add_argument("--item", help="extension (booster) ou 'Index|Layout' (card)")
    parser.add_argument("--qty", type=int, help="quantité (1 à 65535)")
    parser.add_argument("--count", type=int, default=1, help="nombre de codes à générer (défaut : 1)")
    parser.add_argument("--note", default="", help="note libre ajoutée au registre (ex. : pseudo du joueur)")
    parser.add_argument("--registry", default=DEFAULT_REGISTRY, help="chemin du registre CSV")
    parser.add_argument("--key-base64", help="clé de test en base64 (sinon settings/config.json)")
    parser.add_argument("--key-hex", help="clé de test en hexadécimal")
    parser.add_argument("--nonce-hex", help="nonce imposé (tests uniquement)")
    parser.add_argument("--list", action="store_true", help="affiche le catalogue puis quitte")
    parser.add_argument("--self-test", action="store_true", help="rejoue les vecteurs de test du document")
    return parser


# ------------------------------------------------------------------------------------------- main


def run_self_test() -> int:
    """Replays the document vectors; returns the process exit code."""
    print("Vecteurs de test de .docs/gamemaster/useritemcode.md :")
    failures = 0
    checks = 0

    for vector in TEST_VECTORS:
        nonce = bytes.fromhex(vector["nonce"])
        payload = build_payload(vector["uuid"], vector["canonical"], vector["quantity"], nonce, TEST_KEY)
        code = format_code(b32encode(payload))

        for label, actual, expected in (
            ("itemHash", item_hash(vector["canonical"]), vector["itemHash"]),
            ("bytes", payload.hex(), vector["bytes"]),
            ("code", code, vector["code"]),
            ("decode", (b32decode(normalize_code(vector["code"])) or b"").hex(), vector["bytes"]),
        ):
            checks += 1
            ok = actual == expected
            failures += 0 if ok else 1
            print(f"  {'ok  ' if ok else 'FAIL'} {label:9s} {vector['canonical']}" + (f" | attendu {expected} | obtenu {actual}" if not ok else ""))

    # A wrong UUID must produce a different `uuidTag` (and therefore a different code).
    checks += 1
    tag_other = hashlib.sha256(uuid_bytes(TEST_OTHER_UUID)).digest()[:2].hex()
    tag_main = hashlib.sha256(uuid_bytes(TEST_UUID)).digest()[:2].hex()
    ok = tag_other == "9318" and tag_main == "2065"
    failures += 0 if ok else 1
    print(f"  {'ok  ' if ok else 'FAIL'} uuidTag    {tag_main}/{tag_other}")

    print(f"\n{checks} vérifications, {failures} échec(s)")
    return 1 if failures else 0


def run_list(catalog: dict) -> int:
    """Prints the catalogue (useful before choosing an item)."""
    collisions = find_collisions(catalog)
    for canonical in sorted(catalog):
        entry = catalog[canonical]
        suffix = ""
        if entry["kind"] == "card":
            suffix = f" — {entry['name']}"
        print(f"{item_hash(canonical)}  {canonical}{suffix}")
    print(f"\n{len(catalog)} item(s).")
    if collisions:
        print("COLLISIONS d'empreinte (codes refusés pour ces items) :")
        for digest, items in collisions.items():
            print(f"  {digest}: {', '.join(items)}")
    else:
        print("Aucune collision d'empreinte.")
    return 0


def main(argv=None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)

    if args.self_test:
        return run_self_test()

    config = load_config()
    catalog = load_catalog(config)

    if args.list:
        return run_list(catalog)

    key = load_key(config, args)
    collisions = find_collisions(catalog)

    uuid = args.uuid or ask("UUID du destinataire")
    try:
        uuid_bytes(uuid)
    except ValueError as error:
        sys.exit(str(error))

    kind = args.type
    if not kind:
        while kind not in ("booster", "card"):
            kind = ask("Type (booster/card)").lower()
            if kind not in ("booster", "card"):
                print("  répondez 'booster' ou 'card'.")

    if args.item:
        if kind == "booster":
            canonical = canonical_booster(args.item)
        elif args.item in catalog:
            canonical = args.item
        elif "|" in args.item:
            index, _, layout = args.item.partition("|")
            canonical = canonical_card(index, layout)
        else:
            canonical = None
        if canonical not in catalog:
            sys.exit(f"item inconnu : {args.item}")
    else:
        canonical = choose_item(catalog, kind)

    quantity = args.qty
    while quantity is None or not 1 <= quantity <= MAX_QUANTITY:
        raw = ask(f"Quantité (1 à {MAX_QUANTITY})", default=None)
        try:
            quantity = int(raw)
        except ValueError:
            print("  nombre entier attendu.")
            quantity = None

    digest = item_hash(canonical)
    if digest in collisions:
        sys.exit(
            f"collision d'empreinte pour {canonical} : les items {', '.join(collisions[digest])} "
            "partagent le même itemHash, un code serait ambigu. Renommez l'item ou passez la version 0x02."
        )

    nonces, codes = load_registry(args.registry)
    emitted = []

    for _ in range(max(1, args.count)):
        code = None
        nonce = None
        for _attempt in range(1000):
            if args.nonce_hex:
                nonce = bytes.fromhex(args.nonce_hex)
            else:
                nonce = secrets.token_bytes(5)
            candidate = generate_code(key, uuid, canonical, quantity, nonce)
            normalized = normalize_code(candidate)
            if nonce.hex() not in nonces and candidate.upper() not in codes and normalized not in codes:
                nonce, code = nonce, candidate
                break
        if code is None:
            sys.exit("impossible de trouver un nonce libre après 1000 tentatives")

        nonces.add(nonce.hex())
        codes.add(code.upper())
        codes.add(normalize_code(code))
        emitted.append((nonce, code))
        append_registry(
            args.registry,
            {
                "createdAt": datetime.now(timezone.utc).isoformat(timespec="seconds"),
                "uuid": uuid,
                "item": canonical,
                "quantity": quantity,
                "version": VERSION_HEX,
                "nonce": nonce.hex(),
                "code": code,
                "note": args.note,
            },
        )

    print()
    for nonce, code in emitted:
        print(f"Code      : {code}")
        print(f"Lien      : index.html?Redeem={code}")
        print(f"Récompense: {canonical} x{quantity} (usage unique)")
        print(f"Nonce     : {nonce.hex()}")
        print()
    print(f"Destinataire : {uuid}")
    print(f"Registre     : {args.registry}")

    if len(emitted) > 1:
        print(f"\n{len(emitted)} codes générés.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
