" ----------------------------
"       MAIN SETTINGS
" ----------------------------
" utf-8 default encoding
set enc=utf-8

" Syntax highlighting
syntax on

" Tab width and replace-tab
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent

" Line numbers
set number
" Ruler (x, y position display)
set ruler

" Enable filetype plugins and indention
filetype on
filetype plugin on

" Better Search
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Warn at line length > 79
highlight OverLength ctermbg=darkgrey
match OverLength /\%81v.*/



" ----------------------------
"       OTHER SETTINGS
" ----------------------------
" Paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Set backspace key behaviour
set backspace=indent,eol,start

" Deactivate vi compatibility mode
set nocompatible

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
set vb t_vb=

" Copy to Lodgeit on ^d
map <C-d> :Lodgeit<CR>



" ----------------------------
"       LANGUAGE SUPPORT
" ----------------------------
" Python!
autocmd FileType python setlocal
\   formatoptions+=croq " c+r+o+q
\   cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

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
