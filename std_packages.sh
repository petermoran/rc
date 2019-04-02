#!/bin/sh

PACKAGES="vim neovim fonts-firacode git tmux build-essential cmake g++-8 mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev curl googletest expect gdb"
sudo apt install $PACKAGES

# Extras:
# - llvm [https://apt.llvm.org/]
# - ccls [https://github.com/MaskRay/ccls/wiki/Build]
