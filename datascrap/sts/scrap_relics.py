import os
import time
import json
import requests
import unicodedata
from pathlib import Path
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

# ---------------- CONFIG ----------------
PAGES = {
    "sts1": {
        "url": "https://slaythespire.wiki.gg/wiki/Relics_List",
        "img_dir": "../../assets/category/sts/relics/",
        "json_file": "sts1_relics.json"
    },
    "sts2": {
        "url": "https://slaythespire.wiki.gg/wiki/Slay_the_Spire_2:Relics_List",
        "img_dir": "../../assets/category/sts2/relics/",
        "json_file": "sts2_relics.json"
    }
}

GITHUB_BASE = "https://raw.githubusercontent.com/MythMega/mythmega.github.io.assets/refs/heads/master/assets/category"
MIN_BYTES_OK = 1024  # seuil minimal pour considérer une image valide
REQUEST_TIMEOUT = 15
# ----------------------------------------

# Session requests avec retries
def requests_session_with_retries():
    s = requests.Session()
    retries = Retry(total=3, backoff_factor=0.6, status_forcelist=(500,502,503,504))
    s.mount("https://", HTTPAdapter(max_retries=retries))
    s.headers.update({
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
                      "(KHTML, like Gecko) Chrome/115.0 Safari/537.36"
    })
    return s

session = requests_session_with_retries()

# Normalisation nom de fichier
def normalize_filename(name):
    name = name.strip().replace(" ", "_")
    name = unicodedata.normalize("NFKD", name).encode("ascii", "ignore").decode()
    for c in ['?', ':', '*', '"', '<', '>', '|', '/', '\\']:
        name = name.replace(c, '')
    while "__" in name:
        name = name.replace("__", "_")
    return name

# Convertir /thumb/.../80px-...?... en /images/<file>
def thumb_to_original(url):
    if not url:
        return url
    # enlever paramètres
    url = url.split("?")[0]
    if "/thumb/" in url:
        base, rest = url.split("/thumb/", 1)
        original = rest.split("/", 1)[0]
        return base + "/" + original
    return url

# Téléchargement robuste en streaming + vérification taille
def download_image_robust(url, folder, name):
    url = thumb_to_original(url)
    if url.startswith("/"):
        url = "https://slaythespire.wiki.gg" + url

    filename = normalize_filename(name) + Path(url).suffix
    if not filename.lower().endswith((".png", ".jpg", ".jpeg", ".gif", ".webp")):
        filename = normalize_filename(name) + ".png"

    os.makedirs(folder, exist_ok=True)
    path = os.path.join(folder, filename)

    # si déjà téléchargé et taille OK, on skip
    if os.path.exists(path) and os.path.getsize(path) >= MIN_BYTES_OK:
        return f"{GITHUB_BASE}/{Path(folder).parts[-2]}/{Path(folder).parts[-1]}/{filename}"

    try:
        with session.get(url, stream=True, timeout=REQUEST_TIMEOUT) as r:
            r.raise_for_status()
            tmp_path = path + ".tmp"
            with open(tmp_path, "wb") as f:
                for chunk in r.iter_content(chunk_size=8192):
                    if chunk:
                        f.write(chunk)
            size = os.path.getsize(tmp_path)
            if size < MIN_BYTES_OK:
                os.remove(tmp_path)
                return None
            os.replace(tmp_path, path)
            return f"{GITHUB_BASE}/{Path(folder).parts[-2]}/{Path(folder).parts[-1]}/{filename}"
    except Exception:
        # tentative alternative : essayer sans thumb->original (au cas où)
        try:
            alt_url = url
            with session.get(alt_url, stream=True, timeout=REQUEST_TIMEOUT) as r:
                r.raise_for_status()
                tmp_path = path + ".tmp"
                with open(tmp_path, "wb") as f:
                    for chunk in r.iter_content(chunk_size=8192):
                        if chunk:
                            f.write(chunk)
                size = os.path.getsize(tmp_path)
                if size < MIN_BYTES_OK:
                    os.remove(tmp_path)
                    return None
                os.replace(tmp_path, path)
                return f"{GITHUB_BASE}/{Path(folder).parts[-2]}/{Path(folder).parts[-1]}/{filename}"
        except Exception:
            return None

# Force scroll pour lazy load
def force_scroll(driver, pause=0.3):
    last_height = driver.execute_script("return document.body.scrollHeight")
    while True:
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
        time.sleep(pause)
        new_height = driver.execute_script("return document.body.scrollHeight")
        if new_height == last_height:
            break
        last_height = new_height

# Scraper avec Selenium
def scrape_page(cfg):
    url = cfg["url"]
    img_dir = cfg["img_dir"]
    json_file = cfg["json_file"]

    os.makedirs(img_dir, exist_ok=True)
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
    driver.get(url)

    # attendre que le conteneur principal existe
    max_wait = 20
    waited = 0
    while waited < max_wait:
        try:
            boxes = driver.find_elements(By.CSS_SELECTOR, "div.relic-box")
            if boxes:
                break
        except Exception:
            pass
        time.sleep(0.5)
        waited += 0.5

    # forcer le chargement lazy
    force_scroll(driver, pause=0.4)
    time.sleep(1.0)  # laisser le temps aux images de se charger

    soup = BeautifulSoup(driver.page_source, "html.parser")
    driver.quit()

    relics = []
    failures = []

    for box in soup.select("div.relic-box"):
        name_tag = box.select_one(".relic-title a")
        if not name_tag:
            continue
        name = name_tag.text.strip()

        rarity = box.get("data-rarity", "").strip()
        character = box.get("data-character", "").strip()

        img_tag = box.select_one(".relic-image-wrap img")
        img_url = None
        if img_tag:
            # prioriser srcset > data-src > src
            img_url = img_tag.get("data-src") or img_tag.get("data-original") or img_tag.get("src")
            # parfois srcset contient plusieurs résolutions, prendre la première url
            srcset = img_tag.get("srcset")
            if srcset:
                first = srcset.split(",")[0].strip().split(" ")[0]
                if first:
                    img_url = first

        image_github = None
        if img_url:
            image_github = download_image_robust(img_url, img_dir, name)

        if not image_github:
            # tentative alternative : reconstruire depuis alt si présent
            alt = img_tag.get("alt") if img_tag is not None else None
            if alt:
                # alt souvent "PureWater.png" ou "StS2_RingoftheSnake.png"
                alt_name = os.path.splitext(alt)[0]
                image_github = download_image_robust("/images/" + alt_name + ".png", img_dir, name)

        if not image_github:
            failures.append({"name": name, "rarity": rarity, "character": character, "img_url": img_url})
            # on met quand même une valeur nulle pour image
            image_github = None

        relics.append({
            "name": name,
            "image": image_github,
            "rarity": rarity,
            "character": character
        })

    # write json and failures log
    with open(json_file, "w", encoding="utf-8") as f:
        json.dump(relics, f, indent=4, ensure_ascii=False)

    if failures:
        with open("download_failures.log", "a", encoding="utf-8") as lf:
            for fail in failures:
                lf.write(json.dumps(fail, ensure_ascii=False) + "\n")

    return len(relics), len(failures)

# MAIN
if __name__ == "__main__":
    for key, cfg in PAGES.items():
        print(f"Scraping {key} …")
        count, fails = scrape_page(cfg)
        print(f"{count} reliques trouvées, {fails} échecs d'image → {cfg['json_file']}")
