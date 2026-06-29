import os
from PIL import Image

def scale_height_until(image, min_height, log):
    """Scale verticalement en multipliant la hauteur jusqu'à dépasser min_height."""
    base_width, base_height = image.size
    factor = 1

    while base_height * factor < min_height:
        factor += 1

    new_height = base_height * factor
    new_width = base_width * factor

    log.write(f"  - Facteur choisi : x{factor} → nouvelle taille {new_width}x{new_height}\n")

    return image.resize((new_width, new_height), Image.NEAREST)


def scale_width_to(image, target_width, log):
    """Scale horizontalement pour obtenir target_width pixels de large."""
    current_width, current_height = image.size

    log.write(f"  - Redimensionnement largeur : {current_width}px → {target_width}px\n")

    return image.resize((target_width, current_height), Image.NEAREST)


def traiter_output(dossier_entree="./output/", dossier_sortie="./output_scaled/"):
    os.makedirs(dossier_sortie, exist_ok=True)
    log_file = os.path.join(dossier_sortie, "scale.log")

    with open(log_file, "w", encoding="utf-8") as log:
        log.write("=== Début du scaling des sprites ===\n")

        for fichier in os.listdir(dossier_entree):
            if not fichier.lower().endswith(".png"):
                continue

            chemin_entree = os.path.join(dossier_entree, fichier)
            chemin_sortie = os.path.join(dossier_sortie, fichier)

            log.write(f"\nTraitement de {fichier}\n")

            img = Image.open(chemin_entree).convert("RGB")
            w, h = img.size
            log.write(f"  - Taille originale : {w}x{h}\n")

            # Étape 1 : scale vertical jusqu'à dépasser 120px
            img = scale_height_until(img, 120, log)

            # Étape 2 : scale horizontal pour largeur = 12px
            img = scale_width_to(img, 12, log)

            img.save(chemin_sortie)
            log.write(f"  - Image sauvegardée : {chemin_sortie}\n")

        log.write("\n=== Fin du traitement ===\n")


# Exécution directe
traiter_output("./output/", "./output_scaled/")
