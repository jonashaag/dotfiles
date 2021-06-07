function jj
  set n (jobs | sort -n | fzf --layout default --border --height 5 -n 2)
  and fg (echo $n | awk '{print $2}')
end
