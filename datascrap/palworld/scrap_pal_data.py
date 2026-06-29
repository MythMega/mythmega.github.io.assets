import os
import json
import requests
from bs4 import BeautifulSoup

BASE_URL = "https://palworld.gg"
PAGE_URL = BASE_URL + "/pals"

IMG_PAL_DIR = "../../assets/category/palworld/pal/"
IMG_TYPE_DIR = "../../assets/category/palworld/types/"
IMG_SKILL_DIR = "../../assets/category/palworld/skills/"

GITHUB_BASE = "https://raw.githubusercontent.com/MythMega/mythmega.github.io.assets/refs/heads/master/assets/category/palworld/"

# Création des dossiers
os.makedirs(IMG_PAL_DIR, exist_ok=True)
os.makedirs(IMG_TYPE_DIR, exist_ok=True)
os.makedirs(IMG_SKILL_DIR, exist_ok=True)

print("Téléchargement de la page...")
response = requests.get(PAGE_URL)
response.raise_for_status()

soup = BeautifulSoup(response.text, "html.parser")
pals = soup.select("section.pals-list div.pal")

data = []

def download_icon(url, folder, name):
    """Télécharge une icône (type ou skill)."""
    if url.startswith("/"):
        url = BASE_URL + url

    filename = f"{name}.png"
    path = os.path.join(folder, filename)

    img_data = requests.get(url).content
    with open(path, "wb") as f:
        f.write(img_data)


for pal in pals:
    # Nom
    name_tag = pal.select_one("div.name")
    if not name_tag:
        continue
    name = name_tag.contents[0].strip()

    # Index
    index_tag = pal.select_one("span.index")
    index = index_tag.text.replace("#", "") if index_tag else ""

    # Image du pal (le dernier <img> dans le bloc)
    img_candidates = pal.find_all("img")
    img_tag = img_candidates[-1] if img_candidates else None

    if img_tag is None:
        print(f"⚠ Impossible de trouver l'image pour {name}, on ignore ce pal.")
        continue

    srcset = img_tag.get("srcset")
    if srcset:
        img_url = srcset.split(" ")[0]
    else:
        img_url = img_tag.get("src")

    if img_url.startswith("/"):
        img_url = BASE_URL + img_url

    # Téléchargement image pal
    pal_img_filename = f"{name}.png"
    pal_img_path = os.path.join(IMG_PAL_DIR, pal_img_filename)
    print(f"Téléchargement image pal : {name}")
    img_data = requests.get(img_url).content
    with open(pal_img_path, "wb") as f:
        f.write(img_data)

    pal_img_github = GITHUB_BASE + "pal/" + pal_img_filename

    # Types (éléments)
    types = []
    type_icons = pal.select("div.elements div.element img")
    for t in type_icons:
        type_name = t.get("alt", "").replace("element", "").strip()
        type_icon_url = t.get("src")

        download_icon(type_icon_url, IMG_TYPE_DIR, type_name)
        types.append(type_name)

    # Skills (travail)
    skills = []
    skill_items = pal.select("div.works div.item.active")
    for item in skill_items:
        img = item.select_one("div.image img")
        level_tag = item.select_one("div.level span.value")

        if not img or not level_tag:
            continue

        skill_name = img.get("alt").strip()
        skill_level = int(level_tag.text.strip())
        skill_icon_url = img.get("src")

        download_icon(skill_icon_url, IMG_SKILL_DIR, skill_name)

        skills.append({
            "name": skill_name,
            "level": skill_level
        })

    # Ajout au JSON
    data.append({
        "index": index,
        "name": name,
        "image": pal_img_github,
        "types": types,
        "skills": skills
    })

# Écriture du JSON
with open("pals.json", "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4, ensure_ascii=False)

print("Scraping terminé !")
print("Fichier généré : pals.json")
