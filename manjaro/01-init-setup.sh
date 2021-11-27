#!/bin/bash -eux

# Create a local pacman mirror list.
sudo pacman-mirrors --country Australia
sudo pacman -Syu

# Manual steps:
# Check available nvidia drivers.
# sudo mhwd -l

# Install nvidia drivers.
# sudo mhwd -i pci video-nvidia-435xx
