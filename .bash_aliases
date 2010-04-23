#
#    Bash aliases
#
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias 'l'='ls -l'
alias 'md'='mkdir -p'

# Python stuff
alias 'i'='ipython'
alias 'django'='python manage.py'
alias 'clean'='find -name "*.pyc" -exec rm {} \;'

# vim
alias 'vimrc'='vim ~/.vimrc'

# Commands
alias 'untargz'='tar zxvf'
alias 'untarbz'='tar xjvf'
alias 'untar'='tar xvf'
alias 'psp'='ps aux | grep $1'


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

function netuntargz() { wget -O - $1 | untargz -; }
function netuntar() { wget -O - $1 | untar -; }
function netview() { wget -O - -q $1; }
function netmd5() { wget -O - $1 | md5sum; }
