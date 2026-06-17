import os
from PIL import Image

# Sensibilité pour détecter le blanc (0 = strict, 255 = tolérant)
# enlever + de blanc => dimiuer cette valeur
WHITE_THRESHOLD = 230 

def remove_white_background(img, threshold=WHITE_THRESHOLD):
    img = img.convert("RGBA")
    datas = img.getdata()
    new_data = []

    for r, g, b, a in datas:
        # Si pixel proche du blanc → transparent
        if r > threshold and g > threshold and b > threshold:
            new_data.append((255, 255, 255, 0))
        else:
            new_data.append((r, g, b, a))

    img.putdata(new_data)
    return img

def convert_images_in_folder():
    for filename in os.listdir("."):
        name, ext = os.path.splitext(filename)
        ext = ext.lower()

        # Conversion WEBP → PNG
        if ext == ".webp":
            img = Image.open(filename).convert("RGBA")
            output = f"{name}.png"
            img.save(output, "PNG")
            print(f"Converti WEBP → PNG : {output}")

        # Conversion JPG/JPEG → PNG avec suppression du fond blanc
        elif ext in [".jpg", ".jpeg"]:
            img = Image.open(filename)
            img_no_bg = remove_white_background(img)
            output = f"{name}.png"
            img_no_bg.save(output, "PNG")
            print(f"Converti JPG → PNG (fond blanc supprimé) : {output}")

if __name__ == "__main__":
    convert_images_in_folder()
