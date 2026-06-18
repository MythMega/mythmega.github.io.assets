#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
script.py
Parcourt ./fr/ et ./en/ (export SSEEdit cells) et génère data.csv
Colonnes: id,name_fr,name_en,path_key,type
Usage: py script.py
"""
import csv
import logging
import re
from pathlib import Path

# --- configuration ---
BASE = Path(".").resolve()
FR_ROOT = BASE / "fr"
EN_ROOT = BASE / "en"
OUT_FILE = BASE / "data.csv"
LOG_FILE = BASE / "script.log"

# --- logging ---
logging.basicConfig(
    filename=str(LOG_FILE),
    filemode="w",
    level=logging.DEBUG,
    format="%(asctime)s %(levelname)s %(message)s"
)
console = logging.StreamHandler()
console.setLevel(logging.INFO)
formatter = logging.Formatter("%(message)s")
console.setFormatter(formatter)
logging.getLogger().addHandler(console)

# --- compiled regex (no multiline strings) ---
RE_BRACKET_ID = re.compile(r'\[([A-Z]+-)?([0-9A-Fa-f]{6,8})\]')
RE_HEX_FALLBACK = re.compile(r'([0-9A-Fa-f]{6,8})')

# --- helpers ---
def read_first_matching_file_text(folder: Path, keyword: str):
    """Retourne le contenu du premier fichier dont le nom contient keyword (insensible à la casse)."""
    try:
        if not folder.exists() or not folder.is_dir():
            return None
        for f in sorted(folder.iterdir()):
            if f.is_file() and keyword.lower() in f.name.lower():
                for enc in ("utf-8", "utf-8-sig", "latin-1"):
                    try:
                        text = f.read_text(encoding=enc, errors="ignore").strip()
                        logging.debug(f"Lu {f} avec enc {enc}")
                        return text
                    except Exception as e:
                        logging.debug(f"Erreur lecture {f} enc={enc}: {e}")
        return None
    except Exception as e:
        logging.exception(f"Erreur dans read_first_matching_file_text pour {folder}: {e}")
        return None

def extract_id_from_foldername(foldername: str):
    """Extrait un ID hex depuis le nom du dossier, ex [ARMO-0010F570] -> 0010F570."""
    try:
        m = RE_BRACKET_ID.search(foldername)
        if m:
            return m.group(2).upper()
        m2 = RE_HEX_FALLBACK.search(foldername)
        if m2:
            return m2.group(1).upper()
    except Exception as e:
        logging.debug(f"Erreur extract_id_from_foldername '{foldername}': {e}")
    return ""

def detect_type_from_category(category_name: str):
    """Détecte ARMO/WEAP/UNKNOWN depuis le nom du dossier catégorie."""
    n = category_name.lower()
    if "armor" in n or "armo" in n or "arm" in n:
        return "ARMO"
    if "weapon" in n or "weap" in n:
        return "WEAP"
    return "UNKNOWN"

def build_index(root: Path):
    """
    Construit un dict mapping path_key -> { 'id':..., 'name':..., 'type':... }
    path_key = plugin/category/item_folder
    """
    index = {}
    if not root.exists():
        logging.warning(f"Dossier introuvable: {root}")
        return index

    for plugin in sorted(root.iterdir()):
        if not plugin.is_dir():
            continue
        for category in sorted(plugin.iterdir()):
            if not category.is_dir():
                continue
            item_type = detect_type_from_category(category.name)
            for item in sorted(category.iterdir()):
                if not item.is_dir():
                    continue
                try:
                    rel_key = "/".join([plugin.name, category.name, item.name])
                    name = read_first_matching_file_text(item, "Name") or ""
                    edid = (read_first_matching_file_text(item, "EDID")
                            or read_first_matching_file_text(item, "edid")
                            or "")
                    if not edid:
                        edid = extract_id_from_foldername(item.name)
                    index[rel_key] = {
                        "id": edid.strip(),
                        "name": name.strip(),
                        "type": item_type
                    }
                except Exception as e:
                    logging.exception(f"Erreur traitement item {item}: {e}")
    return index

def write_csv(fr_index, en_index, out_path: Path):
    all_keys = sorted(set(fr_index.keys()) | set(en_index.keys()))
    try:
        with out_path.open("w", newline="", encoding="utf-8") as fh:
            writer = csv.writer(fh)
            writer.writerow(["id", "name_fr", "name_en", "path_key", "type"])
            for key in all_keys:
                fr = fr_index.get(key, {})
                en = en_index.get(key, {})
                id_val = fr.get("id") or en.get("id") or ""
                name_fr = fr.get("name", "")
                name_en = en.get("name", "")
                type_val = fr.get("type") or en.get("type") or "UNKNOWN"
                writer.writerow([id_val, name_fr, name_en, key, type_val])
        return len(all_keys)
    except Exception as e:
        logging.exception(f"Erreur écriture CSV {out_path}: {e}")
        return 0

# --- main ---
def main():
    logging.info(f"Racine script: {BASE}")
    logging.info(f"Recherche ./fr -> {FR_ROOT}")
    logging.info(f"Recherche ./en -> {EN_ROOT}")

    fr_index = build_index(FR_ROOT)
    en_index = build_index(EN_ROOT)

    logging.info(f"Entrées FR: {len(fr_index)}")
    logging.info(f"Entrées EN: {len(en_index)}")

    total = write_csv(fr_index, en_index, OUT_FILE)
    logging.info(f"Export terminé: {OUT_FILE} ({total} lignes)")
    logging.info(f"Log détaillé: {LOG_FILE}")

if __name__ == "__main__":
    main()
