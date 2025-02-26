import os.path as path
from os import system

home = path.expanduser("~")
neovim_path = home + "/.config/nvim"

if path.exists(neovim_path):
    print("El directorio ya exixte")
else:
    system(f"mkdir {neovim_path}")
 
if path.exists(neovim_path + "/lua"):
    system("rm -rf {neovim_path}/lua");
    print("Se ha borrado correctamente")

