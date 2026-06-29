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
    "sts1_monsters": {
        "url": "https://slaythespire.wiki.gg/wiki/Monsters",
        "img_dir": "../../assets/category/sts/monsters/",
        "json_file": "sts1_monsters.json",
        "selector": "div.monster",
        "img_selector": "img.monster-img",
        "name_selector": "div.monster-name"
    },
    "sts1_elites": {
        "url": "https://slaythespire.wiki.gg/wiki/Elites",
        "img_dir": "../../assets/category/sts/elites/",
        "json_file": "sts1_elites.json",
        "selector": "div.elite",
        "img_selector": "img.elite-img",
        "name_selector": "div.elite-name"
    },
    "sts2_monsters": {
        "url": "https://slaythespire.wiki.gg/wiki/Slay_the_Spire_2:Monsters",
        "img_dir": "../../assets/category/sts2/monsters/",
        "json_file": "sts2_monsters.json",
        "selector": "div.monster",
        "img_selector": "img.monster-img",
        "name_selector": "div.monster-name"
    },
    "sts2_elites": {
        "url": "https://slaythespire.wiki.gg/wiki/Slay_the_Spire_2:Elites",
        "img_dir": "../../assets/category/sts2/elites/",
        "json_file": "sts2_elites.json",
        "selector": "div.elite",
        "img_selector": "img.elite-img",
        "name_selector": "div.elite-name"
    }
}

GITHUB_BASE = "https://raw.githubusercontent.com/MythMega/mythmega.github.io.assets/refs/heads/master/assets/category"
MIN_BYTES_OK = 1024
REQUEST_TIMEOUT = 15
# ----------------------------------------

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

def normalize_filename(name):
    name = name.strip().replace(" ", "_")
    name = unicodedata.normalize("NFKD", name).encode("ascii", "ignore").decode()
    for c in ['?', ':', '*', '"', '<', '>', '|', '/', '\\']:
        name = name.replace(c, '')
    while "__" in name:
        name = name.replace("__", "_")
    return name

def thumb_to_original(url):
    if not url:
        return url
    url = url.split("?")[0]
    if "/thumb/" in url:
        base, rest = url.split("/thumb/", 1)
        original = rest.split("/", 1)[0]
        return base + "/" + original
    return url

def download_image_robust(url, folder, name):
    url = thumb_to_original(url)
    if url.startswith("/"):
        url = "https://slaythespire.wiki.gg" + url

    suffix = Path(url).suffix or ".png"
    filename = normalize_filename(name) + suffix
    if not filename.lower().endswith((".png", ".jpg", ".jpeg", ".gif", ".webp")):
        filename = normalize_filename(name) + ".png"

    os.makedirs(folder, exist_ok=True)
    path = os.path.join(folder, filename)

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

def force_scroll(driver, pause=0.3):
    last_height = driver.execute_script("return document.body.scrollHeight")
    while True:
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
        time.sleep(pause)
        new_height = driver.execute_script("return document.body.scrollHeight")
        if new_height == last_height:
            break
        last_height = new_height

def scrape_section(cfg):
    url = cfg["url"]
    img_dir = cfg["img_dir"]
    json_file = cfg["json_file"]
    selector = cfg["selector"]
    img_selector = cfg["img_selector"]
    name_selector = cfg["name_selector"]

    os.makedirs(img_dir, exist_ok=True)
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
    driver.get(url)

    max_wait = 20
    waited = 0
    while waited < max_wait:
        try:
            elems = driver.find_elements(By.CSS_SELECTOR, selector)
            if elems:
                break
        except Exception:
            pass
        time.sleep(0.5)
        waited += 0.5

    force_scroll(driver, pause=0.4)
    time.sleep(1.0)

    soup = BeautifulSoup(driver.page_source, "html.parser")
    driver.quit()

    entries = []
    failures = []

    for box in soup.select(selector):
        # name
        name_tag = box.select_one(name_selector)
        if not name_tag:
            continue
        # name may be inside an <a> or plain text
        a = name_tag.select_one("a")
        name = a.text.strip() if a else name_tag.text.strip()

        # image
        img_tag = box.select_one(img_selector)
        img_url = None
        if img_tag:
            img_url = img_tag.get("data-src") or img_tag.get("data-original") or img_tag.get("src")
            srcset = img_tag.get("srcset")
            if srcset:
                first = srcset.split(",")[0].strip().split(" ")[0]
                if first:
                    img_url = first

        image_github = None
        if img_url:
            image_github = download_image_robust(img_url, img_dir, name)

        if not image_github:
            # try reconstruct from alt attribute
            alt = img_tag.get("alt") if img_tag is not None else None
            if alt:
                alt_name = os.path.splitext(alt)[0]
                image_github = download_image_robust("/images/" + alt_name + ".png", img_dir, name)

        if not image_github:
            failures.append({"name": name, "img_url": img_url})
            image_github = None

        entries.append({
            "name": name,
            "image": image_github
        })

    with open(json_file, "w", encoding="utf-8") as f:
        json.dump(entries, f, indent=4, ensure_ascii=False)

    if failures:
        with open("enemies_download_failures.log", "a", encoding="utf-8") as lf:
            for fail in failures:
                lf.write(json.dumps(fail, ensure_ascii=False) + "\n")

    return entries, failures

if __name__ == "__main__":
    # scrape each section
    all_by_game = {"sts1": [], "sts2": []}
    for key, cfg in PAGES.items():
        print(f"Scraping {key} …")
        entries, failures = scrape_section(cfg)
        print(f"{len(entries)} entries, {len(failures)} failures → {cfg['json_file']}")
        # aggregate per game
        if key.startswith("sts1"):
            all_by_game["sts1"].extend(entries)
        else:
            all_by_game["sts2"].extend(entries)

    # write combined files
    with open("sts1_enemies.json", "w", encoding="utf-8") as f:
        json.dump(all_by_game["sts1"], f, indent=4, ensure_ascii=False)
    with open("sts2_enemies.json", "w", encoding="utf-8") as f:
        json.dump(all_by_game["sts2"], f, indent=4, ensure_ascii=False)

    print("Done. Combined files: sts1_enemies.json, sts2_enemies.json")
