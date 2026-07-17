set nocompatible
filetype off
syntax on

set expandtab
set tabstop=4
set shiftwidth=4
set virtualedit=onemore
set noincsearch
set hlsearch
set signcolumn=yes
set cursorline

" Use interactive shell to load profile
set shell=/bin/zsh\ -i

" Streamlit and React Native incompatibility
set noswapfile

" Do not auto-resize windows
" Fix window size with :set wfw or wfh
set noequalalways

" Disable Macvim touchbar fullscreen button
let g:macvim_default_touchbar_fullscreen=0

set autoindent

" Custom spell file
set spellfile=~/synced/Projects/vim/spell/en.utf-8.add

nnoremap <leader>t 1z=

autocmd BufRead,BufNewFile *.md setlocal spell

" Disable spell check dirvish and quickfix
autocmd FileType dirvish setlocal nospell
autocmd FileType qf setlocal nospell


set linebreak
set shortmess+=I
set scrolloff=10

" Use system clipboard - https://stackoverflow.com/a/39313208/2089625
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed " OSX
else
  set clipboard=unnamedplus " Linux
endif

" Mouse support
set mouse=a

" Hybrid line numbers
set number relativenumber

" Use normal alerts rather than UI alerts for errors
"set guioptions=
"set guioptions+=c

runtime macros/matchit.vim

" Ctrl-[HJKL] - Move to split in direction
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

" Skip adding paragraph motions to the jumplist
nnoremap <silent> { :keepjumps normal! {<CR>
nnoremap <silent> } :keepjumps normal! }<CR>

" Highlight current line, map toggle for current column highlight
" \ch - Toggle column highlight
nnoremap <leader>ch :set cursorcolumn!<CR>


" Show tabs
set listchars=tab:▸\ 
set list

" Map split buffer to side
" \A - Split buffer vertically and remain in current buffer
nmap <leader>A :vsp<CR><C-w>l:A<CR><C-w>h

" Fast replace all occurrences of word under cursor
" \S - Start find and replace all
:nnoremap <Leader>S :%s/\<<C-r><C-w>\>/

" Disable man map
:map K <Nop>

" Always show status line
set laststatus=2

" Completion menu
set completeopt=menuone,noinsert,noselect
set pumheight=10

" Tests
set path=.,src,node_nodules
set suffixesadd=.js,.jsx

" Disable bell
set visualbell t_vb=

" Format JSON command
command! FormatJSON %!jq .
