export PATH=$PATH:~/.bin
if [ $TERM == 'xterm' ]; then
    export TERM='xterm-256color'
fi

# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

. ~/.bash_aliases
. ~/.bash_functions
