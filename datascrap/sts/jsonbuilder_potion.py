#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from pathlib import Path

# Entrées
STS1_PATH = Path("./sts1_potions.json")
STS2_PATH = Path("./sts2_potions.json")

# Sorties
OUT_BASE = Path("./generated_json")
OUT_STS1 = OUT_BASE / "sts1"
OUT_STS2 = OUT_BASE / "sts2"
OUT_STS1.mkdir(parents=True, exist_ok=True)
OUT_STS2.mkdir(parents=True, exist_ok=True)

def load_json(path: Path):
    if not path.exists():
        print(f"Warning: {path} not found. Skipping.")
        return []
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)

def make_base_structure(name: str, category: str):
    return {
        "Name": name,
        "Category": category,
        "Subcategory": "Potions",
        "Quantizable": False,
        "Items": []
    }

def potion_to_entry(potion: dict, index: int):
    name = potion.get("name", "")
    image = potion.get("image", "")
    return {
        "Index": str(index),
        "Name_FR": name,
        "Name_EN": name,
        "PictureMain": image
    }

def generate_file(potions: list, game_label: str, out_path: Path, filename: str):
    title = f"{game_label} - Potions"
    base = make_base_structure(title, game_label)
    items = [potion_to_entry(p, i+1) for i, p in enumerate(potions)]
    base["Items"] = items
    with (out_path / filename).open("w", encoding="utf-8") as f:
        json.dump(base, f, ensure_ascii=False, indent=2)
    print(f"Wrote {out_path / filename} ({len(items)} items)")

def main():
    sts1 = load_json(STS1_PATH)
    sts2 = load_json(STS2_PATH)

    if sts1:
        generate_file(sts1, "Slay The Spire", OUT_STS1, "sts-potions.json")
    if sts2:
        generate_file(sts2, "Slay The Spire 2", OUT_STS2, "sts2-potions.json")

if __name__ == "__main__":
    main()
