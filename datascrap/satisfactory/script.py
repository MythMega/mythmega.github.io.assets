#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
satisfactory_extract.py
Lit en-Stable.json et fr-Stable.json, extrait items + fauna, produit CSV nettoyé et JSON par catégorie.
Usage: python3 satisfactory_extract.py [--en en-Stable.json] [--fr fr-Stable.json] [--out output_dir]
"""

import json
import csv
import os
import sys
import argparse
import logging
from logging.handlers import RotatingFileHandler
from collections import OrderedDict

# ---------------------------
# Configuration (modifiable)
# ---------------------------
DEFAULT_EN = "en-Stable.json"
DEFAULT_FR = "fr-Stable.json"
DEFAULT_OUTDIR = "output"
CSV_FILENAME = "filtered_items.csv"
LOG_FILENAME = "result.log"

# Virtual categories: configurable lists of real categories to include
VIRTUAL_CATEGORIES = {
    "all creatures": ["wildlife", "enemy", "animal"],
    "all items": [
        "ore", "ingot", "mineral", "liquid", "gas", "standard", "industrial",
        "electronic", "communication", "quantum", "container", "fuel",
        "consumed", "ammo", "nuclear", "waste", "special"
    ]
}

# JSON template metadata
JSON_VERSION = "1.1"
JSON_CATEGORY_NAME_PREFIX = "Satisfactory"
JSON_CATEGORY_FIELD = "Satisfactory"
# Starting index for items inside each JSON file
INDEX_START = 10001

# Required fields for an entry to be kept
REQUIRED_FIELDS = ["id", "category", "name_en", "name_fr", "description_en", "description_fr", "image"]

# ---------------------------
# Logging setup (console + file)
# ---------------------------
def setup_logging(log_file):
    logger = logging.getLogger("satisfactory_extract")
    logger.setLevel(logging.DEBUG)
    # Console handler
    ch = logging.StreamHandler(sys.stdout)
    ch.setLevel(logging.INFO)
    ch_formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s", "%H:%M:%S")
    ch.setFormatter(ch_formatter)
    # File handler (rotating)
    fh = RotatingFileHandler(log_file, maxBytes=5*1024*1024, backupCount=2, encoding="utf-8")
    fh.setLevel(logging.DEBUG)
    fh_formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")
    fh.setFormatter(fh_formatter)
    # Avoid duplicate handlers
    if not logger.handlers:
        logger.addHandler(ch)
        logger.addHandler(fh)
    return logger

# ---------------------------
# Helpers
# ---------------------------
def safe_get(d, key):
    return d.get(key) if isinstance(d, dict) else None

def ensure_dir(path):
    if not os.path.exists(path):
        os.makedirs(path)

# ---------------------------
# Extraction logic
# ---------------------------
def load_json_file(path, logger):
    logger.info(f"Chargement du fichier JSON : {path}")
    try:
        with open(path, "r", encoding="utf-8") as f:
            data = json.load(f)
        logger.debug(f"Fichier {path} chargé, clés racine: {list(data.keys())[:10]}")
        return data
    except Exception as e:
        logger.exception(f"Erreur lors du chargement de {path}: {e}")
        raise

def extract_entries(en_data, fr_data, logger):
    """
    Parcourt itemsData et faunaData dans en_data, récupère les champs demandés,
    récupère les traductions correspondantes dans fr_data via le même id.
    Retourne une liste d'OrderedDict avec les champs standardisés.
    """
    entries = []
    sections = ["itemsData", "faunaData"]
    for section in sections:
        en_section = safe_get(en_data, section) or {}
        fr_section = safe_get(fr_data, section) or {}
        logger.info(f"Traitement de la section {section} ({len(en_section)} entrées trouvées dans EN)")
        for id_key, en_obj in en_section.items():
            # id_key est l'identifiant (ex: Desc_Stone_C ou Char_SpaceRabbit_C)
            fr_obj = fr_section.get(id_key, {})
            # Récupération champs
            category = en_obj.get("category") or fr_obj.get("category") or ""
            name_en = en_obj.get("name") or ""
            name_fr = fr_obj.get("name") or ""
            description_en = en_obj.get("description") or ""
            description_fr = fr_obj.get("description") or ""
            image = en_obj.get("image") or fr_obj.get("image") or ""
            entry = OrderedDict([
                ("id", id_key),
                ("category", category),
                ("name_en", name_en),
                ("name_fr", name_fr),
                ("description_en", description_en),
                ("description_fr", description_fr),
                ("image", image),
                ("source_section", section)
            ])
            entries.append(entry)
    logger.info(f"Extraction terminée : {len(entries)} entrées extraites (avant filtrage)")
    return entries

# ---------------------------
# CSV writing and sanitization
# ---------------------------
def write_csv(entries, csv_path, logger):
    logger.info(f"Ecriture du CSV brut : {csv_path}")
    fieldnames = ["id", "category", "name_en", "name_fr", "description_en", "description_fr", "image", "source_section"]
    with open(csv_path, "w", encoding="utf-8", newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for e in entries:
            writer.writerow(e)
    logger.info("CSV brut écrit.")

def sanitize_entries(entries, logger):
    """
    - Supprime doublons basés sur name_en (casefold)
    - Garde uniquement les entrées ayant tous les champs obligatoires non vides
    - Retourne la liste nettoyée
    """
    logger.info("Démarrage de la sanitization des entrées.")
    seen = set()
    cleaned = []
    total = len(entries)
    skipped_missing = 0
    skipped_dup = 0
    for e in entries:
        # Vérifier champs obligatoires non vides
        missing = [f for f in REQUIRED_FIELDS if not e.get(f)]
        if missing:
            skipped_missing += 1
            logger.debug(f"Skip (champs manquants) id={e.get('id')} missing={missing}")
            continue
        key = e["name_en"].casefold()
        if key in seen:
            skipped_dup += 1
            logger.debug(f"Skip (doublon) name_en={e['name_en']} id={e['id']}")
            continue
        seen.add(key)
        cleaned.append(e)
    logger.info(f"Sanitization terminée : {len(cleaned)} conservés, {skipped_dup} doublons supprimés, {skipped_missing} entrées incomplètes supprimées (sur {total}).")
    return cleaned

# ---------------------------
# JSON generation per category
# ---------------------------
def group_by_category(entries):
    grouped = {}
    for e in entries:
        cat = e["category"]
        grouped.setdefault(cat, []).append(e)
    return grouped

def build_json_for_category(category, items, start_index=INDEX_START):
    """
    Construit la structure JSON demandée pour une catégorie.
    Chaque item contient Index, Name_FR, Name_EN, PictureMain
    """
    # juste pour rendre la category plus jolie a l'affichage dans le nom
    category_title = (category or "").strip().title()
    json_obj = {
        "Name": f"{JSON_CATEGORY_NAME_PREFIX} - {category_title} - {JSON_VERSION}",
        "Category": JSON_CATEGORY_FIELD,
        "Subcategory": f"{JSON_CATEGORY_NAME_PREFIX} - {JSON_VERSION}",
        "Items": []
    }
    idx = start_index
    for it in items:
        item_obj = {
            "Index": idx,
            "Name_FR": it["name_fr"],
            "Name_EN": it["name_en"],
            "PictureMain": it["image"]
        }
        json_obj["Items"].append(item_obj)
        idx += 1
    return json_obj

def write_json_file(obj, path, logger):
    try:
        with open(path, "w", encoding="utf-8") as f:
            json.dump(obj, f, ensure_ascii=False, indent=2)
        logger.info(f"JSON écrit : {path} ({len(obj.get('Items', []))} items)")
    except Exception as e:
        logger.exception(f"Erreur écriture JSON {path}: {e}")

# ---------------------------
# Main
# ---------------------------
def main():
    parser = argparse.ArgumentParser(description="Extract Satisfactory items and fauna, produce CSV and JSON per category.")
    parser.add_argument("--en", default=DEFAULT_EN, help="Fichier JSON anglais (par défaut en-Stable.json)")
    parser.add_argument("--fr", default=DEFAULT_FR, help="Fichier JSON français (par défaut fr-Stable.json)")
    parser.add_argument("--out", default=DEFAULT_OUTDIR, help="Dossier de sortie pour les JSON")
    args = parser.parse_args()

    logger = setup_logging(LOG_FILENAME)
    logger.info("=== Début du traitement Satisfactory ===")
    logger.info(f"Fichiers: EN={args.en} FR={args.fr} Output={args.out}")

    # Charger JSONs
    en_data = load_json_file(args.en, logger)
    fr_data = load_json_file(args.fr, logger)

    # Extraire
    entries = extract_entries(en_data, fr_data, logger)

    # Ecrire CSV brut
    write_csv(entries, CSV_FILENAME, logger)

    # Sanitize
    cleaned = sanitize_entries(entries, logger)

    # Ecrire CSV nettoyé (remplace le CSV initial)
    logger.info(f"Ecriture du CSV nettoyé: {CSV_FILENAME}")
    write_csv(cleaned, CSV_FILENAME, logger)

    # Grouper par catégorie réelle
    grouped = group_by_category(cleaned)
    logger.info(f"Catégories réelles trouvées: {list(grouped.keys())}")

    # Préparer dossier de sortie
    ensure_dir(args.out)

    # Générer JSON par catégorie réelle
    for cat, items in grouped.items():
        safe_cat = cat.replace(" ", "_")
        filename = f"satis-{safe_cat}-{JSON_VERSION}.json"
        path = os.path.join(args.out, filename)
        json_obj = build_json_for_category(cat, items, start_index=INDEX_START)
        write_json_file(json_obj, path, logger)

    # Générer catégories virtuelles configurables
    for virt_name, real_list in VIRTUAL_CATEGORIES.items():
        logger.info(f"Construction de la catégorie virtuelle '{virt_name}' à partir de {real_list}")
        combined_items = []
        for real_cat in real_list:
            items = grouped.get(real_cat, [])
            if not items:
                logger.debug(f"Aucun item trouvé pour la catégorie réelle '{real_cat}'")
            combined_items.extend(items)
        # Dédupliquer à nouveau par name_en (au cas où)
        dedup = []
        seen = set()
        for it in combined_items:
            key = it["name_en"].casefold()
            if key in seen:
                continue
            seen.add(key)
            dedup.append(it)
        safe_name = virt_name.replace(" ", "_")
        filename = f"satis-{safe_name}-{JSON_VERSION}.json"
        path = os.path.join(args.out, filename)
        json_obj = build_json_for_category(virt_name, dedup, start_index=INDEX_START)
        write_json_file(json_obj, path, logger)

    logger.info("=== Traitement terminé ===")
    logger.info(f"CSV final: {CSV_FILENAME}")
    logger.info(f"JSONs écrits dans: {args.out}")
    print("Terminé. Voir result.log pour le détail du traitement.")

if __name__ == "__main__":
    main()
