#!/bin/bash -eux

# Install packages from personal package archives.
PPAS=(
    ppa:linrunner/tlp
)

for ppa in ${PPAS[*]}; do
    sudo add-apt-repository ${ppa}
done

PACKAGES=(
    tlp
    tlp-rdw
)

sudo apt install ${PACKAGES[*]}
