import os
from PIL import Image

INPUT_DIR = "output_scaled"
OUTPUT_DIR = "share_snippet_open"
UNDERLAY_PATH = "_underlay_open.png"

# Charger l'underlay
underlay = Image.open(UNDERLAY_PATH).convert("RGBA")
uw, uh = underlay.size

# Créer le dossier de sortie
os.makedirs(OUTPUT_DIR, exist_ok=True)

for filename in os.listdir(INPUT_DIR):
    if not filename.lower().endswith((".png", ".jpg", ".jpeg")):
        continue

    treated_path = os.path.join(INPUT_DIR, filename)
    treated_img = Image.open(treated_path).convert("RGBA")

    sub = "non scale"
    # Vérifier la hauteur
    tw, th = treated_img.size
    if th > 200:
        sub = "Scaled !"
        # Scale down uniquement la hauteur, sans interpolation
        new_height = 200
        new_width = int(tw * (new_height / th))

        treated_img = treated_img.resize(
            (new_width, new_height),
            resample=Image.NEAREST  # pas d'interpolation
        )

        tw, th = treated_img.size  # mettre à jour les dimensions

    # Calcul du centrage
    x = (uw - tw) // 2
    y = (uh - th) // 2

    # Combinaison
    combined = underlay.copy()
    combined.alpha_composite(treated_img, (x, y))

    # Sauvegarde
    output_path = os.path.join(OUTPUT_DIR, filename)
    combined.save(output_path)

    print(f"✔️ Créé : {output_path} • {sub}")

print("🎉 Toutes les images ont été générées dans share_snippet/")
