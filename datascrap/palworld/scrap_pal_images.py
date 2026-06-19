import csv
import os
import requests
from bs4 import BeautifulSoup

BASE_URL = "https://palworld.gg"
PAGE_URL = BASE_URL + "/pals"
IMG_OUTPUT_DIR = "../../assets/category/palworld/pal/"
CSV_OUTPUT = "pals.csv"
GITHUB_IMG_BASE = "https://raw.githubusercontent.com/MythMega/mythmega.github.io.assets/refs/heads/master/assets/category/palworld/pal/"

# Assure que le dossier existe
os.makedirs(IMG_OUTPUT_DIR, exist_ok=True)

# Récupération de la page
print("Téléchargement de la page...")
response = requests.get(PAGE_URL)
response.raise_for_status()

soup = BeautifulSoup(response.text, "html.parser")

pals = soup.select("section.pals-list div.pal")

rows = []

for pal in pals:
    # Nom
    name_tag = pal.select_one("div.name")
    if not name_tag:
        continue

    name = name_tag.contents[0].strip()

    # Index (#100)
    index_tag = pal.select_one("span.index")
    index = index_tag.text.replace("#", "") if index_tag else ""

    # Image (srcset → prendre la version 1x)
    img_tag = pal.find("img", alt=name)
    if not img_tag:
        continue

    srcset = img_tag.get("srcset")
    if srcset:
        img_url = srcset.split(" ")[0]  # première URL (1x)
    else:
        img_url = img_tag.get("src")

    # URL complète
    if img_url.startswith("/"):
        img_url = BASE_URL + img_url

    # Nom du fichier image
    img_filename = f"{name}.png"
    img_path = os.path.join(IMG_OUTPUT_DIR, img_filename)

    # Téléchargement de l'image
    print(f"Téléchargement de {name}...")
    img_data = requests.get(img_url).content
    with open(img_path, "wb") as f:
        f.write(img_data)

    # URL GitHub pour le CSV
    github_img_url = GITHUB_IMG_BASE + img_filename

    rows.append([index, name, github_img_url])

# Création du CSV
print("Création du CSV...")
with open(CSV_OUTPUT, "w", newline="", encoding="utf-8") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["index", "name", "image"])
    writer.writerows(rows)

print("Scraping terminé !")
print(f"CSV généré : {CSV_OUTPUT}")
print(f"Images enregistrées dans : {IMG_OUTPUT_DIR}")
