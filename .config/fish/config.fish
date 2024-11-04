set --export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES

abbr -a gp   'git smart-pull'
abbr -a gpu  'git smart-push'
abbr -a grc  'git rebase --continue'
abbr -a gs   'git status -s'
abbr -a gcl  'git clone'
abbr -a gco  'git checkout'
abbr -a gl   'git log'
abbr -a gca  'git commit --amend'
abbr -a gcaa 'git commit -a --amend'
abbr -a gpi  'git cherry-pick'
abbr -a gwip 'git commit -a --amend --no-edit && git push -f'

abbr -a p 'pixi'
abbr -a r 'pixi run'
abbr -a ri 'pixi run ipython'
abbr -a pr 'pixi run'
abbr -a pa 'pixi add'
abbr -a pl 'pixi list'
abbr -a pt 'pixi task'

abbr -a c 'cat'

abbr -a ghu --position anywhere --set-cursor 'https://github.com/%'
abbr -a ghj --position anywhere --set-cursor 'https://github.com/jonashaag/%'

set --export EDITOR nvim

set --export RIPGREP_CONFIG_PATH ~/.config/ripgreprc

set --export PRE_COMMIT_USE_MICROMAMBA yep

# TOOD: blocks selection
# set --export LESS --mouse

fish_add_path -g /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/curl/bin
fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/.bin
fish_add_path -g ~/.local/bin
fish_add_path -g ~/.pixi/bin
fish_add_path -g ~/p/dotfiles/bin
fish_add_path -g ~/p/git-smart-pull
fish_add_path -g ~/Library/Application\ Support/JetBrains/Toolbox/scripts

zoxide init fish | source

# Default values: https://github.com/IlanCosman/tide/blob/main/functions/tide/configure/configs/lean.fish
set tide_prompt_transient_enabled true
set tide_right_prompt_items status cmd_duration context jobs toolbox

set FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --ignore-file ~/.ignore"
set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

if test -e ~/.config/secrets.fish
  source ~/.config/secrets.fish
end

defaults write com.apple.dock size-immutable -bool yes
ulimit -n 4096
