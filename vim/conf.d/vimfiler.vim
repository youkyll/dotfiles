let g:vimfiler_as_default_explorer = 1
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
" space fでvimfilerをトグル
nnoremap <silent> <Space>f :<C-u>VimFilerCurrentDir -no-focus -split -simple -winwidth=25 -toggle -no-quit<CR>
