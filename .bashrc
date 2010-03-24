export PATH=~/.bin:~/.bin/openoffice:$PATH
#if [ $TERM == 'xterm' ]; then
#    export TERM='xterm-256color'
#fi

# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PAGER="most"

. ~/.bash.private
. ~/.bash_aliases
. ~/.bash_functions

export PYTHONPATH=$PYTHONPATH:~/.pythonpath/
