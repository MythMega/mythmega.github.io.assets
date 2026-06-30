#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Génère plusieurs fichiers JSON au format demandé à partir de :
 - raft.json      (liste complète des items avec champs item_name, category, imgpath)
 - jsonlist.json  (liste des exports à produire avec champs output, included_cats)

Usage:
    python3 build_raft_exports.py --raft raft.json --list jsonlist.json --outdir ./outputs

Chaque fichier produit aura l'en-tête :
{
  "Name": "Raft - {jsonlist.output}",
  "Category": "Raft",
  "Subcategory": "Raft 1.0",
  "Quantizable": true,
  "DefaultQuantities": { "Max": 99, "Min": 1 },
  "Items": [ ... ]
}

Chaque item dans Items :
{
  "Index": "raft-{index_dans_raft.json}",
  "Name_FR": item_name,
  "Name_EN": item_name,
  "PictureMain": imgpath
}
"""

import json
import argparse
from pathlib import Path
import re
import sys

def sanitize_filename(name: str) -> str:
    """Crée un nom de fichier sûr à partir d'une chaîne (remplace caractères invalides)."""
    name = name.strip()
    # Remplacer les slashs et caractères problématiques par underscore
    name = re.sub(r'[\\/:"*?<>|]+', '_', name)
    # Remplacer espaces multiples par un seul espace, puis par underscore pour fichier
    name = re.sub(r'\s+', ' ', name).strip()
    name = name.replace(' ', '_')
    return name

def load_json(path: Path):
    try:
        with path.open('r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"Erreur lecture JSON '{path}': {e}", file=sys.stderr)
        raise

def build_export(raft_items: list, included_cats: list, output_title: str):
    """
    Construit la structure JSON demandée en filtrant raft_items selon included_cats.
    included_cats est une liste de catégories à inclure.
    """
    header = {
        "Name": f"Raft - {output_title}",
        "Category": "Raft",
        "Subcategory": "Raft 1.0",
        "Quantizable": True,
        "DefaultQuantities": {
            "Max": 99,
            "Min": 1
        },
        "Items": []
    }

    # Parcourir raft_items en conservant l'index d'origine (1-based)
    for idx, item in enumerate(raft_items, start=1):
        item_name = item.get("item_name", "").strip()
        category = item.get("category", "").strip()
        imgpath = item.get("imgpath", "").strip()

        # Si included_cats contient la catégorie, on inclut l'item
        if category in included_cats:
            header["Items"].append({
                "Index": f"raft-{idx}",
                "Name_FR": item_name,
                "Name_EN": item_name,
                "PictureMain": imgpath
            })

    return header

def main():
    parser = argparse.ArgumentParser(description="Génère plusieurs exports JSON Raft à partir de raft.json et jsonlist.json")
    parser.add_argument("--raft", "-r", required=True, help="Chemin vers raft.json")
    parser.add_argument("--list", "-l", required=True, help="Chemin vers jsonlist.json")
    parser.add_argument("--outdir", "-o", default=".", help="Dossier de sortie pour les fichiers générés")
    args = parser.parse_args()

    raft_path = Path(args.raft)
    list_path = Path(args.list)
    outdir = Path(args.outdir)
    outdir.mkdir(parents=True, exist_ok=True)

    raft_items = load_json(raft_path)
    jsonlist = load_json(list_path)

    if not isinstance(raft_items, list):
        raise SystemExit("raft.json doit contenir une liste d'objets.")
    if not isinstance(jsonlist, list):
        raise SystemExit("jsonlist.json doit contenir une liste d'objets.")

    for entry in jsonlist:
        output_title = entry.get("output", "Unnamed")
        included_cats = entry.get("included_cats", [])
        if not isinstance(included_cats, list):
            included_cats = []

        export_data = build_export(raft_items, included_cats, output_title)

        filename = f"Raft - {sanitize_filename(output_title)}.json"
        outpath = outdir / filename

        with outpath.open("w", encoding="utf-8") as f:
            json.dump(export_data, f, ensure_ascii=False, indent=2)

        print(f"Fichier généré: {outpath} (items: {len(export_data['Items'])})")

if __name__ == "__main__":
    main()
