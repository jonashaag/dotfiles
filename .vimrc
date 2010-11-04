" vim:shiftwidth=2
let hello_vimrc=1

syntax on
set autochdir
set noerrorbells
set t_Co=256
set enc=utf-8
set mouse=a
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

set statusline=%f\ %h%m%r%w%{_filetype()}%*%=\ pos:\ %l\/%L,%c%<\ \|\ asc\ %b/0x%B\ \|\ %P
set laststatus=2

" Tab width and replace-tab
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cindent
set copyindent

" Scroll a half page on PageDown and PageUp
map <PageDown> <C-D>
map <PageUp>   <C-U>

" switch tabs with Ctrl-{j,k}
noremap <C-K>   <C-PageDown>
inoremap <C-K>  <C-PageDown>
noremap <C-J>   <C-PageUp>
inoremap <C-J>  <C-PageUp>

" switch to tab N with Alt-N
noremap <A-1>   1gt
inoremap <A-1>  1gt
noremap <A-2>   2gt
inoremap <A-2>  2gt
noremap <A-3>   3gt
inoremap <A-3>  3gt
noremap <A-4>   4gt
inoremap <A-4>  4gt
noremap <A-5>   5gt
inoremap <A-5>  5gt
noremap <A-6>   6gt
inoremap <A-6>  6gt
noremap <A-7>   7gt
inoremap <A-7>  7gt
noremap <A-8>   8gt
inoremap <A-8>  8gt
noremap <A-9>   9gt
inoremap <A-9>  9gt

" switch windows with Ctrl-{h,l}
map <C-h> <C-w>h
map <C-l> <C-w>l

" Better Search
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Warn at line length > 79
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%>80v.\+/

" Highlight column 81
set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey

" Set backup/session dir
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Remember cursor position after reload
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Activate syntax syncing from start
autocmd BufEnter * :syntax sync fromstart

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class
set wildmode=list:full

" Enable filetype plugins and indention
filetype on
filetype plugin on
filetype indent on

" go with smartindent if there is no plugin indent file.
" but don't outdent hashes
inoremap # X#

" Python!
autocmd FileType python setlocal
\   formatoptions+=croq " c+r+o+q
\   cinwords=if,elif,else,for,while,try,except,finally,def,class,with
\   complete+=k~/.vim/syntax/python.vim isk+=.,(
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
