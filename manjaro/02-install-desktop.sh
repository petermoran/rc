#!/bin/bash -eux

# yay AUR helper.
if [ ! -x "$(command -v yay)" ]; then
    mkdir -p ~/usr/src
    pushd ~/usr/src
    rm -rf yay
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    popd
fi

# Install packages from standard repos first, then AUR.
yay -Syu
yay -S --needed i3-gaps i3blocks neovim qutebrowser feh xterm lxappearance lxterminal alacritty tmux expect cmake gdb ccache clang llvm fzf ripgrep manjarozfs
yay -S --needed neovim-drop-in ttf-iosevka ccls spotify slack-desktop
