function git-fzf-ref -a ref
  set -q ref[1]; or set ref ''
  git rev-parse --is-inside-work-tree >/dev/null ^/dev/null; or begin echo "Not a Git repo"; return 1; end
  set tags (git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}')
  set branches (git branch --all --sort=-committerdate | grep -v HEAD | sed "s/.* //" | sed "s#remotes/[^/]*/##" | awk '!x[$0]++' | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}'); or return
  string join \n $branches $tags | fzf --ansi -d \t -n 2 --query=$ref --select-1 --height 50% --layout=reverse --preview 'git show --stat --color=always {2} --' | awk '{print $2}'
  commandline -f repaint
end
