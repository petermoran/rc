# Simple colour prompt.
colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

if [ -z "$PS_COLOUR" ]; then
    PS_COLOUR="36m"
fi

# PS1="${debian_chroot:+($debian_chroot)}\[\033[00;${PS_COLOUR}\]\u@\h\[\033[00m\] \[\033[00;${PS_COLOUR}\]\w\[\033[00m\]\n\$ "

# Simple PS1 without colors using format arg. Feel free to use PROMPT_COMMAND
# export PS1="\u@\h \w \$(__fastgit_ps1)$ "
export PS1="\[\033[00;${PS_COLOUR}\]\u@\h \w\[\033[00m\]\$(__fastgit_ps1)\n\$ "

# 100% pure Bash (no forking) function to determine the name of the current git branch
# https://gist.github.com/Ragnoroct/c4c3bf37913afb9469d8fc8cffea5b2f
# taken from the comment about supporting submodules
function __fastgit_ps1 () {
    local _head_file _head
    local _dir="$PWD"

    while [[ -n "$_dir" ]]; do
        _head_file="$_dir/.git/HEAD"
        if [[ -f "$_dir/.git" ]]; then
            read -r _head_file < "$_dir/.git" && _head_file="$_dir/${_head_file#gitdir: }/HEAD"
        fi
        [[ -e "$_head_file" ]] && break
        _dir="${_dir%/*}"
    done

    if [[ -e "$_head_file" ]]; then
        read -r _head < "$_head_file" || return
        case "$_head" in
            ref:*) printf " [${_head#ref: refs/heads/}] " ;;
            "") ;;
            # HEAD detached
            *) printf " [${_head:0:9}] " ;;
        esac
        return 0
    fi

    return 1
}


HISTSIZE=10000
HISTFILESIZE=20000

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if type -P dircolors >/dev/null ; then
	if [[ -f ~/.dir_colors ]] ; then
		eval $(dircolors -b ~/.dir_colors)
	elif [[ -f /etc/DIR_COLORS ]] ; then
		eval $(dircolors -b /etc/DIR_COLORS)
	fi
fi

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

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
# alias c="TCLLIBPATH=/usr/lib/tcltk/x86_64-linux-gnu unbuffer nice make -j$(nproc) 2>&1 | tee /tmp/last_build.tmp | more && sed -i 's/\x1b\[[0-9;]*m//g;s/\x1b\[K//g' /tmp/last_build.tmp"
# note: find correct path by searching for tcl file find /usr -name '*.tcl'
# e.g: /usr/lib/tcltk/x86_64-linux-gnu/expect5.45.4/pkgIndex.tcl

alias mj="nice make -j $(nproc)"

# fix ipython qt plot issues
alias ipython='ipython --TerminalIPythonApp.gui="qt"'

# alias tmux="TERM=xterm-256color tmux"
alias tmux="tmux -2"

# add usr/bin to path if not found
for dir in $HOME/usr/bin $HOME/bin $HOME/.local/bin; do
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

xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# export settings
export EDITOR=vi
export HISTCONTROL=ignoreboth:erasedups
export FZF_DEFAULT_COMMAND='rg --files'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=00;33:quote=01;34'
