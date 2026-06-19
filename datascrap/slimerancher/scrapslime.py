import os
import json
import re
from PIL import Image

# CONFIGURATION
# Mettre à True pour supprimer les fichiers originaux après conversion/renommage
DELETE_ORIGINALS = True

def insert_underscores(name):
    return re.sub(r'(?<!^)(?=[A-Z])', '_', name)

def clean_name(name):
    base = os.path.splitext(name)[0]

    # 1) Ajout d'underscores entre majuscules
    base = insert_underscores(base)

    # 2) Supprimer SR2 avant SR (avec underscores optionnels autour)
    base = re.sub(r'_?SR2_?', '_', base, flags=re.IGNORECASE)
    base = re.sub(r'_?SR_?', '_', base, flags=re.IGNORECASE)
    base = re.sub(r'_?R2_?', '_', base, flags=re.IGNORECASE)

    # 3) Supprimer Icon (avec underscores optionnels autour)
    base = re.sub(r'_?Icon_?', '_', base, flags=re.IGNORECASE)

    # 4) Normaliser underscores multiples
    base = re.sub(r'_+', '_', base).strip('_')

    # 5) Filtrer les tokens courts (< 2 caractères)
    parts = [p for p in base.split('_') if len(p) >= 2]

    # 6) Recomposer le nom propre
    cleaned = '_'.join(parts)

    return cleaned

def to_readable(name):
    return name.replace("_", " ")

def convert_extension(path):
    root, ext = os.path.splitext(path)
    return root + ".png"

def extract_type_and_release(rel_path):
    parts = rel_path.split("/")
    if len(parts) < 4:
        return None, None

    release = parts[1]
    type_name = parts[2].capitalize()

    if not release.isdigit():
        return None, None

    return type_name, int(release)

def make_relative(full_path):
    parts = full_path.split(os.sep)
    if "slimerancher" not in parts:
        return None
    idx = parts.index("slimerancher")
    rel = "./" + "/".join(parts[idx+1:])
    return convert_extension(rel)

def convert_and_rename(full_path, new_rel_path):
    """
    Convertit/renomme le fichier et retourne le chemin absolu du nouveau fichier
    ou None en cas d'échec.
    """
    try:
        new_abs_path = os.path.join(os.getcwd(), new_rel_path[2:])
        os.makedirs(os.path.dirname(new_abs_path), exist_ok=True)

        # Si source et destination sont identiques (chemin absolu), on ne fait rien
        src_abs = os.path.abspath(full_path)
        dst_abs = os.path.abspath(new_abs_path)
        if src_abs == dst_abs:
            return dst_abs if os.path.exists(dst_abs) else None

        # Conversion webp -> png
        if full_path.lower().endswith(".webp"):
            img = Image.open(full_path).convert("RGBA")
            img.save(new_abs_path, "PNG")
        else:
            # Pour autres formats, on ouvre et on ré-enregistre en PNG si extension demandée,
            # sinon on copie le fichier tel quel (ici on enregistre en PNG pour uniformité)
            try:
                img = Image.open(full_path)
                img.save(new_abs_path, "PNG")
            except Exception:
                # fallback: copie binaire si PIL ne sait pas ouvrir
                with open(full_path, "rb") as src, open(new_abs_path, "wb") as dst:
                    dst.write(src.read())

        return dst_abs
    except Exception as e:
        print(f"Erreur conversion/renommage pour {full_path} -> {new_rel_path} : {e}")
        return None

def safe_remove(path):
    try:
        if os.path.exists(path):
            os.remove(path)
            return True
    except Exception as e:
        print(f"Impossible de supprimer {path} : {e}")
    return False

def scan_and_process():
    root = os.getcwd()
    items = []
    converted_count = 0
    removed_count = 0
    skipped_count = 0
    errors = []

    for current_path, dirs, filenames in os.walk(root):
        for f in filenames:
            full_path = os.path.join(current_path, f)

            # On ne traite que les fichiers dans un chemin contenant "slimerancher"
            if "slimerancher" not in full_path:
                continue

            cleaned = clean_name(f)
            if not cleaned:
                skipped_count += 1
                continue

            readable = to_readable(cleaned)

            rel_path = make_relative(full_path)
            if rel_path is None:
                skipped_count += 1
                continue

            type_name, release = extract_type_and_release(rel_path)
            if type_name is None:
                skipped_count += 1
                continue

            # Nouveau nom de fichier (avec extension .png)
            new_filename = cleaned + ".png"
            rel_parts = rel_path.split("/")
            rel_parts[-1] = new_filename
            new_rel_path = "/".join(rel_parts)

            # Conversion + renommage réel
            new_abs = convert_and_rename(full_path, new_rel_path)
            if new_abs:
                converted_count += 1

                # Suppression conditionnelle du fichier original
                if DELETE_ORIGINALS:
                    try:
                        src_abs = os.path.abspath(full_path)
                        dst_abs = os.path.abspath(new_abs)
                        # On supprime seulement si source et destination sont différentes
                        # et que la destination existe
                        if src_abs != dst_abs and os.path.exists(dst_abs):
                            if safe_remove(src_abs):
                                removed_count += 1
                        else:
                            # ne pas supprimer si même fichier ou destination manquante
                            pass
                    except Exception as e:
                        errors.append(f"Suppression échouée pour {full_path} : {e}")

                items.append({
                    "Item_name": readable,
                    "path": new_rel_path,
                    "type": type_name,
                    "release": release
                })
            else:
                errors.append(f"Conversion échouée pour {full_path}")

    summary = {
        "converted": converted_count,
        "removed": removed_count,
        "skipped": skipped_count,
        "errors": errors
    }
    return items, summary

if __name__ == "__main__":
    result, summary = scan_and_process()

    with open("result.json", "w", encoding="utf-8") as f:
        json.dump(result, f, indent=4, ensure_ascii=False)

    print("✔ Traitement terminé : fichiers convertis + renommés + JSON généré dans result.json")
    print(f"Converted: {summary['converted']}, Removed: {summary['removed']}, Skipped: {summary['skipped']}")
    if summary["errors"]:
        print("Erreurs rencontrées:")
        for e in summary["errors"]:
            print(" -", e)
