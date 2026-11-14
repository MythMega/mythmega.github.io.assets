import os
from pathlib import Path
from PIL import Image

def format_size(size_bytes):
    """Formate une taille en octets en Ko ou Mo de manière lisible."""
    if size_bytes >= 1024 * 1024:
        return f"{size_bytes / (1024 * 1024):.2f} Mo"
    elif size_bytes >= 1024:
        return f"{size_bytes / 1024:.2f} Ko"
    else:
        return f"{size_bytes} octets"

def convert_images_to_webp(quality=80):
    root_dir = Path(".")
    image_extensions = {".png", ".jpg", ".jpeg"}
    
    # Demande de l'override au lancement
    user_input = input("Voulez-vous écraser (override) les fichiers WebP existants ? (o/n) : ").strip().lower()
    override = user_input in {"o", "oui", "y", "yes"}
    
    results = []
    
    print("\n🚀 Début de la conversion récursive en WebP...\n")
    
    # Parcours récursif du répertoire courant
    for file_path in root_dir.rglob("*"):
        if file_path.is_file() and file_path.suffix.lower() in image_extensions:
            webp_path = file_path.with_suffix(".webp")
            
            # Vérification si le WebP existe déjà et si on ne doit pas override
            if not override and webp_path.exists():
                try:
                    orig_size = file_path.stat().st_size
                    webp_size = webp_path.stat().st_size
                    saved_size = orig_size - webp_size
                    
                    results.append({
                        "path": str(file_path),
                        "orig_size": orig_size,
                        "webp_size": webp_size,
                        "saved_size": saved_size
                    })
                    
                    print(f"⏭️  Ignoré (déjà existant) : {file_path} -> {webp_path.name}")
                except Exception as e:
                    print(f"❌ Erreur sur {file_path} : {e}")
                continue
            
            try:
                # Ouverture et conversion de l'image
                with Image.open(file_path) as img:
                    img.save(webp_path, "WEBP", quality=quality, method=6)
                
                orig_size = file_path.stat().st_size
                webp_size = webp_path.stat().st_size
                saved_size = orig_size - webp_size
                
                results.append({
                    "path": str(file_path),
                    "orig_size": orig_size,
                    "webp_size": webp_size,
                    "saved_size": saved_size
                })
                
                print(f"✔ Converti : {file_path} -> {webp_path.name} "
                      f"(Orig: {format_size(orig_size)} | WebP: {format_size(webp_size)} | Gagné: {format_size(saved_size)})")
                
            except Exception as e:
                print(f"❌ Erreur sur {file_path} : {e}")
                
    if not results:
        print("\n⚠️ Aucune image compatible trouvée dans le répertoire.")
        return

    # Calculs des statistiques
    total_files = len(results)
    total_orig = sum(r["orig_size"] for r in results)
    total_webp = sum(r["webp_size"] for r in results)
    total_saved = total_orig - total_webp
    
    avg_saved_bytes = total_saved / total_files
    avg_saved_x5 = avg_saved_bytes * 5  # Poids moyen gagné estimé pour 5 fichiers

    # Affichage du rapport final
    print("\n" + "="*50)
    print("📊 RAPPORT DE CONVERSION ET GAINS DE POIDS")
    print("="*50)
    print(f"• Nombre total d'images traitées        : {total_files}")
    print(f"• Poids moyen gagné par fichier         : {format_size(avg_saved_bytes)}")
    print(f"• Poids moyen gagné pour 5 fichiers (x5): {format_size(avg_saved_x5)}")
    print(f"• Poids total initial                   : {format_size(total_orig)}")
    print(f"• Poids total si on ne garde que le WebP: {format_size(total_webp)}")
    print(f"• **Poids total gagné (net)**           : **{format_size(total_saved)}**")
    print("="*50)

if __name__ == "__main__":
    convert_images_to_webp(quality=80)