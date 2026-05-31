" Define make programs
autocmd FileType javascript setlocal makeprg=yarn\ run\ lint
autocmd FileType typescript setlocal makeprg=yarn\ run\ lint
autocmd FileType typescriptreact setlocal makeprg=yarn\ run\ lint
autocmd FileType rust setlocal makeprg=NO_COLOR=1\ cargo\ run

" Error formats
set errorformat+=%f\\(%l\\,%c\\):\ %trror\ %m                  " TSC error
set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m   " ESLint error
set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m " ESLint warning

" Async make command
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

nnoremap <F5> :Make<CR>

" Async Run - automatically open quickfix with 8 lines visible
let g:asyncrun_open = 8

