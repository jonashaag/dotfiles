function j
  if test -z $argv[1]
    set argv[1] env
  end
  . {$argv[1]}/bin/activate.fish
end
