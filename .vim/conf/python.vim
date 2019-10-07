" Fix indentation:
"inoremap # X#
"autocmd FileType python setlocal   shiftwidth=4 tabstop=4 softtabstop=4 expandtab formatoptions=tcrqn comments=:#\:,:# completeopt-=preview
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
let g:ale_linters = {'python': ['flake8', 'mypy']}
let g:ale_python_flake8_options='--ignore=E'
let g:ale_python_mypy_options='--ignore-missing-imports'
