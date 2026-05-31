" Grep with Ack and rg
nnoremap <leader>F :Ack<Space>
let g:ackprg = 'rg --vimgrep --fixed-strings'
set grepprg=rg\ --vimgrep\ --fixed-strings
