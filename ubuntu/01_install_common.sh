#!/bin/bash -eux

PACKAGES=(
    build-essential
    cmake
    curl
    expect
    feh
    fonts-firacode
    fzf
    gcc-multilib
    git
    gdb
    lxterminal
    neovim
    openssh-server
    python3
    qutebrowser
    ripgrep
    rlwrap
    tmux
    vim
    zfsutils-linux
)

sudo apt update
sudo apt upgrade
sudo apt install ${PACKAGES[*]}

# Extras:
# - llvm [https://apt.llvm.org/]
# - ccls [https://github.com/MaskRay/ccls/wiki/Build]
