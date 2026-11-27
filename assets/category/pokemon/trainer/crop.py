from pathlib import Path
from PIL import Image, ImageChops


def find_content_bbox(img: Image.Image):
    """Retourne la bounding box (left, top, right, bottom) des pixels non vides, ou None si vide."""
    if img.mode in ("RGBA", "LA") or ("transparency" in img.info):
        rgba = img.convert("RGBA")
        alpha = rgba.getchannel("A")
        # Considère tout pixel avec alpha > 0 comme du contenu
        return alpha.getbbox()

    # Repli si l'image n'a pas de canal alpha : détecte ce qui diffère du pixel en haut à gauche
    rgb = img.convert("RGB")
    bg = Image.new("RGB", rgb.size, rgb.getpixel((0, 0)))
    diff = ImageChops.difference(rgb, bg)
    return diff.getbbox()


def main():
    cwd = Path(".")
    png_files = sorted(
        p for p in cwd.iterdir()
        if p.is_file() and p.suffix.lower() == ".png"
    )

    if not png_files:
        print("Aucun fichier .png trouvé dans le dossier courant.")
        return

    heights_after_crop = []
    empty_count = 0

    for path in png_files:
        try:
            with Image.open(path) as img:
                # Charge les données avant d'écraser le fichier sur le disque
                img.load()
                bbox = find_content_bbox(img)

                if bbox is None:
                    empty_count += 1
                    print(f"[Vide / ignoré] {path.name}")
                    continue

                cropped = img.crop(bbox)
                _, height = cropped.size
                heights_after_crop.append(height)

                # Sauvegarde directe sur le même fichier (conserve les métadonnées PNG si présentes)
                save_kwargs = {}
                if "dpi" in img.info:
                    save_kwargs["dpi"] = img.info["dpi"]
                cropped.save(path, format="PNG", **save_kwargs)

                print(f"[OK] {path.name} -> {cropped.width}x{height}px")
        except Exception as e:
            print(f"[Erreur] {path.name} : {e}")

    print("\n--- Résumé ---")
    if heights_after_crop:
        print(f"Images traitées : {len(heights_after_crop)} (vides ignorées : {empty_count})")
        print(f"Hauteur minimale après crop : {min(heights_after_crop)} px")
        print(f"Hauteur maximale après crop : {max(heights_after_crop)} px")
    else:
        print("Aucune image n'a pu être croppée.")


if __name__ == "__main__":
    main()