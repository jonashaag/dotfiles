set --export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

#PSQL_PAGER="pspg"

set --export FZF_DEFAULT_COMMAND 'rg --files --hidden --follow 2>/dev/null'
set fzf_fd_opts --hidden --exclude=.git --follow
fzf_configure_bindings --git_log=\cl --directory=\cp --git_status=\cs

set --export HOMEBREW_AUTO_UPDATE_SECS 4320

set --export RIPGREP_CONFIG_PATH ~/.config/ripgreprc

set --export EDITOR vim

#function custom_key_binds
#    # https://github.com/fish-shell/fish-shell/pull/3068#issuecomment-259249785
#    fish_vi_key_bindings
#
#    bind -M insert \ca beginning-of-line
#    bind -M insert \ce end-of-line
#    bind -M insert \cf accept-autosuggestion
#end
#set -g fish_key_bindings custom_key_binds

set -gx VOLTA_HOME "$HOME/.volta"; set -gx PATH "$VOLTA_HOME/bin" $PATH

if test (hostname | sd .local '') = jh
  #eval (pdm --pep582 fish)
  #cached:
  set -x PYTHONPATH '/opt/homebrew/Cellar/pdm/1.5.1/libexec/lib/python3.9/site-packages/pdm/pep582' $PYTHONPATH

  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
  # <<< conda initialize <<<
end
