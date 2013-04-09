" Only .vimrc if not included anyway
if !exists('hello_vimrc')
  source .vimrc
endif

"set guifont=Inconsolata\ Medium\ 10
"set guifont=Monaco\ 10
"set guifont=Droid\ Sans\ \Mono\ 10
"set guifont=Panic\ Sans\ 10
"set guifont=Monaco\ for\ Powerline
set guifont=agave\ 12
"colorscheme github
colorscheme molokai
highlight ColorColumn guibg=#eee

set noerrorbells
set vb t_vb=
set guioptions-=m " hide menubar
set guioptions-=T " hide toolbar"
let &guicursor = &guicursor . ",a:blinkon0"
