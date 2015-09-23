" Fix indentation:
inoremap # X#
autocmd FileType python setlocal   shiftwidth=2 tabstop=2 softtabstop=2 expandtab
\   formatoptions=tcrqn comments=:#\:,:#
"\   cinwords=if,elif,else,for,while,try,except,finally,def,class,with
"\   complete+=k~/.vim/syntax/python.vim isk+=".,("
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python let b:syntastic_checkers = ["python3", "pylint"]
let g:syntastic_python_pylint_args = "-E"
