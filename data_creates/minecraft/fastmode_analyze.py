import json

# --- CONFIG ---
FILE_FULL = "mc26.3.q-full-simpl.json"
FILE_FASTED = "mc26.3.q-full-simpl_fasted.json"
OUTPUT_FILE = "_fastmode.json"

def load_items(path):
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
        return {item["Index"]: item for item in data.get("Items", [])}

def main():
    # Load both JSON files
    full_items = load_items(FILE_FULL)
    fasted_items = load_items(FILE_FASTED)

    # Compute missing items
    missing_ids = set(full_items.keys()) - set(fasted_items.keys())

    # Build output list
    output_list = [
        {
            "ID": item_id,
            "Name": full_items[item_id].get("Name_EN", "")
        }
        for item_id in missing_ids
    ]

    # Save output JSON
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(output_list, f, indent=2, ensure_ascii=False)

    print(f"Fichier généré : {OUTPUT_FILE} ({len(output_list)} items)")

if __name__ == "__main__":
    main()
