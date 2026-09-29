import json
import io
import os
import re
import time
from PIL import Image
import requests
from playwright.sync_api import sync_playwright

def clean_filename(name):
    """Nettoie le nom pour éviter les problèmes de caractères interdits dans les fichiers."""
    return re.sub(r'[\\/*?:"<>|]', "", name).strip()

def has_real_transparency(img_bytes):
    """Vérifie si l'image possède des pixels réellement transparents."""
    try:
        img = Image.open(io.BytesIO(img_bytes))
        if img.mode in ('RGBA', 'LA') or (img.mode == 'P' and 'transparency' in img.info):
            img_rgba = img.convert('RGBA')
            extrema = img_rgba.getextrema()
            if extrema[3][0] < 255:
                return True
        return False
    except Exception as e:
        print(f"   [AVERTISSEMENT] Erreur lors de l'analyse de l'image : {e}")
        return False

def save_as_png(img_bytes, output_path):
    """Convertit et sauvegarde l'image en PNG."""
    img = Image.open(io.BytesIO(img_bytes))
    img.convert('RGBA').save(output_path, 'PNG')

def process_minecraft_items(json_file_path, output_dir="minecraft_icons"):
    # Créer le dossier de sortie s'il n'existe pas
    os.makedirs(output_dir, exist_ok=True)

    with open(json_file_path, 'r', encoding='utf-8') as f:
        items = json.load(f)

    print(f"Chargement de {len(items)} objets à traiter...")

    # Dossier pour stocker le profil Chrome persistant (cookies, session, etc.)
    user_data_dir = "./chrome_profile"

    with sync_playwright() as p:
        # Utilisation de launch_persistent_context au lieu de launch() + new_context()
        context = p.chromium.launch_persistent_context(
            user_data_dir,
            headless=False,
            args=[
                "--disable-blink-features=AutomationControlled",
                "--disable-infobars"
            ],
            user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
            viewport={"width": 1280, "height": 800}
        )
        
        page = context.pages[0] if context.pages else context.new_page()

        # Navigation initiale pour initialiser la session
        print("Ouverture de Google...")
        try:
            page.goto("https://www.google.com")
            time.sleep(2.0)
        except Exception:
            pass

        # Pause interactive pour résoudre le CAPTCHA si nécessaire lors du premier lancement
        input("\n[IMPORTANT] Si un CAPTCHA s'affiche dans le navigateur, résolvez-le maintenant.\nEnsuite, appuyez sur [Entrée] dans ce terminal pour lancer le script...")

        for index, item in enumerate(items, 1):
            name = item.get("Name_EN")
            mod = item.get("Mod", "")
            
            query = f"{name} {mod} item png icon"
            safe_name = clean_filename(name)
            output_path = os.path.join(output_dir, f"{safe_name}.png")

            # Si l'image existe déjà, on la saute
            if os.path.exists(output_path):
                print(f"\n[{index}/{len(items)}] {safe_name}.png existe déjà. Ignoré.")
                continue

            print(f"\n[{index}/{len(items)}] Recherche pour : {query}")
            
            search_url = f"https://www.google.com/search?tbm=isch&q={query.replace(' ', '+')}"
            
            try:
                page.goto(search_url)
                time.sleep(2.0)
            except Exception as e:
                print(f"   [ERREUR] Impossible d'accéder à la page pour {query}: {e}")
                continue

            # Gestion des cookies Google (si affiché)
            try:
                accept_button = page.locator("button:has-text('Tout accepter'), button:has-text('Accept all')")
                if accept_button.count() > 0:
                    accept_button.first.click()
                    time.sleep(1.0)
            except:
                pass

            # Attendre l'apparition des vignettes
            try:
                page.wait_for_selector('img.Q4LuWd, div.isv-r img', timeout=6000)
            except Exception:
                print(f"   [AVERTISSEMENT] Vignettes introuvables pour {query} (possible CAPTCHA).")
                input("Résolvez le CAPTCHA dans le navigateur, puis appuyez sur Entrée pour reprendre...")
                continue

            thumbnails = page.locator('img.Q4LuWd, div.isv-r img').all()
            downloaded = False
            iterations = min(len(thumbnails), 20)

            for i in range(iterations):
                try:
                    thumb = thumbnails[i]
                    thumb.click()
                    
                    time.sleep(1.5)

                    large_img_selector = 'img.iPVvYb, c-wiz img.sFlh5c, img[jsname="kn3ccd"]'
                    page.wait_for_selector(large_img_selector, timeout=4000)

                    large_img = page.locator(large_img_selector).first
                    img_url = large_img.get_attribute("src")

                    if not img_url or not img_url.startswith("http"):
                        continue

                    response = requests.get(img_url, timeout=6)
                    if response.status_code == 200:
                        img_data = response.content
                        
                        if has_real_transparency(img_data):
                            save_as_png(img_data, output_path)
                            print(f"   [SUCCÈS] Trouvé à l'essai {i+1} -> Sauvegardé : {output_path}")
                            downloaded = True
                            break
                        else:
                            print(f"   [INFO] Essai {i+1} : Pas de transparence, suivant...")
                except Exception as ex:
                    continue

            if not downloaded:
                print(f"   [ÉCHEC] Aucune icône transparente trouvée après {iterations} essais pour {name}.")

            # Pause de sécurité entre chaque objet
            time.sleep(3.5)

        context.close()
    print("\nTraitement de la liste terminé !")

if __name__ == "__main__":
    process_minecraft_items("A5 rawdata.json")