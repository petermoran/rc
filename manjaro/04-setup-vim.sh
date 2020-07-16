#!/bin/bash -eux

PLUGINS=~/.local/share/nvim/site/pack/git-plugins/start
REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

if [ -d ${PLUGINS} ]; then
    echo "${PLUGINS} already exists..."
    exit
fi

mkdir -p ${PLUGINS}
pushd ${PLUGINS}

# git clone --recursive https://github.com/python-mode/python-mode.git
git clone --depth 1 https://github.com/w0rp/ale.git
git clone https://github.com/morhetz/gruvbox.git
git clone https://github.com/luochen1990/rainbow.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/bfrg/vim-cpp-modern.git
git clone https://github.com/Vimjas/vim-python-pep8-indent.git
git clone https://github.com/drmingdrmer/vim-tabbar.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/tpope/vim-dispatch.git
git clone https://github.com/jremmen/vim-ripgrep.git

# vim-peter
ln -sf $REPO/vim-peter

popd
