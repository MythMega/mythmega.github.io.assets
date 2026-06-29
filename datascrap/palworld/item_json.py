#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import re
from pathlib import Path
from collections import defaultdict

INPUT = Path("./items.json")
OUT_DIR = Path("./generated_json")
OUT_DIR.mkdir(parents=True, exist_ok=True)

def slugify(s: str) -> str:
    s = s.strip().lower()
    s = re.sub(r"[^\w\s-]", "", s)
    s = re.sub(r"[\s\-]+", "_", s)
    return s

def make_base_structure(title: str):
    return {
        "Name": title,
        "Category": "Palworld",
        "Subcategory": "Items",
        "Quantizable": False,
        "Items": []
    }

def item_to_entry(item: dict):
    name = item.get("name", "")
    image = item.get("image", "")
    idx = slugify(name) if name else ""
    return {
        "Index": idx,
        "Name_FR": name,
        "Name_EN": name,
        "PictureMain": image
    }

def load_items(path: Path):
    if not path.exists():
        raise FileNotFoundError(f"Input file not found: {path}")
    with path.open("r", encoding="utf-8") as f:
        data = json.load(f)
    return data

def group_items(items):
    # groups[type][rarity] -> list of items
    groups = defaultdict(lambda: defaultdict(list))
    rarities_set = set()
    types_set = set()
    for it in items:
        typ = it.get("type", "Unknown").strip().lower()
        stats = it.get("stats", {}) or {}
        rarity = stats.get("Rarity", 0)
        try:
            rarity = int(rarity)
        except Exception:
            rarity = 0
        groups[typ][rarity].append(it)
        rarities_set.add(rarity)
        types_set.add(typ)
    return groups, sorted(rarities_set), sorted(types_set)

def write_json(path: Path, obj):
    with path.open("w", encoding="utf-8") as f:
        json.dump(obj, f, ensure_ascii=False, indent=2)

def generate_for_type_and_rarity(out_dir: Path, typ: str, rarity: int, items_list: list):
    title = f"Palworld - Items {typ}/rarity {rarity}"
    base = make_base_structure(title)
    base["Items"] = [item_to_entry(it) for it in items_list]
    filename = out_dir / f"items_{typ}_rarity_{rarity}.json"
    write_json(filename, base)

def generate_for_type_all_rarities(out_dir: Path, typ: str, items_all: list):
    title = f"Palworld - Items {typ}/all rarities"
    base = make_base_structure(title)
    base["Items"] = [item_to_entry(it) for it in items_all]
    filename = out_dir / f"items_{typ}_all_rarities.json"
    write_json(filename, base)

def generate_for_type_andbelow(out_dir: Path, typ: str, threshold: int, items_by_rarity: dict):
    # collect items with rarity <= threshold
    collected = []
    for r, items in items_by_rarity.items():
        if r <= threshold:
            collected.extend(items)
    title = f"Palworld - Items {typ}/rarity {threshold} and below"
    base = make_base_structure(title)
    base["Items"] = [item_to_entry(it) for it in collected]
    filename = out_dir / f"items_{typ}_rarity_{threshold}_andbelow.json"
    write_json(filename, base)

def generate_global_files(out_dir: Path, groups, rarities, types):
    # all types + per rarity across types
    # 1) all types all rarities
    all_items = []
    for typ in types:
        for r in groups[typ]:
            all_items.extend(groups[typ][r])
    title = "Palworld - Items all types/all rarities"
    write_json(out_dir / "items_all_types_all_rarities.json", make_base_structure(title) | {"Items": [item_to_entry(it) for it in all_items]})

    # 2) all types per rarity
    for r in rarities:
        collected = []
        for typ in types:
            collected.extend(groups[typ].get(r, []))
        title = f"Palworld - Items all types/rarity {r}"
        write_json(out_dir / f"items_all_types_rarity_{r}.json", make_base_structure(title) | {"Items": [item_to_entry(it) for it in collected]})

    # 3) all types andbelow for each rarity threshold
    for threshold in rarities:
        collected = []
        for typ in types:
            for r, items in groups[typ].items():
                if r <= threshold:
                    collected.extend(items)
        title = f"Palworld - Items all types/rarity {threshold} and below"
        write_json(out_dir / f"items_all_types_rarity_{threshold}_andbelow.json", make_base_structure(title) | {"Items": [item_to_entry(it) for it in collected]})

def main():
    items = load_items(INPUT)
    groups, rarities, types = group_items(items)

    # Per-type files
    for typ in types:
        # gather all items for this type
        items_all_for_type = []
        for r in groups[typ]:
            items_all_for_type.extend(groups[typ][r])

        # all rarities for this type
        generate_for_type_all_rarities(OUT_DIR, typ, items_all_for_type)

        # per rarity for this type
        for r in groups[typ]:
            generate_for_type_and_rarity(OUT_DIR, typ, r, groups[typ][r])

        # andbelow for thresholds based on global rarities set
        for threshold in rarities:
            generate_for_type_andbelow(OUT_DIR, typ, threshold, groups[typ])

    # Global files across types
    generate_global_files(OUT_DIR, groups, rarities, types)

    print(f"Generated JSON files in {OUT_DIR} (types: {len(types)}, rarities: {len(rarities)})")

if __name__ == "__main__":
    main()
