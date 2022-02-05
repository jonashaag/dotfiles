# iTerm integration
set --export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Basics
set --export EDITOR vim

# Abbreviations
abbr -a -U -- gbr 'git branch'
abbr -a -U -- gca 'git commit --amend'
abbr -a -U -- gcaa 'git commit --amend --all'
abbr -a -U -- gcl 'git clone'
abbr -a -U -- gco 'git checkout'
abbr -a -U -- gd 'git diff'
abbr -a -U -- gd2 'git diff HEAD'
abbr -a -U -- gds 'git diff --staged'
abbr -a -U -- gl 'git log'
abbr -a -U -- gp 'git pull --ff-only'
abbr -a -U -- gpick 'git cherry-pick'
abbr -a -U -- gprb 'git pull --rebase'
abbr -a -U -- grb 'git rebase'
abbr -a -U -- gs 'git status -s'

# Postgres
#PSQL_PAGER="pspg"

# FZF
set --export FZF_DEFAULT_COMMAND 'rg --files --hidden --follow 2>/dev/null'
set fzf_fd_opts --hidden --exclude=.git --follow
if type -q fzf_configure_bindings
  fzf_configure_bindings --git_log=\cl --directory=\cp --git_status=\cs
end

# Ripgrep
set --export RIPGREP_CONFIG_PATH ~/.config/ripgreprc

# Homebrew
set --export HOMEBREW_AUTO_UPDATE_SECS 4320

# Volta
set -gx VOLTA_HOME "$HOME/.volta"; set -gx PATH "$VOLTA_HOME/bin" $PATH

# Conda
if test -e ~/.conda-root
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    eval (/bin/cat ~/.conda-root)/bin/conda "shell.fish" "hook" $argv | source
    # <<< conda initialize <<<
end

# Direnv
direnv hook fish | source
