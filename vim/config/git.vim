" Map git shortcuts
" \gs  - git status
" \gd  - git diff
" \gc  - git commit
" \gp  - git push
" \gca  - git commit all
nmap <leader>gs :topleft vertical Git<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gca :Gcommit -a<CR>

" Enable syntax highlighting when diffing
if &diff
  syntax on
endif

autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Fix diff colors
hi DiffAdd    gui=NONE guifg=NONE    guibg=#182a09
hi DiffChange gui=NONE guifg=NONE    guibg=#0e1d25
hi DiffDelete gui=NONE guifg=#330004 guibg=#330004
hi DiffText   gui=NONE guifg=NONE    guibg=#1c3a4a

