if [ -z "$PS_COLOUR" ]; then
    PS_COLOUR="34m"
fi

PS1="${debian_chroot:+($debian_chroot)}\[\033[00;${PS_COLOUR}\]\u@\h\[\033[00m\] \[\033[00;${PS_COLOUR}\]\w\[\033[00m\]\n\$ "

alias ll="ls -alF"
alias la="ls -A"
alias l="ls -lF"
alias lh="ls -lFh"

alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias uuuu="cd ../../../.."

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
