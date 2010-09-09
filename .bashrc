export PATH=~/.bin:~/.bin/openoffice:$PATH
#if [ $TERM == 'xterm' ]; then
#    export TERM='xterm-256color'
#fi

# Check for an interactive session
[ -z "$PS1" ] && return

relpwd() {
    ~/sys/bin/pathcrop "`echo -n $(pwd | sed s,$HOME,~,)`"
}

PS1='\[\e[0;33m\]$(relpwd)\[\e[0m\] '
PAGER=less

. ~/.bash.private
. ~/.bash_aliases
. ~/.bash_functions

export PYTHONPATH=~/.syspath:$PYTHONPATH
