" ----------------------------
"       MAIN SETTINGS
" ----------------------------
" Deactivate vi compatibility mode
set nocompatible

" utf-8 default encoding
set enc=utf-8

" Syntax highlighting
syntax on

" Tab width and replace-tab
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cindent

" Line numbers
set number

" No line wrapping
set nowrap

" Ruler (x, y position display)
set ruler

" Enable filetype plugins and indention
filetype on
filetype plugin on
filetype indent on

" Better Search
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Warn at line length > 79
highlight OverLength ctermbg=255
match OverLength /\%81v.*/

set t_Co=256


" ----------------------------
"       OTHER SETTINGS
" ----------------------------
" Paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Set backspace key behaviour
set backspace=indent,eol,start

" Activate syntax syncing from start
autocmd BufEnter * :syntax sync fromstart

" Set backup/session dir
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Remember cursor position after reload
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class
set wildmode=list:full

" go with smartindent if there is no plugin indent file.
" but don't outdent hashes
inoremap # X#

" don't bell or blink
set noerrorbells


" ----------------------------
"       LANGUAGE SUPPORT
" ----------------------------
" Python!
autocmd FileType python setlocal
\   formatoptions+=croq " c+r+o+q
\   cinwords=if,elif,else,for,while,try,except,finally,def,class,with
\   complete+=k~/.vim/syntax/python.vim isk+=.,(
\   map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
let python_highlight_all = 1

autocmd FileType make setlocal shiftwidth=8 tabstop=8 softtabstop=8 noexpandtab

" Java
autocmd FileType java setlocal shiftwidth=2 tabstop=2 softtabstop=2

" ReST
autocmd FileType rst setlocal shiftwidth=3 tabstop=3 softtabstop=3

" Ruby
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

" HTML/XML/...
fun! s:SelectHTML()
let n = 1
while n < 50 && n < line("$")
  " check for jinja
  if getline(n) =~ '{%\s*\(extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
    set ft=htmljinja
    return
  endif
  " check for django
  if getline(n) =~ '{%\s*\(extends\|block\|comment\|ssi\|if\|for\|blocktrans\)\>'
    set ft=htmldjango
    return
  endif
  " check for mako
    if getline(n) =~ '<%\(def\|inherit\)'
      set ft=mako
      return
    endif
    " check for genshi
    if getline(n) =~ 'xmlns:py\|py:\(match\|for\|if\|def\|strip\|xmlns\)'
      set ft=genshi
      return
    endif
    let n = n + 1
  endwhile
  " go with html
  set ft=html
endfun

autocmd BufNewFile,BufRead *.html,*.htm  call s:SelectHTML()
let html_no_rendering=1 " disable wysiwyg rendering

let g:closetag_default_xml=1
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim


" ----------------------
"       Easy vim
" ----------------------
" Adds some well-known shortcuts to vim. Part-wise based on mswin by
" Bram Moolenaar <Bram@vim.org>

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Use CTRL-W for saving, also in Insert mode
"noremap <C-W>		:w<CR>
"vnoremap <C-W>		<C-C>:w<CR>
"inoremap <C-W>		<C-O>:w<CR>

" CTRL-D for dd
noremap <C-D>       dd
inoremap <C-D>      <C-C>ddi
" jump back to insert mode

" CTRL-F for 'delete everything before the cursor in current line
" and append everything after the cursor to the end of previous line

" CTRL-Z in insert mode for undo
inoremap <C-Z> <C-O>u

" CTRL-Y in insert mode for redo
inoremap <C-Y> <C-O><C-R>
