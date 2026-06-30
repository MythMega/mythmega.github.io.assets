#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from pathlib import Path

# Configuration
INPUT_FILE = Path("result.json")
OUTPUT_DIR = Path("out_json")
BASE_URL = "https://raw.githubusercontent.com/MythMega/mythmega.github.io.assets/refs/heads/master/assets/category/slimerancher/"

# Mapping release -> Category name and filename prefix
RELEASE_MAP = {
    1: {"category": "Slime Rancher", "prefix": "slimerancher"},
    2: {"category": "Slime Rancher 2", "prefix": "slimerancher2"},
}

# Charge le fichier result.json
with INPUT_FILE.open(encoding="utf-8") as f:
    data = json.load(f)

# Prépare structure: release -> type -> list(items)
groups = {}
for idx, item in enumerate(data, start=1):
    release = item.get("release")
    typ = item.get("type", "").strip()
    name = item.get("Item_name", "").strip()
    path = item.get("path", "").strip()

    if release not in RELEASE_MAP:
        # Ignore ou créer une catégorie générique si nécessaire
        continue

    # Normalise path: retire le préfixe "./" s'il existe
    normalized_path = path[2:] if path.startswith("./") else path

    picture_url = BASE_URL + normalized_path

    # Prépare l'objet item selon le format demandé
    out_item = {
        "Index": f"sr-{idx}",
        "Name_FR": name,
        "Name_EN": name,
        "PictureMain": picture_url
    }

    groups.setdefault(release, {}).setdefault(typ, []).append(out_item)

# Crée le dossier de sortie
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# Pour chaque release, écrit un JSON par type et un allitems (sans type "slime")
for release, types_dict in groups.items():
    release_info = RELEASE_MAP.get(release)
    if not release_info:
        continue

    category_name = release_info["category"]
    prefix = release_info["prefix"]

    # allitems: concatène tous les types sauf "slime" (case-insensitive)
    all_items = []
    for typ, items in types_dict.items():
        if typ.lower() == "slime":
            continue
        all_items.extend(items)

    # Écrit le fichier allitems s'il y a des éléments
    if all_items:
        all_json = {
            "Name": f"{category_name} - All items",
            "Category": category_name,
            "Subcategory": "allitems",
            "Quantizable": False,
            "Items": all_items
        }
        out_path = OUTPUT_DIR / f"{prefix}-allitems.json"
        with out_path.open("w", encoding="utf-8") as f:
            json.dump(all_json, f, ensure_ascii=False, indent=2)

    # Écrit un fichier par type
    for typ, items in types_dict.items():
        # Nom de sous-catégorie tel que demandé
        subcategory = typ
        name_field = f"{category_name} - {subcategory}"
        out_json = {
            "Name": name_field,
            "Category": category_name,
            "Subcategory": subcategory,
            "Quantizable": False,
            "Items": items
        }
        # safe filename: remplace espaces par underscore et retire caractères problématiques
        safe_typ = "".join(c if c.isalnum() or c in ("_", "-") else "_" for c in typ)
        filename = f"{prefix}-{safe_typ}.json"
        out_path = OUTPUT_DIR / filename
        with out_path.open("w", encoding="utf-8") as f:
            json.dump(out_json, f, ensure_ascii=False, indent=2)

print(f"Terminé. Fichiers écrits dans: {OUTPUT_DIR.resolve()}")
