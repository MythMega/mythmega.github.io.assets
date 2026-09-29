import os
from PIL import Image

# Dimensions cibles (Largeur x Hauteur)
TARGET_WIDTH = 702
TARGET_HEIGHT = 984


def crop_center_images(directory="."):
  # Extensions d'images prises en charge
  valid_extensions = (".png", ".jpg", ".jpeg", ".webp")

  count = 0
  for filename in os.listdir(directory):
    # Ignorer les fichiers qui se terminent déjà par -cropped
    if filename.lower().endswith(
        valid_extensions
    ) and not filename.lower().endswith("-cropped.png"):
      file_path = os.path.join(directory, filename)

      try:
        with Image.open(file_path) as img:
          width, height = img.size

          # Calculer les coordonnées du centre pour le recadrage
          left = max(0, (width - TARGET_WIDTH) // 2)
          top = max(0, (height - TARGET_HEIGHT) // 2)
          right = min(width, left + TARGET_WIDTH)
          bottom = min(height, top + TARGET_HEIGHT)

          # Rogner l'image
          cropped_img = img.crop((left, top, right, bottom))

          # Construire le nouveau nom de fichier (ex: waste.png -> waste-cropped.png)
          name, ext = os.path.splitext(filename)
          output_filename = f"{name}-cropped{ext}"
          output_path = os.path.join(directory, output_filename)

          # Sauvegarder
          cropped_img.save(output_path)
          print(f"[Succès] {filename} -> {output_filename}")
          count += 1

      except Exception as e:
        print(f"[Erreur] Impossible de traiter {filename} : {e}")

  print(f"\nTerminé ! {count} image(s) traitée(s).")


if __name__ == "__main__":
  # Le script s'exécute dans le dossier où il est lancé
  crop_center_images()