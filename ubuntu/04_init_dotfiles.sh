#!/bin/bash -eux

REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"

cat > ~/.bashrc <<EOF
# If not running interactively, don't do anything
case \$- in
    *i*) ;;
      *) return;;
esac

# Source common and local rc
source $REPO/bashrc
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
EOF

for RC in inputrc tmux.conf ; do
    rm -f ~/.$RC
    ln -s $REPO/$RC ~/.$RC
done

for CONFIG in alacritty autostart i3 lxterminal nvim wallpaper ; do
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
