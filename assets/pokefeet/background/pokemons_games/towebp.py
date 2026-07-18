import os
from PIL import Image

def convert_to_webp_lossless():
    # Extensions reconnues
    valid_ext = {".png", ".jpg", ".jpeg", ".bmp", ".tiff"}

    for filename in os.listdir("."):
        name, ext = os.path.splitext(filename)
        ext_lower = ext.lower()

        if ext_lower in valid_ext:
            try:
                img = Image.open(filename)

                # Chemin de sortie
                output_file = f"{name}.webp"

                # Conversion optimisée sans perte
                img.save(output_file, "WEBP", lossless=True, method=6)

                print(f"Converti : {filename} → {output_file}")

            except Exception as e:
                print(f"Erreur avec {filename} : {e}")

if __name__ == "__main__":
    convert_to_webp_lossless()
