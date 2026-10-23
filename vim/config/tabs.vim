" New tab
nnoremap <M-t> :tabnew<CR>
" Switch tabs
nnoremap <M-S-[> :tabp<CR>
vnoremap <M-S-[> :tabp<CR>
inoremap <M-S-[> :tabp<CR>
nnoremap <M-S-]> :tabn<CR>
vnoremap <M-S-]> :tabn<CR>
inoremap <M-S-]> :tabn<CR>
" Move tabs
nnoremap gt <Cmd>execute '+' . v:count1 . 'tabmove' \| silent! call repeat#set('gt', v:count)<CR>
nnoremap gT <Cmd>execute '-' . v:count1 . 'tabmove' \| silent! call repeat#set('gT', v:count)<CR>
" Close current buffer/file
nnoremap <M-w> :q<CR>
inoremap <M-w> <C-o>:q<CR>
