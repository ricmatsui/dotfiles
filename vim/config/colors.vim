colorscheme jellybeans

" Dark background
let g:jellybeans_overrides = {
      \    'background': { 'ctermbg': '000000', '256ctermbg': '000000' },
      \}
if has('termguicolors') && &termguicolors
  let g:jellybeans_overrides['background']['guibg'] = '000000'
endif
