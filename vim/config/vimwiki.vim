let g:vimwiki_list = [
            \     {
            \         'path': '~/synced/Wiki',
            \         'syntax': 'markdown',
            \         'ext': '.md'
            \     }
            \ ]

let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_listsyms = ' .X'
let g:vimwiki_key_mappings = {
            \ 'headers': 0,
            \ }
"let g:vimwiki_folding = 'list'
hi! link VimwikiCheckBoxDone Title
nmap <Leader>ws <Plug>VimwikiSplitLink
nmap <Leader>wv <Plug>VimwikiVSplitLink
nmap <Leader>wt <Plug>VimwikiTabnewLink
nmap <Leader>p yyp<C-Space>

" Header motions: 'headers': 0 above disables the whole group because it also
" maps = and - in normal mode, so map just the jumps back per buffer.
augroup vimwiki_header_motions
    autocmd!
    autocmd FileType vimwiki nmap <buffer> ]] <Plug>VimwikiGoToNextHeader
    autocmd FileType vimwiki nmap <buffer> [[ <Plug>VimwikiGoToPrevHeader
    autocmd FileType vimwiki nmap <buffer> ]= <Plug>VimwikiGoToNextSiblingHeader
    autocmd FileType vimwiki nmap <buffer> [= <Plug>VimwikiGoToPrevSiblingHeader
augroup END
