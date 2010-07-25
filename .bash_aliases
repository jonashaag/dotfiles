#!/bin/sh
#
#    Bash aliases
#
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias 'ls'='ls --color=auto'
alias 'l'='ls -l'
alias 'md'='mkdir -p'

# Python stuff
alias 'i'='ipython'
alias 'django'='python manage.py'
alias 'clean'='find -name "*.pyc" -exec rm {} \;'

# vim
alias 'vimrc'='vim ~/.vimrc'

# Commands
alias 'psp'='ps aux | grep $1'
alias 'unpack'='aunpack'
alias 'fixgit'="sed -i 's/git:\/\/github\.com\//git@github.com:/g' .git/config"
alias 'compl'='. /etc/bash_completion'
alias 'hget'='wget -O /dev/null -S -v --spider'


search() {
    if [ -z $2 ]; then
        DIR='.'
        REGEXP=$1
    else
        DIR=$1
        REGEXP=$2
    fi
    if [ ! -z $3 ]; then
        GREPOPT=$3
    else
        GREPOPT=''
    fi
    grep -nHIirE${GREPOPT} -- "$REGEXP" "$DIR"
}

netunpack() { wget -O - $1 | unpack -; }
