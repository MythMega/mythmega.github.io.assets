import os
import re

pattern = re.compile(r"\(.*?\)|JE\w+")

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
