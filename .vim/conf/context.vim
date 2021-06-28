let g:context_add_mappings = 0
nnoremap <silent> <expr> <C-Y> context#util#map('<C-Y>')
" nnoremap <silent> <expr> <C-E> context#util#map('<C-E>')
nnoremap <silent> <expr> zz    context#util#map('zz')
nnoremap <silent> <expr> zb    context#util#map('zb')
nnoremap <silent> <expr> zt    context#util#map_zt()
nnoremap <silent> <expr> H     context#util#map_H()
