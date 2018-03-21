#!/bin/bash eux

# pathogen
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# plugins
cd ~/.vim/bundle

# supertab
git clone https://github.com/ervandew/supertab.git

# python-mode
git clone --recursive https://github.com/python-mode/python-mode.git

# solarized
git clone https://github.com/altercation/vim-colors-solarized

cd -

# colourscheme
mkdir -p ~/.vim/colors
curl -LSso ~/.vim/colors/zenburn.vim https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim
