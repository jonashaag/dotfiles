#!/bin/sh
#
#    Bash aliases
#
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto -l'
#alias 'ls'='ls -l'
alias md='mkdir -p'

# Python stuff
alias clean='find -name "*.pyc" -exec rm {} \;'

# vim
alias vimrc='vim ~/.vimrc'

# Commands
alias sp='ps aux | grep $1'
alias fixgit="sed -i 's/git:\/\/github\.com\//git@github.com:/g' .git/config"
alias compl='. /etc/bash_completion'
alias hget='wget -O /dev/null -S -v --spider'
alias torrent=transmission-cli

unpack() {
    aunpack $1 && rm $1
}
