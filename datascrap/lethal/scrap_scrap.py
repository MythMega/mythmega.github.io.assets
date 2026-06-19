#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
scrap_scrap_screenshot_clean.py
Même script que précédemment mais nettoie les noms d'items pour:
 - item_name (sans préfixe mh:lethal:)
 - filename (espaces -> _, suppression des caractères invalides Windows)
Génère scrap.json avec item_name propre et imgpath GitHub raw.
"""

import os
import time
import json
import re
from urllib.parse import urljoin, urlparse
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import requests

# -------- CONFIG --------
BASE_URL = "https://lethal.miraheze.org"
SCRAP_URL = urljoin(BASE_URL, "/wiki/Scrap")
OUTPUT_DIR = "./lethalcompany/scrap/"
JSON_OUTPUT = "scrap.json"

HEADLESS = True  # False pour debug visuel

REQUESTS_HEADERS = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36",
    "Accept": "image/avif,image/webp,image/apng,image/*,*/*;q=0.8",
}

os.makedirs(OUTPUT_DIR, exist_ok=True)

# -------- Selenium setup --------
options = webdriver.ChromeOptions()
if HEADLESS:
    options.add_argument("--headless=new")
options.add_argument("--disable-gpu")
options.add_argument("--no-sandbox")
options.add_argument("--disable-dev-shm-usage")
options.add_experimental_option("excludeSwitches", ["enable-logging"])

driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)
driver.set_page_load_timeout(30)

# -------- Utilities for name cleaning --------
INVALID_FILENAME_CHARS = r'<>:"/\\|?*\n\r\t'  # caractères à supprimer ou remplacer

def clean_name_for_item(raw_name: str) -> str:
    """
    Nettoie le nom pour l'affichage (item_name).
    - Si le nom contient des préfixes séparés par ':', on prend la partie après le dernier ':'.
    - Trim des espaces.
    Exemple: "mh:lethal:V-type engine" -> "V-type engine"
    """
    if not raw_name:
        return raw_name
    # Prendre la partie après le dernier ':'
    if ":" in raw_name:
        cleaned = raw_name.split(":")[-1]
    else:
        cleaned = raw_name
    return cleaned.strip()

def sanitize_filename(name: str, default_ext: str = ".png", max_len: int = 120) -> str:
    """
    Transforme un nom en nom de fichier sûr pour Windows/Linux:
    - remplace les espaces par underscore
    - supprime/transforme caractères invalides
    - tronque si trop long
    - ajoute extension si manquante
    """
    if not name:
        name = "item"
    # remplacer espaces par underscore
    s = name.replace(" ", "_")
    # supprimer caractères invalides
    s = re.sub(r'[<>:"/\\|?*\n\r\t]', "_", s)
    # enlever caractères non imprimables
    s = "".join(ch for ch in s if ord(ch) >= 32)
    # tronquer
    if len(s) > max_len:
        s = s[:max_len]
    # garantir pas d'extension multiple ; on laissera l'extension fournie plus tard
    return s

# -------- Helpers (identiques au script précédent) --------
def safe_get_soup(url):
    try:
        driver.get(url)
    except Exception as e:
        print(f"[ERROR] driver.get({url}) -> {e}")
        return None
    # scroll until stable
    try:
        last_height = driver.execute_script("return document.body.scrollHeight")
        while True:
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
            time.sleep(0.5)
            new_height = driver.execute_script("return document.body.scrollHeight")
            if new_height == last_height:
                break
            last_height = new_height
    except Exception:
        time.sleep(0.5)
    return BeautifulSoup(driver.page_source, "html.parser")

def normalize_link(href):
    if not href:
        return None
    if ":" in href and not href.startswith("/") and not href.startswith("http"):
        return None
    full = urljoin(BASE_URL, href)
    parsed = urlparse(full)
    if parsed.scheme not in ("http", "https"):
        return None
    return full

def choose_best_from_srcset(srcset):
    if not srcset:
        return None
    parts = [p.strip() for p in srcset.split(",") if p.strip()]
    if not parts:
        return None
    last = parts[-1].split()[0]
    return last

def to_original_image_url(img_url):
    if not img_url:
        return None
    if img_url.startswith("//"):
        img_url = "https:" + img_url
    if "/thumb/" in img_url:
        tmp = img_url.replace("/thumb/", "/")
        original = tmp.rsplit("/", 1)[0]
        return original
    return img_url

# -------- Screenshot capture (élément) --------
def capture_image_via_screenshot(img_url, dest_path):
    try:
        driver.get(img_url)
    except Exception as e:
        print(f"[ERROR] driver.get(image_url) -> {e}")
        return False
    time.sleep(0.6)
    try:
        natural_w = driver.execute_script("return document.images && document.images[0] ? document.images[0].naturalWidth : null;")
        natural_h = driver.execute_script("return document.images && document.images[0] ? document.images[0].naturalHeight : null;")
    except Exception:
        natural_w = natural_h = None
    try:
        if natural_w and natural_h:
            width = min(int(natural_w), 16000)
            height = min(int(natural_h), 16000)
            driver.set_window_size(width + 20, height + 20)
            time.sleep(0.2)
    except Exception:
        pass
    try:
        img_elem = driver.find_element("tag name", "img")
    except Exception as e:
        print(f"[WARN] image element not found on {img_url}: {e}")
        return False
    try:
        img_elem.screenshot(dest_path)
        return True
    except Exception as e:
        print(f"[ERROR] element.screenshot failed for {img_url}: {e}")
        return False

def download_image_requests(img_url, dest_path):
    headers = REQUESTS_HEADERS.copy()
    try:
        with requests.get(img_url, headers=headers, stream=True, timeout=30) as r:
            r.raise_for_status()
            with open(dest_path, "wb") as f:
                for chunk in r.iter_content(chunk_size=8192):
                    if chunk:
                        f.write(chunk)
        return True
    except Exception as e:
        print(f"[ERROR] download_image_requests failed for {img_url}: {e}")
        return False

# -------- Extraction --------
def extract_scrap_list():
    soup = safe_get_soup(SCRAP_URL)
    if soup is None:
        return []
    table = soup.find("table", {"class": "wikitable"})
    if not table:
        print("[WARN] Table 'wikitable' non trouvée.")
        return []
    rows = table.find_all("tr")[1:]
    entries = []
    for row in rows:
        a = row.find("a")
        if not a:
            continue
        href = a.get("href")
        page_url = normalize_link(href)
        raw_name = a.get("title") or a.get_text(strip=True)
        if not page_url or not raw_name:
            continue
        entries.append((raw_name, page_url))
    return entries

def extract_image_from_page(raw_name, page_url):
    soup = safe_get_soup(page_url)
    if soup is None:
        return None

    a_tag = soup.find("a", {"class": "mw-file-description"})
    img_tag = a_tag.find("img") if a_tag else soup.find("img")
    if not img_tag:
        print(f"[WARN] Pas d'image trouvée dans {page_url}")
        return None

    src = None
    if img_tag.get("srcset"):
        src = choose_best_from_srcset(img_tag.get("srcset"))
    if not src:
        src = img_tag.get("src") or img_tag.get("data-src") or img_tag.get("data-image-name")
    if not src:
        print(f"[WARN] Aucun src pour l'image sur {page_url}")
        return None

    if src.startswith("//"):
        img_url = "https:" + src
    elif src.startswith("http"):
        img_url = src
    else:
        img_url = urljoin(BASE_URL, src)

    original_img_url = to_original_image_url(img_url)

    # Clean names
    item_name = clean_name_for_item(raw_name)            # pour JSON
    sanitized = sanitize_filename(item_name)             # base filename safe
    parsed = urlparse(original_img_url)
    ext = os.path.splitext(parsed.path)[1] or ".png"
    filename = f"{sanitized}{ext}"
    filepath = os.path.join(OUTPUT_DIR, filename)

    print(f"[INFO] Try capture via screenshot: {original_img_url}")
    if capture_image_via_screenshot(original_img_url, filepath):
        return item_name, filename

    if original_img_url != img_url:
        print(f"[INFO] Original failed, trying thumb capture: {img_url}")
        if capture_image_via_screenshot(img_url, filepath):
            return item_name, filename

    print("[INFO] Screenshot failed, trying requests fallback (may 403)...")
    if download_image_requests(original_img_url, filepath):
        return item_name, filename
    if original_img_url != img_url:
        if download_image_requests(img_url, filepath):
            return item_name, filename

    return None

# -------- MAIN --------
def main():
    scrap_list = extract_scrap_list()
    if not scrap_list:
        print("[ERROR] Aucune entrée scrap trouvée.")
        return

    results = []
    for raw_name, page in scrap_list:
        print(f"Processing {raw_name} -> {page}")
        res = extract_image_from_page(raw_name, page)
        if res:
            item_name, filename = res
            imgpath = f"https://raw.githubusercontent.com/MythMega/mythmega.github.io.assets/refs/heads/master/assets/category/lethalcompany/scrap/{filename}"
            results.append({"item_name": item_name, "imgpath": imgpath})
            print(f"[OK] {item_name} -> {filename}")
        else:
            print(f"[FAIL] Image non trouvée pour {raw_name}")

    with open(JSON_OUTPUT, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=4, ensure_ascii=False)
    print("Terminé. JSON écrit dans", JSON_OUTPUT)

if __name__ == "__main__":
    try:
        main()
    finally:
        try:
            driver.quit()
        except Exception:
            pass
