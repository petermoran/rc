#!/bin/bash -eux

pacman -S base-devel
pacman -S yay

pacman -S neovim alacritty tmux ttc-iosevka fzf ripgrep
pacman -S i3-gaps i3blocks feh rofi dunst dunstify
pacman -S firefox sysstat
# pacman -S vivaldi vivaldi-ffmpeg-codecs
yay -S neovim-symlinks
yay -S spotify
yay -S slack-desktop
