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

# alias tmux="TERM=screen-256color-bce tmux"
alias tmux="tmux -2"
