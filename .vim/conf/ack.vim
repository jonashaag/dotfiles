if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
