#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
scrap_raft.py
Scrape https://craftpedia.info/raft/ :
 - récupère la liste d'items
 - visite chaque page (ex: /raft/empty-cup)
 - extrait item_name, category, image
 - télécharge l'image dans ./raft/
 - génère raft.json avec item_name, category, imgpath (GitHub raw)
"""

import os
import re
import time
import json
from urllib.parse import urljoin, urlparse
import requests
from bs4 import BeautifulSoup

# -------- CONFIG --------
BASE_PAGE = "https://craftpedia.info/raft/"
OUTPUT_DIR = "./raft/"
JSON_OUTPUT = "raft.json"
GITHUB_RAW_BASE = "https://raw.githubusercontent.com/MythMega/mythmega.github.io.assets/refs/heads/master/assets/category/raft/"

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
    # Referer will be set per-request when needed
}

# create output dir
os.makedirs(OUTPUT_DIR, exist_ok=True)

# -------- helpers --------
INVALID_FILENAME_CHARS = r'<>:"/\\|?*\n\r\t'

def sanitize_filename(name: str, ext: str = ".png", max_len: int = 120) -> str:
    if not name:
        name = "item"
    s = name.strip().replace(" ", "_")
    s = re.sub(r'[<>:"/\\|?*\n\r\t]+', "_", s)
    s = "".join(ch for ch in s if ord(ch) >= 32)
    if len(s) > max_len:
        s = s[:max_len]
    # ensure extension
    if not s.lower().endswith(ext.lower()):
        s = s + ext
    return s

def clean_item_name(raw: str) -> str:
    return raw.strip()

def get_soup(url, referer=None, timeout=20):
    headers = HEADERS.copy()
    if referer:
        headers["Referer"] = referer
    r = requests.get(url, headers=headers, timeout=timeout)
    r.raise_for_status()
    return BeautifulSoup(r.text, "html.parser")

def download_file(url, dest_path, referer=None, timeout=30, retries=2):
    headers = HEADERS.copy()
    if referer:
        headers["Referer"] = referer
    for attempt in range(retries + 1):
        try:
            with requests.get(url, headers=headers, stream=True, timeout=timeout) as r:
                r.raise_for_status()
                with open(dest_path, "wb") as f:
                    for chunk in r.iter_content(chunk_size=8192):
                        if chunk:
                            f.write(chunk)
            return True
        except Exception as e:
            last_exc = e
            time.sleep(0.5 + attempt * 0.5)
    print(f"[ERROR] download failed {url}: {last_exc}")
    return False

# -------- scraping logic --------
def parse_index_and_get_items(index_url):
    soup = get_soup(index_url)
    wrapper = soup.find("div", class_="all-item-wrapper")
    if not wrapper:
        # fallback: find all links under that class anywhere
        wrapper = soup
    items = []
    for a in wrapper.find_all("a", href=True):
        href = a["href"].strip()
        # ignore anchors or external links
        if href.startswith("http"):
            page_url = href
        else:
            page_url = urljoin(index_url, href)
        # try to get name and image src from the inner structure
        name_tag = a.find(class_="all-single-item-name")
        img_tag = a.find("img", class_="all-single-item-img")
        name = name_tag.get_text(strip=True) if name_tag else (a.get("title") or "")
        img_src = img_tag.get("src") if img_tag else None
        items.append({
            "raw_name": name,
            "page_url": page_url,
            "img_src": img_src
        })
    return items

def parse_item_page(item):
    page_url = item["page_url"]
    try:
        soup = get_soup(page_url, referer=BASE_PAGE)
    except Exception as e:
        print(f"[WARN] failed to load {page_url}: {e}")
        return None

    # title
    title_tag = soup.find(id="left-card-title")
    if title_tag:
        item_name = title_tag.get_text(strip=True)
    else:
        # fallback to provided raw_name
        item_name = item.get("raw_name") or ""

    # image: inside div.img-left > img or first .left-card img
    img_tag = None
    left_card = soup.find("div", class_="left-card")
    if left_card:
        img_tag = left_card.find("img")
    if not img_tag:
        img_tag = soup.find("img")
    img_src = img_tag.get("src") if img_tag else item.get("img_src")

    # category: look for table.info-table and find "Category:"
    category = ""
    info_table = soup.find("table", class_="info-table")
    if info_table:
        for tr in info_table.find_all("tr"):
            tds = tr.find_all("td")
            if len(tds) >= 2:
                key = tds[0].get_text(strip=True).rstrip(":")
                val = tds[1].get_text(strip=True)
                if key.lower() == "category":
                    category = val
                    break

    return {
        "item_name": clean_item_name(item_name),
        "img_src": img_src,
        "category": category
    }

def build_image_url(img_src, page_url):
    if not img_src:
        return None
    # if src is relative like "rafticons/Empty_Cup.png"
    if img_src.startswith("http") or img_src.startswith("//"):
        if img_src.startswith("//"):
            return "https:" + img_src
        return img_src
    # otherwise join with page_url (or base)
    return urljoin(page_url, img_src)

def main():
    items = parse_index_and_get_items(BASE_PAGE)
    print(f"[INFO] Found {len(items)} candidate items on index page")

    results = []
    for idx, it in enumerate(items, 1):
        print(f"[{idx}/{len(items)}] Processing link -> {it['page_url']}")
        parsed = parse_item_page(it)
        if not parsed:
            print(f"[WARN] skip {it['page_url']}")
            continue

        item_name = parsed["item_name"]
        category = parsed["category"] or ""
        img_src = parsed["img_src"]
        img_url = build_image_url(img_src, it["page_url"])

        if not img_url:
            print(f"[WARN] no image for {item_name} ({it['page_url']})")
            continue

        # determine extension from URL path
        parsed_url = urlparse(img_url)
        ext = os.path.splitext(parsed_url.path)[1] or ".png"
        filename = sanitize_filename(item_name, ext=ext)
        filepath = os.path.join(OUTPUT_DIR, filename)

        # download image
        success = download_file(img_url, filepath, referer=it["page_url"])
        if not success:
            print(f"[WARN] image download failed for {item_name}, skipping")
            continue

        imgpath = GITHUB_RAW_BASE + filename
        results.append({
            "item_name": item_name,
            "category": category,
            "imgpath": imgpath
        })
        print(f"[OK] {item_name} -> {filename} (category: {category})")
        # small delay to be polite
        time.sleep(0.2)

    # write JSON
    with open(JSON_OUTPUT, "w", encoding="utf-8") as f:
        json.dump(results, f, indent=4, ensure_ascii=False)
    print(f"[DONE] {len(results)} items written to {JSON_OUTPUT}")

if __name__ == "__main__":
    main()
