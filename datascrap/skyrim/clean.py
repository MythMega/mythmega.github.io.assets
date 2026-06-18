#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
clear_data.py
Nettoie data.csv et écrit data_clean.csv
Règles:
 - Supprime les lignes dont id commence par "ench", "dlc1ench" ou "dlc2ench" (insensible à la casse)
 - Supprime les lignes où name_fr ou name_en est vide
 - Supprime les doublons sur name_en (insensible à la casse), garde la première occurrence
 - Sortie: data_clean.csv avec colonnes id,name_fr,name_en
Usage:
    py clear_data.py
"""
import csv
import logging
from pathlib import Path

INPUT = Path("data.csv")
OUTPUT = Path("data_clean.csv")
LOGFILE = Path("clear_data.log")

# Logging
logging.basicConfig(filename=str(LOGFILE), filemode="w",
                    format="%(asctime)s %(levelname)s %(message)s",
                    level=logging.DEBUG)
console = logging.StreamHandler()
console.setLevel(logging.INFO)
console.setFormatter(logging.Formatter("%(message)s"))
logging.getLogger().addHandler(console)

def read_csv(path):
    if not path.exists():
        logging.error(f"Fichier introuvable: {path}")
        return []
    rows = []
    with path.open("r", encoding="utf-8", errors="ignore", newline="") as fh:
        reader = csv.DictReader(fh)
        for r in reader:
            rows.append(r)
    logging.info(f"Lues {len(rows)} lignes depuis {path.name}")
    return rows, (reader.fieldnames or [])

def normalize_str(s):
    if s is None:
        return ""
    return str(s).strip()

def id_starts_with_blocked(id_val):
    if not id_val:
        return False
    v = id_val.strip().lower()
    return v.startswith("ench") or v.startswith("dlc1ench") or v.startswith("dlc2ench")

def write_csv(path, rows):
    # write only id,name_fr,name_en columns
    fieldnames = ["id", "name_fr", "name_en"]
    with path.open("w", encoding="utf-8", newline="") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        writer.writeheader()
        for r in rows:
            out = {
                "id": r.get("id", ""),
                "name_fr": r.get("name_fr", ""),
                "name_en": r.get("name_en", "")
            }
            writer.writerow(out)
    logging.info(f"Ecrit {len(rows)} lignes dans {path.name}")

def main():
    logging.info("Démarrage du nettoyage de data.csv")
    rows, fieldnames = read_csv(INPUT)
    if not rows:
        logging.error("Aucune ligne à traiter. Fin.")
        return

    # Normalize header keys to expected names (case-insensitive)
    # We'll map keys to lowercase for access
    normalized_rows = []
    for r in rows:
        # build a normalized dict with lowercase keys
        nr = {}
        for k, v in r.items():
            if k is None:
                continue
            nr[k.strip().lower()] = normalize_str(v)
        normalized_rows.append(nr)

    kept = []
    dropped_counts = {"id_blocked":0, "missing_name":0, "duplicate_name_en":0}
    seen_name_en = set()

    for i, row in enumerate(normalized_rows, start=1):
        id_val = row.get("id", "")
        name_fr = row.get("name_fr", "") or row.get("name fr", "") or row.get("name", "")
        name_en = row.get("name_en", "") or row.get("name en", "") or row.get("name", "")

        # drop if id starts with blocked prefixes
        if id_starts_with_blocked(id_val):
            dropped_counts["id_blocked"] += 1
            logging.debug(f"Ligne {i} supprimée: id bloqué='{id_val}'")
            continue

        # drop if missing names
        if name_fr == "" or name_en == "":
            dropped_counts["missing_name"] += 1
            logging.debug(f"Ligne {i} supprimée: nom manquant (fr='{name_fr}', en='{name_en}')")
            continue

        # dedupe by name_en (case-insensitive)
        key_en = name_en.lower()
        if key_en in seen_name_en:
            dropped_counts["duplicate_name_en"] += 1
            logging.debug(f"Ligne {i} supprimée: doublon name_en='{name_en}'")
            continue

        seen_name_en.add(key_en)
        # store canonical keys id,name_fr,name_en
        kept.append({
            "id": id_val,
            "name_fr": name_fr,
            "name_en": name_en
        })

    write_csv(OUTPUT, kept)

    total_in = len(rows)
    total_out = len(kept)
    total_dropped = total_in - total_out
    logging.info("=== Résumé ===")
    logging.info(f"Lignes initiales : {total_in}")
    logging.info(f"Lignes finales   : {total_out}")
    logging.info(f"Lignes supprimées: {total_dropped}")
    logging.info(f" - id commençant par 'ench'/'dlc1ench'/'dlc2ench' : {dropped_counts.get('id_blocked',0)}")
    logging.info(f" - noms manquants            : {dropped_counts.get('missing_name',0)}")
    logging.info(f" - doublons name_en          : {dropped_counts.get('duplicate_name_en',0)}")
    logging.info(f"Log détaillé : {LOGFILE}")

if __name__ == "__main__":
    main()
