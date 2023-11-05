abbr -a gp   'git pull --ff-only'
abbr -a gpr  'git pull --rebase'
abbr -a grc  'git rebase --continue'
abbr -a gs   'git status -s'
abbr -a gcl  'git clone'
abbr -a gco  'git checkout'
abbr -a gl   'git log'
abbr -a gca  'git commit --amend'
abbr -a gcaa 'git commit -a --amend'
abbr -a gcp  'git cherry-pick'
abbr -a gr   'git pull --rebase'
abbr -a gpi  'git cherry-pick'
abbr -a gwip 'git commit -a --amend --no-edit && git push -f'

abbr -a m  'micromamba'
abbr -a me 'micromamba -p ./.env'


abbr -a p 'pixi'
abbr -a pr 'pixi run'

abbr -a c 'cat'

abbr -a ghu --position anywhere --set-cursor 'https://github.com/%'
abbr -a ghj --position anywhere --set-cursor 'https://github.com/jonashaag/%'

set --export EDITOR nvim

set --export RIPGREP_CONFIG_PATH ~/.config/ripgreprc

set --export PRE_COMMIT_USE_MICROMAMBA yep

fish_add_path -g /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/curl/bin
fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/.bin
fish_add_path -g ~/.local/bin
fish_add_path -g ~/.pixi/bin

set --export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish ; or true

zoxide init fish | source

set -U tide_transient_enabled true
set -U tide_right_prompt_items status cmd_duration context jobs direnv node virtual_env rustc java php pulumi chruby go kubectl distrobox toolbox terraform aws nix_shell crystal elixir

if test -e ~/.config/secrets.fish
  source ~/.config/secrets.fish
end
