#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
from pathlib import Path
import sys

# INPUT FILES (explicit)
INPUT_FILES = {
    "sts1": {
        "elites": Path("sts1_elites.json"),
        "enemies": Path("sts1_enemies.json"),
        "monsters": Path("sts1_monsters.json"),
    },
    "sts2": {
        "elites": Path("sts2_elites.json"),
        "enemies": Path("sts2_enemies.json"),
        "monsters": Path("sts2_monsters.json"),
    }
}

OUT_BASE = Path("./generated_json")
OUT_STS1 = OUT_BASE / "sts1"
OUT_STS2 = OUT_BASE / "sts2"
OUT_STS1.mkdir(parents=True, exist_ok=True)
OUT_STS2.mkdir(parents=True, exist_ok=True)

TYPE_NAME_MAP = {
    "elites": "Elites",
    "monsters": "Monsters",
    "enemies": "All Enemies"
}

def load_json(path: Path):
    if not path.exists():
        print(f"Warning: {path} not found. Skipping.", file=sys.stderr)
        return []
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)

def make_base_structure(title: str, category: str):
    return {
        "Name": title,
        "Category": category,
        "Subcategory": "Enemies",
        "Quantizable": False,
        "Items": []
    }

def enemy_to_entry(enemy: dict, index: int):
    name = enemy.get("name", "")
    image = enemy.get("image", "")
    return {
        "Index": str(index),
        "Name_FR": name,
        "Name_EN": name,
        "PictureMain": image
    }

def process_game(game_key: str, mapping: dict):
    is_sts2 = (game_key == "sts2")
    game_label = "Slay The Spire (2)" if is_sts2 else "Slay The Spire"
    out_dir = OUT_STS2 if is_sts2 else OUT_STS1
    prefix = "sts2" if is_sts2 else "sts"

    for typ, in_path in mapping.items():
        data = load_json(in_path)
        if not data:
            continue
        title = f"{game_label} - {TYPE_NAME_MAP.get(typ, typ.title())}"
        base = make_base_structure(title, game_label)
        items = [enemy_to_entry(e, i+1) for i, e in enumerate(data)]
        base["Items"] = items
        out_filename = f"{prefix}-{typ}.json"
        out_path = out_dir / out_filename
        with out_path.open("w", encoding="utf-8") as f:
            json.dump(base, f, ensure_ascii=False, indent=2)
        print(f"Wrote {out_path} ({len(items)} items)")

def main():
    # Traiter STS1 puis STS2 explicitement
    process_game("sts1", INPUT_FILES["sts1"])
    process_game("sts2", INPUT_FILES["sts2"])

if __name__ == "__main__":
    main()
