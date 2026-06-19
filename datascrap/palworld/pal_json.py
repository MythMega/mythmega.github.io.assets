import json
import string
from collections import defaultdict
from pathlib import Path

INPUT_PATH = Path("./pals.json")
OUTPUT1 = Path("./generated_json/all_pals.json")
OUTPUT2 = Path("./generated_json/all_pals_plus_terraria.json")

def make_base_structure(title):
    return {
        "Name": title,
        "Category": "Palworld",
        "Subcategory": "Pals",
        "Quantizable": False,
        "Items": []
    }

def safe_index_with_suffix(index_str, counter):
    """
    Retourne index_str si différent de "-1".
    Si index_str == "-1", ajoute un suffixe 'a','b',... selon counter (int).
    Si counter >= 26, utilise un suffixe numérique (ex: -1_27).
    """
    if index_str != "-1":
        return index_str
    if counter < 26:
        return f"-1{string.ascii_lowercase[counter]}"
    return f"-1_{counter+1}"

def build_items(entries, include_minus_one=False):
    """
    Construit la liste d'items à partir des entrées.
    Si include_minus_one est False, on ignore les entrées avec index == "-1".
    Si include_minus_one est True, on inclut toutes les entrées et on suffixe les '-1' répétés.
    """
    items = []
    minus_one_counter = 0
    # Si on veut suffixer plusieurs index identiques autres que "-1", on pourrait généraliser.
    for entry in entries:
        idx = entry.get("index", "")
        # Normaliser en chaîne
        idx_str = str(idx)
        if idx_str == "-1" and not include_minus_one:
            continue
        if idx_str == "-1" and include_minus_one:
            final_index = safe_index_with_suffix(idx_str, minus_one_counter)
            minus_one_counter += 1
        else:
            final_index = idx_str
        item = {
            "Index": final_index,
            "Name_FR": entry.get("name", ""),
            "Name_EN": entry.get("name", ""),
            "PictureMain": entry.get("image", "")
        }
        items.append(item)
    return items

def main():
    if not INPUT_PATH.exists():
        raise FileNotFoundError(f"Fichier introuvable: {INPUT_PATH}")

    with INPUT_PATH.open("r", encoding="utf-8") as f:
        data = json.load(f)

    # Structure 1 : sans les index "-1"
    out1 = make_base_structure("Palworld - All Pals")
    out1["Items"] = build_items(data, include_minus_one=False)

    # Structure 2 : avec les "-1" suffixés
    out2 = make_base_structure("Palworld - All Pals (Terraria Collab Included)")
    out2["Items"] = build_items(data, include_minus_one=True)

    # Écrire les fichiers
    with OUTPUT1.open("w", encoding="utf-8") as f:
        json.dump(out1, f, ensure_ascii=False, indent=2)

    with OUTPUT2.open("w", encoding="utf-8") as f:
        json.dump(out2, f, ensure_ascii=False, indent=2)

    print(f"Fichiers générés : {OUTPUT1} ({len(out1['Items'])} items), {OUTPUT2} ({len(out2['Items'])} items)")

if __name__ == "__main__":
    main()
