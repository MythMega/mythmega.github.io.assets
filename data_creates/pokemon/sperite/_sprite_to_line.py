import os
from PIL import Image
from collections import Counter

def couleur_dominante_ligne(image, y):
    """Retourne la couleur dominante pour la ligne y, en ignorant les pixels transparents et les pixels noirs."""
    largeur, _ = image.size
    pixels = image.load()
    ligne = []

    for x in range(largeur):
        pixel = pixels[x, y]

        # Pixel transparent → ignorer
        if len(pixel) == 4 and pixel[3] == 0:
            continue

        rgb = pixel[:3]

        # Pixel exactement noir → ignorer
        if rgb == (0, 0, 0):
            continue

        ligne.append(rgb)

    # Si la ligne est entièrement transparente ou noire → retourner None
    if not ligne:
        return None

    # Sinon couleur dominante
    return Counter(ligne).most_common(1)[0][0]



def generer_sprite_special(image_path, sortie_path, log_file):
    """Crée une image avec les couleurs dominantes de chaque ligne sur 10 colonnes."""
    image = Image.open(image_path).convert("RGBA")
    largeur, hauteur = image.size
    couleurs = []

    with open(log_file, "a", encoding="utf-8") as log:
        log.write(f"\nTraitement de {image_path} ({largeur}x{hauteur})\n")

        for y in range(hauteur):
            couleur = couleur_dominante_ligne(image, y)

            if couleur is None:
                log.write(f"Ligne {y}: transparente → ignorée\n")
                continue

            couleurs.append(couleur)
            log.write(f"Ligne {y}: couleur dominante {couleur}\n")

    # Création de l'image finale (hauteur = nombre de lignes visibles)
    nouvelle_hauteur = len(couleurs)
    nouvelle_image = Image.new("RGB", (10, nouvelle_hauteur))

    for y, couleur in enumerate(couleurs):
        for x in range(10):
            nouvelle_image.putpixel((x, y), couleur)

    nouvelle_image.save(sortie_path)


def traiter_dossier(dossier_entree="./", dossier_sortie="./output/"):
    """Traite tous les fichiers .png du dossier courant et génère les sprites spéciaux."""
    os.makedirs(dossier_sortie, exist_ok=True)
    log_file = os.path.join(dossier_sortie, "traitement.log")

    with open(log_file, "w", encoding="utf-8") as log:
        log.write("=== Début du traitement des sprites ===\n")

    for fichier in os.listdir(dossier_entree):
        if fichier.lower().endswith(".png"):
            chemin_entree = os.path.join(dossier_entree, fichier)
            chemin_sortie = os.path.join(dossier_sortie, f"sprite_{fichier}")

            generer_sprite_special(chemin_entree, chemin_sortie, log_file)

            with open(log_file, "a", encoding="utf-8") as log:
                log.write(f"Image générée : {chemin_sortie}\n")

    with open(log_file, "a", encoding="utf-8") as log:
        log.write("=== Fin du traitement ===\n")


# Exécution directe
traiter_dossier("./", "./output/")
