nnoremap , :
vnoremap , :
xnoremap , :
"nnoremap : ,
"vnoremap : ,
"xnoremap : ,

set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*.class,Desktop/,*.hi
set wildmode=list:full

set nocompatible
set noerrorbells
set nowrap
set showcmd

"map <F1> <ESC>
"imap <F1> <ESC>

" Tab width and replace-tab
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

set list
set listchars=tab:.\ 

" (de)indent
nmap > >>
nmap < <<
vnoremap > >gv
vnoremap < <gv

" use H/L instead of ^/$
nnoremap H ^
nnoremap L g_

" Only scroll a half page on PageDown and PageUp
map <PageDown> <C-D>
map <PageUp>   <C-U>

" switch tabs with Ctrl-{j,k}
inoremap <C-K>  <C-PageDown>
inoremap <C-J>  <C-PageUp>
noremap <C-J>   gT:redraw<BAR>file<CR>
noremap <C-K>   gt:redraw<BAR>file<CR>

" switch windows with Ctrl-{h,l}
map <C-H> <C-w>h
map <C-L> <C-w>l

" Better Search
set ignorecase
set smartcase

" Always keep cursor vertically centered
set scrolloff=99999

" Increase macro performance
set lazyredraw

set showmatch

" move vertically by visual line
nnoremap j gj
nnoremap k gk

let mapleader="\<Space>"
nmap <leader>q :q<CR>
nmap <leader>w :wq<CR>

inoremap <C-E> <ESC>:w<CR>
nnoremap <C-E> :w<CR>

" Search
set hlsearch
"nmap <Esc><Esc> :nohlsearch<CR>

" Useless
map <S-k> <Nop>

set undofile
set undodir=~/.vim/undod

let g:polyglot_disabled = ['jsx']

set nofoldenable
