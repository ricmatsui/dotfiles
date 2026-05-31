" Configure Ctrl-P use the repo as the root directory, and use
" rg for searching.
" Ctrl-P - Open file finder
" Ctrl-U - Open MRU file finder
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = 'rg --files --color never --glob "" %s'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_lazy_update = 1
nn <silent> <c-u> :<c-u>CtrlPMRU<CR>
