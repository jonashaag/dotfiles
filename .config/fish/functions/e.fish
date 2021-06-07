function e
  if test (count $argv) -gt 0
    if test -e ~/.venvs/{$argv[1]}
      source ~/.venvs/{$argv[1]}/bin/activate.fish
    else
      source {$argv[1]}/bin/activate.fish
    end
  else if test -e env
    source env/bin/activate.fish
  else if test -e env3
    source env3/bin/activate.fish
  else if test -e env2
    source env2/bin/activate.fish
  else if test -e venv
    source venv/bin/activate.fish
  else
    echo "Error: No virtualenv found"
    return
  end
end
