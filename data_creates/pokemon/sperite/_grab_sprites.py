import json
import os
import requests
from urllib.parse import urlparse

with open("_data.json", "r", encoding="utf-8") as f:
    data = json.load(f)

def download_image(url, is_shiny=False):
    if not url:
        return

    filename = os.path.basename(urlparse(url).path)

    # Ajout du préfixe shiny
    if is_shiny:
        name, ext = os.path.splitext(filename)
        filename = f"{name}_shiny{ext}"

    try:
        print(f"Téléchargement : {filename}")
        response = requests.get(url, timeout=10)
        response.raise_for_status()

        with open(filename, "wb") as img_file:
            img_file.write(response.content)

    except Exception as e:
        print(f"Erreur pour {url} : {e}")

for family in data:
    for member in family["Members"]:

        # Champs normaux
        normal_fields = [
            "Sprite",
            "Sprite_BW",
            #"Sprite_BW2"
        ]

        # Champs shiny
        shiny_fields = [
            "Sprite_Shiny",
            "Sprite_BW_shiny",
            #"Sprite_BW2_shiny"
        ]

        # Téléchargement normal
        for field in normal_fields:
            url = member.get(field)
            download_image(url, is_shiny=False)

        # Téléchargement shiny avec préfixe
        for field in shiny_fields:
            url = member.get(field)
            download_image(url, is_shiny=True)

print("✔️ Téléchargement terminé avec préfixes shiny !")
