#!/bin/bash -eux

PLUGINS=~/.local/share/nvim/site/pack/git-plugins/start
REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

if [ -d ${PLUGINS} ]; then
    echo "${PLUGINS} already exists..."
    exit
fi

mkdir -p ${PLUGINS}
pushd ${PLUGINS}

git clone --depth 1 https://github.com/w0rp/ale.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/NLKNguyen/papercolor-theme.git
git clone https://github.com/nocksock/python-vim.git
# git clone https://github.com/ervandew/supertab.git
git clone https://github.com/ap/vim-buftabline.git
git clone https://github.com/bfrg/vim-cpp-modern.git
git clone https://github.com/tpope/vim-dispatch.git
git clone https://github.com/Vimjas/vim-python-pep8-indent.git
git clone https://github.com/frazrepo/vim-rainbow

# vim-peter
ln -sf $REPO/vim-peter

popd
