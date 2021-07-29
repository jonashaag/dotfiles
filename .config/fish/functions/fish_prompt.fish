if test -e ~/.local/share/omf/themes/default/functions/fish_prompt.fish
  source ~/.local/share/omf/themes/default/functions/fish_prompt.fish

  functions -c fish_prompt __omf_prompt
  functions -e fish_prompt

  if type -q iterm2_prompt_mark
    function fish_prompt
      iterm2_prompt_mark
      __omf_prompt
    end
  end
end
