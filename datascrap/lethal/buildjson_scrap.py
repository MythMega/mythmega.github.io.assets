#!/usr/bin/env python3
"""
Génère un JSON au format demandé à partir d'un fichier scrap.json.

Usage:
    python3 build_scrap_json.py --input scrap.json --output lethalcompany_scrap_v81.json
"""

import json
import argparse
from pathlib import Path

def build_output(items):
    out = {
        "Name": "Lethal Company - Scrap",
        "Category": "Lethal Company",
        "Subcategory": "V81",
        "Quantizable": False,
        "Items": []
    }

    for i, entry in enumerate(items, start=1):
        name = entry.get("item_name", "").strip()
        img = entry.get("imgpath", "").strip()

        # Skip empty entries
        if not name and not img:
            continue

        out["Items"].append({
            "Index": str(i),
            "Name_FR": name,
            "Name_EN": name,
            "PictureMain": img
        })

    return out

def main():
    parser = argparse.ArgumentParser(description="Build Lethal Company - Scrap JSON from scrap.json")
    parser.add_argument("--input", "-i", required=True, help="Path to scrap.json")
    parser.add_argument("--output", "-o", required=False, help="Output JSON path (default: lethalcompany_scrap_v81.json)")
    args = parser.parse_args()

    input_path = Path(args.input)
    if not input_path.is_file():
        raise SystemExit(f"Fichier introuvable: {input_path}")

    output_path = Path(args.output) if args.output else Path("lethalcompany_scrap_v81.json")

    with input_path.open("r", encoding="utf-8") as f:
        try:
            data = json.load(f)
            if not isinstance(data, list):
                raise ValueError("Le fichier d'entrée doit contenir une liste d'objets.")
        except json.JSONDecodeError as e:
            raise SystemExit(f"Erreur JSON: {e}")

    result = build_output(data)

    with output_path.open("w", encoding="utf-8") as f:
        json.dump(result, f, ensure_ascii=False, indent=2)

    print(f"Fichier généré: {output_path}")

if __name__ == "__main__":
    main()
