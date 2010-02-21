#
#    Bash aliases
#
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias 'l'='ls -l'

# Python stuff
alias 'i'='ipython'
alias 'django'='python manage.py'
alias 'clean'='find -name "*.pyc" -exec rm {} \;'

# vim
alias 'vimrc'='vim ~/.vimrc'

# Commands
alias 'untargz'='tar zxvf'
alias 'untar'='tar xvf'

function netuntargz() { wget -O - $1 | untargz -; }
function netuntar() { wget -O - $1 | untar -; }
