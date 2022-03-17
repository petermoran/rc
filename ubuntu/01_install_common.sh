#!/bin/bash -eux

PACKAGES=(
    build-essential
    cmake
    curl
    expect
    feh
    fzf
    gcc-multilib
    gdb
    git
    neovim
    openssh-server
    pavucontrol
    ripgrep
    rlwrap
    tmux
)

sudo apt update
sudo apt upgrade
sudo apt install ${PACKAGES[*]}

# Extras:
# - llvm [https://apt.llvm.org/]
# - ccls [https://github.com/MaskRay/ccls/wiki/Build]
