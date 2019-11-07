# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# if [ -z "$PS_COLOUR" ]; then
#     PS_COLOUR="34m"
# fi

# PS1="${debian_chroot:+($debian_chroot)}\[\033[00;${PS_COLOUR}\]\u@\h\[\033[00m\] \[\033[00;${PS_COLOUR}\]\w\[\033[00m\]\n\$ "
# PS1="\[\033[00;${PS_COLOUR}\]\u@\h\[\033[00m\] \[\033[00;${PS_COLOUR}\]\w\[\033[00m\]\n\$ "
# source ${HOME}/repo/petermoran/rc/bash_prompt

HISTSIZE=10000
HISTFILESIZE=20000

alias ls="ls --color=auto"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -lF"
alias lh="ls -lFh"
alias lt="ls -ltr"

alias less='less -R'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias uuuu="cd ../../../.."
alias uuuuu="cd ../../../../.."
alias uuuuuu="cd ../../../../../.."
alias uuuuuuu="cd ../../../../../../.."

# alias c='unbuffer nice make -j18 2>&1 | more'
# alias c="unbuffer nice make -j18 2>&1 | tee /tmp/last_build.tmp | more && sed -i 's/\x1b\[[0-9;]*m//g;s/\x1b\[K//g' /tmp/last_build.tmp"
alias c="TCLLIBPATH=/usr/lib/tcltk/x86_64-linux-gnu unbuffer nice make -j$(nproc) 2>&1 | tee /tmp/last_build.tmp | more && sed -i 's/\x1b\[[0-9;]*m//g;s/\x1b\[K//g' /tmp/last_build.tmp"
# note: find correct path by searching for tcl file find /usr -name '*.tcl'
# e.g: /usr/lib/tcltk/x86_64-linux-gnu/expect5.45.4/pkgIndex.tcl

alias mj="nice make -j $(nproc)"

alias vc="vim -q /tmp/last_build.tmp"

# fix ipython qt plot issues
alias ipython='ipython --TerminalIPythonApp.gui="qt"'

# alias tmux="TERM=xterm-256color tmux"
alias tmux="tmux -2"

# add usr/bin to path if not found
for dir in $HOME/usr/bin ; do
  case ":$PATH:" in
    *":$dir:"*) :;; # already there
    *) PATH="$dir:$PATH";;
  esac
done

# add usr dir to ld and pkg path
export LD_LIBRARY_PATH="$HOME/usr/lib"
export PKG_CONFIG_PATH="$HOME/usr/lib/pkgconfig"

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# use vi of course
export EDITOR=vi

export HISTCONTROL=ignoreboth:erasedups

# fzf use rg so we can use .ignore
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_COMMAND='rg --files'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=00;33:quote=01;34'
