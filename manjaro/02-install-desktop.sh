#!/bin/bash -eux

# yay AUR helper.
# if [ ! -x "$(command -v yay)" ]; then
#     mkdir -p ~/usr/src
#     pushd ~/usr/src
#     rm -rf yay
#     git clone https://aur.archlinux.org/yay.git
#     cd yay
#     makepkg -si
#     popd
# fi
pacman -S git base-devel
pacman -S yay

# Install packages from standard repos first, then AUR.
yay -Syu
yay -S --needed i3-gaps i3blocks neovim feh alacritty tmux expect cmake gdb fzf ripgrep
yay -S --needed neovim-drop-in ttf-iosevka spotify slack-desktop
