#
#    Bash aliases
#
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias 'l'='ls -l'
alias 'md'='mkdir -p'
alias 'rm'='del'

# Python stuff
alias 'i'='ipython'
alias 'django'='python manage.py'
alias 'clean'='find -name "*.pyc" -exec rm {} \;'

# vim
alias 'vimrc'='vim ~/.vimrc'

# Commands
alias 'psp'='ps aux | grep $1'
alias 'unpack'='aunpack'


function search() {
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

function netunpack() { wget -O - $1 | unpack -; }
