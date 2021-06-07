function pac -a pkg
  set out (pamac search -aq $pkg | fzf --multi --preview 'pamac info -a {1}' --query $pkg --select-1); or return
  pacman -Ss $out >/dev/null 2>/dev/null
  and pamac install $out
  or pamac build $out
end
