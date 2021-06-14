function fish_user_key_bindings
  bind \cb git-fzf-ref
  bind -M insert \cb git-fzf-ref
  bind --erase \cf
  bind \ct __fzf_search_current_dir
end
