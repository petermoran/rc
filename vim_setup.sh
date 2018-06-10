#!/bin/bash -eux

# pathogen
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# plugins
pushd ~/.vim/bundle

# supertab
git clone https://github.com/ervandew/supertab.git

# python-mode
git clone --recursive https://github.com/python-mode/python-mode.git

# gruvbox
git clone https://github.com/morhetz/gruvbox

popd
