#!/bin/bash -eux

if [ -d ~/.vim/bundle ]; then
    echo "~/.vim/bundle already exists..."
    exit
fi

REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# pathogen
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# plugins
pushd ~/.vim/bundle

# git clone --recursive https://github.com/python-mode/python-mode.git
git clone https://github.com/w0rp/ale.git
git clone https://github.com/morhetz/gruvbox.git
git clone https://github.com/luochen1990/rainbow.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/bfrg/vim-cpp-modern.git
git clone https://github.com/Vimjas/vim-python-pep8-indent.git
git clone https://github.com/drmingdrmer/vim-tabbar.git

# Extras:
# - install ccls

# vim-peter
ln -sf $REPO/vim/bundle/vim-peter

popd

# vimrc
ln -s $REPO/vimrc ~/.vimrc
