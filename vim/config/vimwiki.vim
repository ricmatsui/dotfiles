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
