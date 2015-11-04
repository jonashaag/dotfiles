set shell=bash

syntax on
filetype plugin indent on

map <F1> <ESC>
imap <F1> <ESC>

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*.class,Desktop/,*.hi
set wildmode=list:full

source $HOME/.vim/conf/basics.vim

source $HOME/.vim/conf/ack.vim
source $HOME/.vim/conf/ctrlp.vim
source $HOME/.vim/conf/ctags.vim
source $HOME/.vim/conf/sparkup.vim

source $HOME/.vim/conf/c.vim
source $HOME/.vim/conf/python.vim
source $HOME/.vim/conf/html.vim

execute pathogen#infect()
