let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_options = [
            \ {
            \     'template': '~/synced/Wiki/template.tpl',
            \     'disable_front_matter': 1
            \ }
            \ ]
nmap <leader>zo :ZettelOpen<CR>
