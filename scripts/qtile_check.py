import os.path as path
from os import system

home = path.expanduser("~")
qtile_path = home + "/.config/qtile"

if path.exists(qtile_path):
    system(
        f"rm -rf {qtile_path}"
    )
    print(f"Se ha eliminado {qtile_path} correctamente")
    
    system(
        f"ln -s {home}/.dotfiles/homemanager/qtile {home}/.config/qtile"
    )
    print("Se ha creado correctamente el link simbolico")
