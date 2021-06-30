source ~/.local/share/omf/themes/default/functions/fish_prompt.fish

functions -c fish_prompt __omf_prompt 
functions -e fish_prompt

function fish_prompt
  iterm2_prompt_mark
  __omf_prompt
end
