test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
source ~/.asdf/asdf.fish

set --export PGDATA /usr/local/var/postgres/10.0
set --export POSTGRES_LOG $PGDATA/postgres.log

alias pg-start="pg_ctl start --log $POSTGRES_LOG"
alias pg-status="pg_ctl status"
alias pg-stop="pg_ctl stop"

set --export FZF_DEFAULT_COMMAND 'rg --files --hidden --follow 2>/dev/null'
set --export FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set --export HOMEBREW_AUTO_UPDATE_SECS 4320

source /Users/j/Library/Preferences/org.dystroy.broot/launcher/fish/br
