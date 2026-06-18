#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
fix_pictures.py
Lit filtered_items.csv, télécharge les images, les renomme et met à jour les JSON dans output/.
Usage: python3 fix_pictures.py [--csv filtered_items.csv] [--out output] [--log fix_pictures.log]
"""

import os
import re
import csv
import json
import argparse
import logging
import sys
from urllib.parse import urlparse
from pathlib import Path

try:
    import requests
except Exception:
    print("Le module 'requests' est requis. Installe-le via: pip install requests")
    sys.exit(1)

# ---------------------------
# Configuration (modifiable)
# ---------------------------
CSV_FILE_DEFAULT = "filtered_items.csv"
OUTPUT_DIR_DEFAULT = "output"
ASSETS_SUBDIR = "satis"  # images will be in output/satis/items and output/satis/creatures
LOG_FILE_DEFAULT = "fix_pictures.log"

# Virtual categories mapping: change these lists pour configurer quelles catégories réelles
VIRTUAL_CATEGORIES = {
    "all items": [
        "ore", "ingot", "mineral", "liquid", "gas", "standard", "industrial",
        "electronic", "communication", "quantum", "container", "fuel",
        "consumed", "ammo", "nuclear", "waste", "special"
    ],
    "all creatures": ["wildlife", "enemy", "animal"]
}

# Timeout pour les téléchargements
REQUEST_TIMEOUT = 15
# Nombre de tentatives
MAX_RETRIES = 2

# ---------------------------
# Logging
# ---------------------------
def setup_logger(log_path):
    logger = logging.getLogger("fix_pictures")
    logger.setLevel(logging.DEBUG)
    # Console handler
    ch = logging.StreamHandler(sys.stdout)
    ch.setLevel(logging.INFO)
    ch.setFormatter(logging.Formatter("%(asctime)s - %(levelname)s - %(message)s", "%H:%M:%S"))
    # File handler
    fh = logging.FileHandler(log_path, encoding="utf-8")
    fh.setLevel(logging.DEBUG)
    fh.setFormatter(logging.Formatter("%(asctime)s - %(levelname)s - %(message)s"))
    if not logger.handlers:
        logger.addHandler(ch)
        logger.addHandler(fh)
    return logger

# ---------------------------
# Helpers
# ---------------------------
def slugify(name):
    """Minuscule, remplace tout ce qui n'est pas alphanum par '_' et compacte les '_'."""
    if not name:
        return ""
    s = name.lower()
    # Remplacer les caractères accentués par leur équivalent ASCII
    try:
        import unicodedata
        s = unicodedata.normalize("NFKD", s)
        s = "".join(c for c in s if not unicodedata.combining(c))
    except Exception:
        pass
    s = re.sub(r"[^a-z0-9]+", "_", s)
    s = re.sub(r"_+", "_", s)
    s = s.strip("_")
    return s or "unnamed"

def ensure_dirs(path):
    os.makedirs(path, exist_ok=True)

def download_image(url, dest_path, logger):
    """Télécharge l'image depuis url vers dest_path. Retourne True si OK."""
    if not url:
        logger.debug(f"Aucun URL fourni pour {dest_path.name}")
        return False
    # Si le fichier existe déjà, on skip
    if dest_path.exists() and dest_path.stat().st_size > 0:
        logger.info(f"Existe déjà, skip: {dest_path}")
        return True
    headers = {"User-Agent": "satisfactory-image-downloader/1.0"}
    for attempt in range(1, MAX_RETRIES + 1):
        try:
            logger.debug(f"Téléchargement ({attempt}/{MAX_RETRIES}) {url} -> {dest_path}")
            with requests.get(url, headers=headers, timeout=REQUEST_TIMEOUT, stream=True) as r:
                r.raise_for_status()
                # Détecter content-type si besoin pour extension (mais on forcera .png)
                ensure_dirs(dest_path.parent)
                with open(dest_path, "wb") as f:
                    for chunk in r.iter_content(chunk_size=8192):
                        if chunk:
                            f.write(chunk)
            logger.info(f"Téléchargée: {dest_path}")
            return True
        except Exception as e:
            logger.warning(f"Erreur téléchargement {url} (attempt {attempt}): {e}")
    logger.error(f"Échec téléchargement après {MAX_RETRIES} tentatives: {url}")
    return False

def determine_type(real_category):
    """Retourne 'items' ou 'creatures' ou None selon la catégorie réelle."""
    rc = (real_category or "").strip().lower()
    if rc in [c.lower() for c in VIRTUAL_CATEGORIES.get("all creatures", [])]:
        return "creatures"
    if rc in [c.lower() for c in VIRTUAL_CATEGORIES.get("all items", [])]:
        return "items"
    return None

