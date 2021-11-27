#!/bin/bash -eux

REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

cat > ~/.bashrc <<EOF
[[ $- != *i* ]] && return

source $REPO/bashrc
source $REPO/bash_prompt
source ~/.bashrc.local
EOF

touch ~/.bashrc.local

for RC in inputrc tmux.conf ; do
    rm -f ~/.$RC
    ln -s $REPO/$RC ~/.$RC
done

for CONFIG in alacritty ; do
    rm -rf ~/.config/$CONFIG
    ln -s $REPO/config/$CONFIG ~/.config/$CONFIG
done

cat > ~/.gitconfig <<EOF
[alias]
    co = checkout
    ci = commit
    st = status
    br = branch
    hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
    type = cat-file -t
    dump = cat-file -p
EOF

mkdir -p ~/usr/bin
