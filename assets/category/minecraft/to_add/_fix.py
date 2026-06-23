import os

for filename in os.listdir("."):
    if filename.lower().endswith(".png"):
        name, ext = os.path.splitext(filename)

        new_name = name
        while new_name.endswith("_"):
            new_name = new_name[:-1]

        final_name = new_name + ext

        if final_name != filename:
            print(f"Nettoyage : {filename} → {final_name}")
            os.rename(filename, final_name)
