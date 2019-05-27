#!/bin/bash -eux

PACKAGES="vim neovim fonts-firacode git tmux build-essential cmake mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev curl googletest expect gdb awesome awesome-extra lxterminal zlib1g-dev"
sudo apt install $PACKAGES

# Extras:
# - llvm [https://apt.llvm.org/]
# - ccls [https://github.com/MaskRay/ccls/wiki/Build]
