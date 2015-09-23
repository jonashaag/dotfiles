set noerrorbells
set nowrap
set ruler

" Tab width and replace-tab
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab

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
