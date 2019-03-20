#!/bin/bash -eux

# Note: run from repo dir, i.e. as $ ./vim-setup.sh
# Also assumes you have installed cppcheck and clang-format.

REPO=$(pwd)

# pathogen
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# plugins
pushd ~/.vim/bundle

git clone https://github.com/morhetz/gruvbox
git clone --recursive https://github.com/python-mode/python-mode.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/bfrg/vim-cpp-modern.git
git clone https://github.com/luochen1990/rainbow.git
git clone git://github.com/drmingdrmer/vim-tabbar.git

# vim-peter
ln -sf $REPO/vim/bundle/vim-peter


popd
