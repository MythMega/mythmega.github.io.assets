import os
import re
from PIL import Image

pattern = re.compile(r"\(.*?\)|JE\w+")

def convert_webp_to_png(folder="."):
    for filename in os.listdir(folder):
        if filename.lower().endswith(".webp"):
            webp_path = os.path.join(folder, filename)
            png_path = os.path.join(folder, filename[:-5] + ".png")

            # Ouvrir et convertir
            with Image.open(webp_path) as img:
                img.save(png_path, "PNG")

            # Supprimer le fichier webp
            os.remove(webp_path)
            print(f"Converti et supprimé : {filename}")


convert_webp_to_png()         
for filename in os.listdir("."):
    if filename.lower().endswith(".png"):
        name, ext = os.path.splitext(filename)

        # Suppression des éléments indésirables
        new_name = pattern.sub("", name)

        # Nettoyage des underscores multiples
        new_name = re.sub(r"_+", "_", new_name)

        # Suppression des underscores en début/fin
        new_name = new_name.strip("_")

        # Suppression des underscores finaux restants
        while new_name.endswith("_"):
            new_name = new_name[:-1]

        final_name = new_name + ext

        if final_name != filename:
            print(f"Renommage : {filename} → {final_name}")
            os.rename(filename, final_name)
