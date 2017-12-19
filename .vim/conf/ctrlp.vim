set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'order:ttb'
if executable('rg')
  " Use Ag over Grep
  set grepprg=rg\ --color\ never

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg --files %s'
endif
