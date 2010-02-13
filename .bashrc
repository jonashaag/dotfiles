export PATH=$PATH:~/.bin

# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

. ~/.bash_aliases
. ~/.bash_functions
