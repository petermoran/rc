#!/bin/bash -eux

# Install packages from personal package archives.
PPAS=(
    ppa:kgilmer/speed-ricer
    ppa:mmstick76/alacritty
)

for ppa in ${PPAS[*]}; do
    sudo add-apt-repository ${ppa}
done

PACKAGES=(
    i3-gaps     # speed-ricer
    alacritty   # alacritty
)

sudo apt install ${PACKAGES[*]}

# Extra packages available in default ubuntu archives.
PACKAGES=(
    i3blocks
    rofi
)

sudo apt install ${PACKAGES[*]}

# Install iosevka fonts.
mkdir -p ${HOME}/.fonts/tmp
pushd ${HOME}/.fonts/tmp
wget https://github.com/be5invis/Iosevka/releases/download/v3.1.0/ttf-iosevka-3.1.0.zip
unzip ttf-iosevka-3.1.0.zip
mv ttf/* ${HOME}/.fonts
popd
rm -rf ${HOME}/.fonts/tmp
sudo fc-cache
