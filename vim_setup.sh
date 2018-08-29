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

# gruvbox
git clone https://github.com/morhetz/gruvbox

# python-mode
git clone --recursive https://github.com/python-mode/python-mode.git

# supertab
git clone https://github.com/ervandew/supertab.git

# syntastic
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

# vim-cpp-modern
git clone https://github.com/bfrg/vim-cpp-modern.git

# vim-peter
ln -sf $REPO/vim/bundle/vim-peter

popd
