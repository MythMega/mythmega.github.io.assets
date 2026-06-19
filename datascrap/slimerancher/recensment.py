import os

def list_all_files():
    root = os.getcwd()
    files = []

    for current_path, dirs, filenames in os.walk(root):
        for f in filenames:
            full_path = os.path.join(current_path, f)
            files.append(full_path)

    for path in sorted(files):
        print(path)

if __name__ == "__main__":
    list_all_files()
