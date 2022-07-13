let g:netrw_liststyle = 3
let g:netrw_winsize = 25

augroup ProjectDrawer
  autocmd!
  "autocmd TabEnter * call TabNetrwEnter()
augroup END

function! TabNetrwEnter()
  if exists('t:_netrw_show') && t:_netrw_show
    return
  endif
  let t:_netrw_show = 1
  :Lexplore
  wincmd l
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  " nunmap <buffer> <silent> <nowait> <C-L>
  " nmap <buffer> <silent> <nowait> <C-R> @<Plug>NetrwRefresh
  " :NumbersDisable
endfunction

" close if final buffer is netrw or the quickfix
augroup finalcountdown
 au!
 autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
 "autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) || &buftype == 'quickfix' | q | endif
 nmap - :Lexplore<cr>
 "nmap - :NERDTreeToggle<cr>
augroup END
