HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory autocd extendedglob nomatch notify HIST_IGNORE_ALL_DUPS prompt_subst inc_append_history share_history
unsetopt beep

autoload -U compinit
compinit -C
## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
       'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^U' backward-delete-to-slash

backward-delete-to-slash () {
  local WORDCHARS=${WORDCHARS//\//}
  zle .backward-delete-word
}
zle -N backward-delete-to-slash

export PATH=/usr/local/bin:~/.bin:~/sys/bin:$PATH
export PYTHON=python2

relpwd() {
  ~/sys/bin/pathcrop "`echo -n $(pwd | sed \"s,$HOME,~,\")`"
}

. ~/.bash.private
. ~/.bash_aliases

export PYTHONPATH=~/.syspath:$PYTHONPATH
export MOZ_DISABLE_PANGO=1
export GREP_OPTIONS='--color=auto'

PROMPT='%F{yellow}%m $(relpwd)%f '
RPROMPT='%T %(?..:()'

j() {
  if [ -z "$1" ]; then
    source env/bin/activate
  else
    source $1/bin/activate
  fi
}
