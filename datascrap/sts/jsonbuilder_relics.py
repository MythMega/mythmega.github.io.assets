#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import re
from pathlib import Path
from collections import defaultdict

# INPUT FILES (modifiez les chemins si besoin)
STS1_PATH = Path("./sts1_relics.json")
STS2_PATH = Path("./sts2_relics.json")

# OUTPUT BASE
OUT_BASE = Path("./generated_json")
OUT_STS1 = OUT_BASE / "sts1"
OUT_STS2 = OUT_BASE / "sts2"
OUT_STS1.mkdir(parents=True, exist_ok=True)
OUT_STS2.mkdir(parents=True, exist_ok=True)

def slugify(s: str) -> str:
    s = (s or "").strip().lower()
    s = re.sub(r"[^\w\s-]", "", s)
    s = re.sub(r"[\s\-]+", "_", s)
    return s or "unknown"

def make_base_structure(title: str, category: str):
    return {
        "Name": title,
        "Category": category,
        "Subcategory": "Relics",
        "Quantizable": False,
        "Items": []
    }

def relic_to_entry(relic: dict, index: int):
    name = relic.get("name", "")
    image = relic.get("image", "")
    return {
        "Index": str(index),
        "Name_FR": name,
        "Name_EN": name,
        "PictureMain": image
    }

def load_json(path: Path):
    if not path.exists():
        print(f"Warning: {path} not found. Skipping.")
        return []
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)

def group_and_write(relics: list, game_label: str, out_dir: Path, filename_prefix: str):
    """
    relics: list of relic dicts with keys name,image,rarity,character
    game_label: "Slay The Spire" or "Slay The Spire 2"
    out_dir: output folder Path
    filename_prefix: "sts" or "sts2" used for filenames
    """
    # collect characters (exclude "Any" from the set of explicit characters)
    characters = set()
    for r in relics:
        ch = (r.get("character") or "").strip()
        if ch and ch.lower() != "any":
            characters.add(ch)
    characters = sorted(characters)

    # prepare list of relics with character == "Any"
    any_relics = [r for r in relics if (r.get("character") or "").strip().lower() == "any"]

    # create per-character files: include relics for that character + all "Any" relics
    for ch in characters:
        collected = [r for r in relics if (r.get("character") or "").strip().lower() == ch.lower()]
        # include Any relics
        collected = collected + any_relics
        # build structure
        title = f"{game_label} - Relics - {ch}"
        base = make_base_structure(title, game_label)
        # auto-increment index starting at 1
        items = [relic_to_entry(r, i+1) for i, r in enumerate(collected)]
        base["Items"] = items
        fname = out_dir / f"{filename_prefix}-relics-{slugify(ch)}.json"
        with fname.open("w", encoding="utf-8") as f:
            json.dump(base, f, ensure_ascii=False, indent=2)

    # also create an "all_characters" file that contains everything (including Any)
    title_all = f"{game_label} - Relics - All Characters"
    base_all = make_base_structure(title_all, game_label)
    all_items = [relic_to_entry(r, i+1) for i, r in enumerate(relics)]
    base_all["Items"] = all_items
    fname_all = out_dir / f"{filename_prefix}-relics-all_characters.json"
    with fname_all.open("w", encoding="utf-8") as f:
        json.dump(base_all, f, ensure_ascii=False, indent=2)

    # optional: create a file for "Any" group only (relics that had character == "Any")
    if any_relics:
        title_any = f"{game_label} - Relics - Any"
        base_any = make_base_structure(title_any, game_label)
        base_any["Items"] = [relic_to_entry(r, i+1) for i, r in enumerate(any_relics)]
        fname_any = out_dir / f"{filename_prefix}-relics-any.json"
        with fname_any.open("w", encoding="utf-8") as f:
            json.dump(base_any, f, ensure_ascii=False, indent=2)

    print(f"Wrote {len(characters)} character files + all_characters (and any if present) to {out_dir}")

def main():
    sts1 = load_json(STS1_PATH)
    sts2 = load_json(STS2_PATH)

    if sts1:
        group_and_write(sts1, "Slay The Spire", OUT_STS1, "sts")
    if sts2:
        group_and_write(sts2, "Slay The Spire 2", OUT_STS2, "sts2")

if __name__ == "__main__":
    main()
