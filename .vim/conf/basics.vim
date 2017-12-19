syntax on
filetype plugin indent on

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*.class,Desktop/,*.hi
set wildmode=list:full

set tabpagemax=999999999
set nocompatible
set noerrorbells
set nowrap
set ruler

map <F1> <ESC>
imap <F1> <ESC>
set backspace=indent,eol,start

" Tab width and replace-tab
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab

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
noremap <C-K>   <C-PageDown>
inoremap <C-K>  <C-PageDown>
noremap <C-J>   <C-PageUp>
inoremap <C-J>  <C-PageUp>

" switch windows with Ctrl-{h,l}
map <C-h> <C-w>h
map <C-l> <C-w>l

" Better Search
set ignorecase
set smartcase

" Remember cursor position after reload
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Always keep cursor vertically centered
set scrolloff=99999

" Increase macro performance
set lazyredraw

set showmatch

" move vertically by visual line
nnoremap j gj
nnoremap k gk

inoremap jk <ESC>
vnoremap ;; :w<CR>
nnoremap ;; :w<CR>
inoremap ;; <ESC>:w<CR>

map y  <Plug>(highlightedyank)

" Search
set incsearch
set hlsearch
map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
set statusline=%{anzu#search_status()}
