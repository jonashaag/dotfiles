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

"map <F1> <ESC>
"imap <F1> <ESC>
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

inoremap <C-]> <ESC>:w<CR>
nnoremap <C-]> :w<CR>
let mapleader="\<Space>"
nmap <leader>q :q<CR>

map y  <Plug>(highlightedyank)

" Search
set incsearch
set hlsearch
map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
set statusline=%{anzu#search_status()}

function ToggleColorscheme()
  if get(g:, 'colors_name', '') != 'Focus (light)'
    colorscheme focus-light
  else
    colorscheme default
  endif
endfunction

nmap <C-F> :call ToggleColorscheme()<CR>

augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd,md,rst,txt call litecorrect#init()
augroup END

" Sideways
map <leader>h :SidewaysJumpLeft<CR>
map <leader>l :SidewaysJumpRight<CR>
map <leader>H :SidewaysLeft<CR>
map <leader>L :SidewaysRight<CR>

map <leader>wv <C-W>v<CR>
map <leader>ws <C-W>s<CR>
map <leader>wh <C-W>h<CR>
map <leader>wl <C-W>l<CR>

" Useless
map <S-k> <Nop>

set shell=fish
