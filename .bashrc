# Check for an interactive session
[ -z "$PS1" ] && return

export PATH=/Users/j/Library/Haskell/bin:/Users/j/dev/dotfiles/sys/bin:/Users/j/.bin:"$PATH"

set -o vi

relpwd() {
    ~/dev/dotfiles/sys/bin/pathcrop "`echo -n $(pwd | sed \"s,$HOME,~,\")`"
}

PS1='\[\e[0;33m\]\h $(relpwd)\[\e[0m\] '
PAGER=less


export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=999999
export HISTIGNORE="ls:git:.."


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls -G -1'
alias md='mkdir -p'
alias fixgit="sed -i '' 's/https:\/\/github\.com\//git@github.com:/g' .git/config"

j() {
  if [ -z "$1" ]; then
    if [ -d ".env" ]; then
      source .env/bin/activate
    else
      source env/bin/activate
    fi
  else
    source $1/bin/activate
  fi
}

export DISPLAY=:0.0
export LC_ALL=en_US.UTF-8


# # # GHCI HACK # # #
function ghcs {
  local DIR=$PWD
  local TARGET="cabal.sandbox.config"
  while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
    DIR=$(dirname $DIR)
  done
  local CMD=$1
  shift
  if test $DIR != "/"; then
    local DB=$(sed -ne '/^package-db: */{s///p;q;}' "$DIR/$TARGET")
    command $CMD -no-user-package-db -package-db="$DB" "$@"
  else
    command $CMD "$@"
  fi
}

alias ghc='ghcs ghc'
alias ghci='ghcs ghci'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
