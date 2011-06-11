" Only .vimrc if not included anyway
if !exists('hello_vimrc')
  source .vimrc
endif

"set guifont=Inconsolata\ Medium\ 10
"set guifont=Monaco\ 10
"set guifont=Droid\ Sans\ \Mono\ 10
set guifont=Panic\ Sans\ 10
colorscheme github
set noerrorbells
set vb t_vb=
set guioptions-=m " hide menubar
set guioptions-=T " hide toolbar"
highlight ColorColumn guibg=#eee
