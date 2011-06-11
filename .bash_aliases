#!/bin/sh
#
#    Bash aliases
#
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=always -1 --ignore "*.pyc"'
#alias 'ls'='ls -l'
alias md='mkdir -p'

# Python stuff
alias clean='find -name "*.pyc" -exec rm {} \;'

# Scheme
alias i='rlwrap -q\" ikarus'

alias lgem='gem install -i ~/.gems --no-ri --no-rdoc'

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
