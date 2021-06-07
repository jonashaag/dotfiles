set --export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set --export PGDATA /usr/local/var/postgres/10.0
set --export POSTGRES_LOG $PGDATA/postgres.log

alias pg-start="pg_ctl start --log $POSTGRES_LOG"
alias pg-status="pg_ctl status"
alias pg-stop="pg_ctl stop"

set --export FZF_DEFAULT_COMMAND 'rg --files --hidden --follow 2>/dev/null'
set --export FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set --export HOMEBREW_AUTO_UPDATE_SECS 4320

set --export RIPGREP_CONFIG_PATH ~/.config/ripgreprc

#function custom_key_binds
#    # https://github.com/fish-shell/fish-shell/pull/3068#issuecomment-259249785
#    fish_vi_key_bindings
#
#    bind -M insert \ca beginning-of-line
#    bind -M insert \ce end-of-line
#    bind -M insert \cf accept-autosuggestion
#end
#set -g fish_key_bindings custom_key_binds

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

#eval (pdm --pep582 fish)
#cached:
set -x PYTHONPATH '/opt/homebrew/Cellar/pdm/1.5.1/libexec/lib/python3.9/site-packages/pdm/pep582' $PYTHONPATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

