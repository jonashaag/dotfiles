" vim:shiftwidth=2
filetype off " Vundle hack
let hello_vimrc=1 " gvimrc hack

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Syntastic'
Bundle 'TaskList.vim'
"Bundle 'AutoComplPop'
Bundle 'neocomplcache'
"Bundle 'HTML-AutoCloseTag'
Bundle 'Gundo'
Bundle 'https://github.com/kana/vim-gf-user.git'
Bundle 'https://github.com/kana/vim-gf-diff.git'
Bundle 'html5.vim'
Bundle 'JavaScript-Indent'
Bundle 'Jinja'
Bundle 'lodgeit.vim'
Bundle 'svn-diff.vim'
Bundle 'taglist.vim'
Bundle 'VimClojure'
Bundle 'paredit.vim'
Bundle 'https://github.com/tomtom/shymenu_vim.git'
Bundle 'https://github.com/Lokaltog/vim-powerline'
Bundle 'https://github.com/tek/vim-conque'

source ~/.vim/neocomplcache.vim

set nofsync swapsync=

syntax on
set autochdir
set noerrorbells
set t_Co=256
set enc=utf-8
"set mouse=a
set mouse=n
set modeline
set title
set scrolloff=99999
"set cmdheight=2
set number
set nowrap

fu! _filetype()
  if &ft != 'python'
    if &ft == ''
      return ''
    else
      return '[' . &ft . ']'
    endif
  elseif exists("w:PHStatusLine")
    return '  ' . w:PHStatusLine
  else
    return ''
  endif
endfunction

" XXX was %*%= (right align) doesn't work anymore?!
"set statusline=%f\ %h%m%r%w%{_filetype()}%*\ pos:\ %l\/%L,%c%<\ \|\ asc\ %b/0x%B\ \|\ %P
let g:Powerline_symbols = 'fancy'
set laststatus=2

" Tab width and replace-tab
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set cindent
set copyindent

nnoremap <F5> :GundoToggle<CR>
map <F4> <ESC>:vs<CR><ESC> :execute "lvimgrep /" . expand("<cword>") . "./**"<CR><ESC>:lw<CR>

" Force unindent
imap <C-Backspace> <ESC>0i
nmap <C-Return> o<C-Backspace>

" move by screen line instead of actual line
nnoremap j gj
nnoremap k gk

" Redo with U & undo with u
nnoremap U <C-R>

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

" clear search highlights
noremap <silent> <ESC><ESC> :nohls<CR>

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<CR><ESC>^mzgk:silent! s/\v +$//<CR>:nohls<CR>`w

" (de)indent
nmap > >>
nmap < <<
vnoremap > >gv
vnoremap < <gv

" move lines up/down (doen't shadow ⌃N, ⌃P in {insert} mode (autocompletion)
nnoremap <C-n> mz:m+<CR>`z==
nnoremap <C-p> mz:m-2<CR>`z==
vnoremap <C-n> :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap <C-p> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" I hate accidentally hitting F1 when trying to press ESC.
map <F1> <ESC>

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
set hlsearch
set incsearch
set ignorecase
set smartcase

" Warn at line length > 80

" Highlight column 81
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=darkgrey
else
  highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
  match OverLength /\%>80v.\+/
endif

" Set backup/session dir
"set backupdir=~/.vim/sessions
"set dir=~/.vim/sessions
set backupdir=/tmp
set dir=/tmp

" Remember cursor position after reload
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

nmap <C-t> :TlistToggle<CR>
set updatetime=10
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_SingleClick=1

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*.class
set wildmode=list:full

" go with smartindent if there is no plugin indent file.
" but don't outdent hashes
inoremap # X#

" Activate syntax syncing from start
autocmd BufEnter * :syntax sync fromstart

" Enable filetype plugins and indention
filetype plugin indent on

" Python!
autocmd FileType python setlocal   shiftwidth=4 tabstop=4 softtabstop=4
\   formatoptions+=croq " c+r+o+q
\   cinwords=if,elif,else,for,while,try,except,finally,def,class,with
\   complete+=k~/.vim/syntax/python.vim isk+=".,("
let python_highlight_all = 1

" Scheme
autocmd FileType scheme setlocal lisp nocindent

" Clojure
let g:vimclojure#ParenRainbow = 1
let g:vimclojure#DynamicHighlighting = 1

" Javascript
"autocmd FileType javascript setlocal nocindent autoindent

" Makefiles
autocmd FileType make setlocal shiftwidth=8 tabstop=8 softtabstop=8 noexpandtab

" ReST
autocmd FileType rst setlocal shiftwidth=3 tabstop=3 softtabstop=3

" Mails
autocmd FileType mail setlocal wrap

" OOC
autocmd BufNewFile,BufRead *.ooc set filetype=ooc

" XML, HTML, Django/Jinja
autocmd BufNewFile,BufRead *.html,*.htm set filetype=htmljinja indentexpr=
let html_no_rendering=1 " disable wysiwyg rendering

" CleverCSS
autocmd BufNewFile,BufRead *.ccss set filetype=clevercss

" Java
let Checkstyle_Classpath = '/jonas/uni/swt/checkstyle/checkstyle-5.5.jar'
let Checkstyle_XML = '/jonas/uni/swt/checkstyle_swt1.xml'

" Opa
autocmd BufNewFile,BufRead *.opa set filetype=opa
