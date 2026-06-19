import os
import numpy as np
from PIL import Image, ImageFilter

# Réglages
COLOR_DIST_THRESHOLD = 1
BLUR_RADIUS = 3
CORNER_SAMPLE = 10

def estimate_background_color(np_img, sample=CORNER_SAMPLE):
    h, w, _ = np_img.shape
    corners = []
    corners.append(np_img[0:sample, 0:sample].reshape(-1,3))
    corners.append(np_img[0:sample, w-sample:w].reshape(-1,3))
    corners.append(np_img[h-sample:h, 0:sample].reshape(-1,3))
    corners.append(np_img[h-sample:h, w-sample:w].reshape(-1,3))
    all_pixels = np.vstack(corners)
    bg_color = np.median(all_pixels, axis=0)
    return bg_color.astype(np.float32)

def color_distance(a, b):
    return np.sqrt(np.sum((a - b) ** 2, axis=2))

def remove_background(img_path,
                      out_path=None,
                      color_dist_threshold=COLOR_DIST_THRESHOLD,
                      blur_radius=BLUR_RADIUS):
    img = Image.open(img_path).convert("RGBA")
    w, h = img.size
    np_img = np.array(img).astype(np.float32)

    rgb = np_img[..., :3]
    alpha_orig = np_img[..., 3] / 255.0

    bg_color = estimate_background_color(rgb)
    dist = color_distance(rgb, bg_color)
    mask = (dist > color_dist_threshold).astype(np.float32)

    mask_img = Image.fromarray((mask * 255).astype(np.uint8))
    mask_img = mask_img.filter(ImageFilter.GaussianBlur(radius=blur_radius))
    mask_blurred = np.array(mask_img).astype(np.float32) / 255.0

    combined_mask = mask_blurred * np.maximum(alpha_orig, 0.0)
    eps = 1e-6
    mask_safe = np.clip(combined_mask, eps, 1.0)[..., None]

    bg_color_arr = bg_color.reshape((1,1,3))
    fg = (rgb - bg_color_arr * (1.0 - mask_safe)) / mask_safe
    fg = np.clip(fg, 0, 255)

    out_alpha = (combined_mask * 255.0).astype(np.uint8)
    out_rgb = fg.astype(np.uint8)
    out_np = np.dstack([out_rgb, out_alpha])
    out_img = Image.fromarray(out_np, mode="RGBA")

    # --- Nouveau comportement : enregistrer dans ./out/<img_name>.png ---
    out_dir = os.path.join(".", "out")
    os.makedirs(out_dir, exist_ok=True)

    if out_path is None:
        base_name = os.path.splitext(os.path.basename(img_path))[0]
        out_path = os.path.join(out_dir, f"{base_name}.png")

    out_img.save(out_path, "PNG")
    return out_path

def batch_process_folder(folder="."):
    for fname in os.listdir(folder):
        name, ext = os.path.splitext(fname)
        ext = ext.lower()
        if ext in [".png", ".jpg", ".jpeg", ".webp"]:
            path = os.path.join(folder, fname)
            try:
                out = remove_background(path)
                print(f"Traitée : {fname} -> {os.path.basename(out)}")
            except Exception as e:
                print(f"Erreur sur {fname} : {e}")

if __name__ == "__main__":
    batch_process_folder(".")
