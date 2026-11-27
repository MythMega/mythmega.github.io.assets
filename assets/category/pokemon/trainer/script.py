import os
import time
from urllib.parse import urljoin, urlparse
import requests
from bs4 import BeautifulSoup

URL = "https://play.pokemonshowdown.com/sprites/trainers/?view=dir"
OUTPUT_DIR = "trainers_sprites"
IMAGE_EXTENSIONS = (".png", ".jpg", ".jpeg", ".webp", ".gif")


def is_image_file(href: str) -> bool:
    """Vérifie que le lien pointe vers un fichier image (et pas un dossier ou un tri)."""
    if not href or href.startswith("?") or href.endswith("/"):
        return False
    clean_path = urlparse(href).path.lower()
    return clean_path.endswith(IMAGE_EXTENSIONS)


def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    headers = {
        "User-Agent": "Mozilla/5.0 (compatible; SpriteDownloader/1.0)"
    }

    print(f"Récupération de la page : {URL}")
    resp = requests.get(URL, headers=headers, timeout=15)
    resp.raise_for_status()

    soup = BeautifulSoup(resp.text, "html.parser")

    # On cible les lignes de la liste de fichiers (en excluant .header)
    rows = soup.select("ul.dirlist > li:not(.header) > a.row")

    image_urls = []
    for row in rows:
        href = row.get("href", "").strip()
        # Vérifie aussi l'icône si présente (ex: fa-folder-open pour un dossier)
        icon = row.find("i", class_="icon")
        if icon and "fa-folder" in " ".join(icon.get("class", [])):
            continue

        if is_image_file(href):
            full_url = urljoin(URL, href)
            image_urls.append(full_url)

    # Déduplication tout en conservant l'ordre
    image_urls = list(dict.fromkeys(image_urls))
    print(f"{len(image_urls)} images trouvées.")

    downloaded = 0
    skipped = 0

    for img_url in image_urls:
        filename = os.path.basename(urlparse(img_url).path)
        dest_path = os.path.join(OUTPUT_DIR, filename)

        if os.path.exists(dest_path):
            skipped += 1
            continue

        try:
            img_resp = requests.get(img_url, headers=headers, timeout=15)
            img_resp.raise_for_status()

            with open(dest_path, "wb") as f:
                f.write(img_resp.content)

            downloaded += 1
            print(f"[{downloaded}/{len(image_urls)}] Téléchargé : {filename}")
            time.sleep(0.05)  # Petite pause pour ne pas surcharger le serveur
        except requests.RequestException as e:
            print(f"Erreur sur {filename} : {e}")

    print(f"\nTerminé : {downloaded} téléchargées, {skipped} déjà présentes dans '{OUTPUT_DIR}'.")


if __name__ == "__main__":
    main()