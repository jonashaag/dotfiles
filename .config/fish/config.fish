test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

#PSQL_PAGER="pspg"

set --export FZF_DEFAULT_COMMAND 'rg --files --hidden --follow 2>/dev/null'
set --export FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set --export HOMEBREW_AUTO_UPDATE_SECS 4320

set --export RIPGREP_CONFIG_PATH ~/.config/ripgreprc

set --export EDITOR vim
