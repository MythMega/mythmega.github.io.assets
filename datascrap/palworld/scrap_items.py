import os
import json
import time
import requests
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By

BASE_URL = "https://palworld.gg/items"
IMG_ITEM_DIR = "../../assets/category/palworld/items/"
GITHUB_BASE = "https://raw.githubusercontent.com/MythMega/mythmega.github.io.assets/refs/heads/master/assets/category/palworld/items/"

os.makedirs(IMG_ITEM_DIR, exist_ok=True)

def download_image(url, name):
    if url.startswith("/"):
        url = "https://palworld.gg" + url

    filename = f"{name}.png"
    path = os.path.join(IMG_ITEM_DIR, filename)

    img_data = requests.get(url).content
    with open(path, "wb") as f:
        f.write(img_data)

    return GITHUB_BASE + filename


# --- Lancer Chrome ---
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver.get(BASE_URL)
time.sleep(2)

ALL_ITEMS = []

print("Scraping des items Palworld…")

# --- Trouver les boutons de pagination ---
page_buttons = driver.find_elements(By.CSS_SELECTOR, ".page-nav-btn")
total_pages = len(page_buttons)

print(f"{total_pages} pages détectées.")

for page_index in range(total_pages):
    print(f"Page {page_index + 1}…")

    # Cliquer sur le bouton de page
    page_buttons[page_index].click()
    time.sleep(1.5)

    # Récupérer le HTML généré par JS
    soup = BeautifulSoup(driver.page_source, "html.parser")

    items = soup.select("section.items-list div.item")

    for item in items:
        name_tag = item.select_one(".up .name .text")
        if not name_tag:
            continue
        name = name_tag.text.strip()

        type_tag = item.select_one(".up .name .type")
        item_type = type_tag.text.strip() if type_tag else ""

        img_tag = item.select_one(".up .image img")
        img_url = img_tag.get("src")
        image_github = download_image(img_url, name)

        desc_tag = item.select_one(".item-card .description")
        description = desc_tag.text.strip() if desc_tag else ""

        stats = {}
        stat_items = item.select(".item-card .keys .key")

        for stat in stat_items:
            key_name = stat.select_one(".text").text.strip()
            key_value = stat.select_one(".value").text.strip()

            try:
                key_value = int(key_value)
            except:
                pass

            stats[key_name] = key_value

        recipe_section = item.select_one(".item-card .recipe")
        has_recipe = recipe_section is not None

        recipe = []
        if has_recipe:
            recipe_items = recipe_section.select(".elms .item")
            for r in recipe_items:
                recipe.append(r.select_one(".name").text.strip())

        ALL_ITEMS.append({
            "name": name,
            "type": item_type,
            "image": image_github,
            "description": description,
            "stats": stats,
            "has_recipe": has_recipe,
            "recipe": recipe
        })

# Fermer Chrome
driver.quit()

# Sauvegarder JSON
with open("items.json", "w", encoding="utf-8") as f:
    json.dump(ALL_ITEMS, f, indent=4, ensure_ascii=False)

print("Scraping terminé !")
print("Fichier généré : items.json")