# ---------------------------
# Main processing
# ---------------------------
def main():
    parser = argparse.ArgumentParser(description="Télécharge images et met à jour les JSON pour utiliser chemins locaux.")
    parser.add_argument("--csv", default=CSV_FILE_DEFAULT, help="Chemin vers le CSV (par défaut filtered_items.csv)")
    parser.add_argument("--out", default=OUTPUT_DIR_DEFAULT, help="Dossier output contenant les JSON (par défaut output)")
    parser.add_argument("--log", default=LOG_FILE_DEFAULT, help="Fichier de log (par défaut fix_pictures.log)")
    args = parser.parse_args()

    logger = setup_logger(args.log)
    logger.info("=== Début fix_pictures ===")
    logger.info(f"CSV: {args.csv}  Output dir: {args.out}")

    csv_path = Path(args.csv)
    if not csv_path.exists():
        logger.error(f"CSV introuvable: {csv_path}")
        print("CSV introuvable. Vérifie le chemin.")
        return

    assets_root = Path(args.out) / ASSETS_SUBDIR
    items_dir = assets_root / "items"
    creatures_dir = assets_root / "creatures"
    ensure_dirs(items_dir)
    ensure_dirs(creatures_dir)

    # Lire CSV et construire mapping id -> info
    entries = []
    with csv_path.open("r", encoding="utf-8", newline="") as f:
        reader = csv.DictReader(f)
        for row in reader:
            # On s'attend à avoir au moins: id, category, name_en, image
            entries.append({
                "id": row.get("id", "").strip(),
                "category": row.get("category", "").strip(),
                "name_en": row.get("name_en", "").strip(),
                "name_fr": row.get("name_fr", "").strip(),
                "image": row.get("image", "").strip()
            })
    logger.info(f"{len(entries)} lignes lues depuis le CSV")

    # Télécharger images et construire mapping name_en -> local_path
    name_to_local = {}  # Name_EN -> (type, filename)
    for e in entries:
        name_en = e["name_en"]
        real_cat = e["category"]
        url = e["image"]
        if not name_en:
            logger.debug(f"Skip ligne sans name_en id={e.get('id')}")
            continue
        typ = determine_type(real_cat)
        if typ is None:
            logger.debug(f"Catégorie réelle '{real_cat}' non mappée à une catégorie virtuelle pour '{name_en}', skip")
            continue
        slug = slugify(name_en)
        filename = f"{slug}.png"
        dest_dir = items_dir if typ == "items" else creatures_dir
        dest_path = dest_dir / filename

        ok = download_image(url, dest_path, logger)
        if ok:
            rel_path = f"./{typ}/{filename}"
            name_to_local[name_en] = {"type": typ, "filename": filename, "rel_path": rel_path}
        else:
            logger.warning(f"Image non téléchargée pour '{name_en}' (url: {url})")

    logger.info(f"Images téléchargées/traitées: {len(name_to_local)}")

    # Mettre à jour les JSON dans output/ (fichiers satis-*.json)
    json_dir = Path(args.out)
    json_files = sorted([p for p in json_dir.glob("satis-*.json") if p.is_file()])
    logger.info(f"{len(json_files)} fichiers JSON trouvés dans {json_dir}")

    updated_count = 0
    for jf in json_files:
        try:
            with jf.open("r", encoding="utf-8") as f:
                data = json.load(f)
        except Exception as ex:
            logger.error(f"Impossible de lire JSON {jf}: {ex}")
            continue

        items = data.get("Items", [])
        changed = False
        for it in items:
            name_en = it.get("Name_EN") or it.get("Name")
            if not name_en:
                continue
            mapping = name_to_local.get(name_en)
            if mapping:
                new_path = mapping["rel_path"]
                if it.get("PictureMain") != new_path:
                    logger.debug(f"Update JSON {jf.name}: {name_en} -> {new_path}")
                    it["PictureMain"] = new_path
                    changed = True
            else:
                # Si pas trouvé par Name_EN, essayer par slug comparé
                slug = slugify(name_en)
                # chercher mapping par slug
                found = None
                for k, v in name_to_local.items():
                    if slugify(k) == slug:
                        found = v
                        break
                if found:
                    new_path = found["rel_path"]
                    if it.get("PictureMain") != new_path:
                        logger.debug(f"Update JSON {jf.name} (match slug): {name_en} -> {new_path}")
                        it["PictureMain"] = new_path
                        changed = True
                else:
                    logger.debug(f"Aucune image locale pour '{name_en}' dans {jf.name}")

        if changed:
            try:
                with jf.open("w", encoding="utf-8") as f:
                    json.dump(data, f, ensure_ascii=False, indent=2)
                updated_count += 1
                logger.info(f"JSON mis à jour: {jf} ({len(items)} items)")
            except Exception as ex:
                logger.exception(f"Erreur écriture JSON {jf}: {ex}")

    logger.info(f"Terminé. JSON modifiés: {updated_count}. Images traitées: {len(name_to_local)}")
    print("Terminé. Voir fix_pictures.log pour le détail.")

if __name__ == "__main__":
    main()
