execute pathogen#infect()

set runtimepath^=~/.vim/bundle/ctrlp.vim
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -U -l --nocolor -g ""'
endif

syntax on
set noerrorbells

map <F1> <ESC>
imap <F1> <ESC>

" Tab width and replace-tab
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab

set autochdir

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

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*.class,Desktop/*,*.hi
set wildmode=list:full

" Enable filetype plugins and indention
filetype plugin indent on


" ----- Language specifics -----

" --- Python ---
" Fix indentation:
inoremap # X#
autocmd FileType python setlocal   shiftwidth=2 tabstop=2 softtabstop=2
\   formatoptions=tcrqn comments=:#\:,:#
"\   cinwords=if,elif,else,for,while,try,except,finally,def,class,with
"\   complete+=k~/.vim/syntax/python.vim isk+=".,("
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python let b:syntastic_checkers = ["python3", "pylint"]
let g:syntastic_python_pylint_args = "-E"
