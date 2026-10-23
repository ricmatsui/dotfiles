" Configure folding
" \f - Toggle fold at the current level
set foldmethod=expr
if has('nvim')
    set foldexpr=v:lua.vim.treesitter.foldexpr()
endif
set nofoldenable
set foldlevelstart=99
nmap <leader>f za
