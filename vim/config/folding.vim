" Configure folding
" \f - Toggle fold at the current level
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set foldlevelstart=99
nmap <leader>f za
