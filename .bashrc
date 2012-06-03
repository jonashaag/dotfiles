[ -s "/jonas/.scm_breeze/scm_breeze.sh" ] && source "/jonas/.scm_breeze/scm_breeze.sh"

export PATH=~/.bin:~/sys/bin:$PATH:~/.gem/ruby/1.9.1/bin:~/.local/bin/
export PYTHON=python2
#if [ $TERM == 'xterm' ]; then
#    export TERM='xterm-256color'
#fi

# Check for an interactive session
[ -z "$PS1" ] && return

set -o vi

relpwd() {
    ~/sys/bin/pathcrop "`echo -n $(pwd | sed s,$HOME/,~/, | sed s,^$HOME$,~,)`"
}

PS1='\[\e[0;33m\]\h $(relpwd)\[\e[0m\] '
PAGER=less

. ~/.bash.private
. ~/.bash_aliases
. ~/.bash_functions

workon() {
    export WORKON_HOME=~/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=python2
    export VIRTUALENVWRAPPER_VIRTUALENV=virtualenv2
    export VIRTUALENV_USE_DISTRIBUTE=yep
    eval 'source $(which virtualenvwrapper.sh)' 
    workon $@
}

export PYTHONPATH=~/.syspath:$PYTHONPATH
export MOZ_DISABLE_PANGO=1
export GREP_OPTIONS='--color=auto'

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=999999
export HISTIGNORE="ls:wget:pass:git commit:git co:git checkout:git reset:git push:.."
