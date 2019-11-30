" Vundle
set nocompatible
filetype off

set expandtab
set tabstop=4
set shiftwidth=4

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'sjl/gundo.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'andrewradev/splitjoin.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'
Plugin '907th/vim-auto-save'
Plugin 'airblade/vim-gitgutter'
Plugin 'derekwyatt/vim-scala'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'matze/vim-move'
Plugin 'mbbill/code_complete'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/gdbmgr'
Plugin 'vim-scripts/restart.vim'
Plugin 'tpope/vim-surround'
Plugin 'AndrewRadev/switch.vim'
Plugin 'keith/swift.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'wellle/targets.vim'
Plugin 'ruanyl/vim-gh-line'
Plugin 'justinmk/vim-dirvish'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'yegappan/greplace'
Plugin 'yssl/QFEnter'
Plugin 'kshenoy/vim-signature'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-unimpaired'
Plugin 'zxqfl/tabnine-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'majutsushi/tagbar'
Plugin 'chrisbra/NrrwRgn'
Plugin 'tpope/vim-obsession'
Plugin 'wesQ3/vim-windowswap'
"Plugin 'tpope/vim-sleuth' - Performance issues
"Plugin 'Valloric/YouCompleteme' - TabNine compatibility issues
"Plugin 'ludovicchabant/vim-gutentags' - Generating tag files in non-project files
"Plugin 'craigemery/vim-autotag' - Generating tag files in non-project files
"Plugin 'galooshi/vim-import-js' - Need more config
"Plugin 'thaerkh/vim-workspace'
"Plugin 'terryma/vim-expand-region'
call vundle#end()
filetype plugin indent on

colorscheme jellybeans

set autoindent

autocmd BufRead,BufNewFile *.md setlocal spell

set linebreak
set shortmess+=I
set scrolloff=10

runtime macros/matchit.vim

" Use system clipboard - https://stackoverflow.com/a/39313208/2089625
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed " OSX
else
  set clipboard=unnamedplus " Linux
endif


" Mouse support
set mouse=a


" Relative line numbers
set rnu


" Use normal alerts rather than UI alerts for errors
set guioptions=
set guioptions+=c


" Set font on Mac
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  :set guifont=Meslo\ LG\ S\ DZ:h18
endif


" Set vim airline to clean dividers
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

" Disable unnecessary vim airline extensions
let g:airline#extensions#branch#enabled = 0

" Cleanup vim airline sections and layout
let g:airline_section_a = airline#section#create(['crypt', 'paste', 'iminsert'])
let g:airline_section_x = airline#section#create_right([])
let g:airline_section_y = airline#section#create_right([])

let g:airline_extensions = [
  \ 'ale',
  \ 'ctrlp',
  \ 'fugitiveline',
  \ 'hunks',
  \ 'nrrwrgn',
  \ 'obsession',
  \ 'quickfix',
  \ 'tabline',
  \ 'term',
  \ 'tagbar',
  \ 'whitespace',
  \ 'windowswap',
  \ ]

let g:airline#extensions#default#section_truncate_width = {}

" Use Airline tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#hunks#non_zero_only = 1

" Airline theme improvements
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'jellybeans'
    " Brighten file names
    for colors in values(a:palette.inactive)
      let colors[0] = '#ffffff'
    endfor
    for colors in values(a:palette.normal)
      let colors[0] = '#ffffff'
    endfor
  endif
endfunction

" Easy align text
" ga - Start Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" Configure Gundo
" \u - Open undo viewer
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_help = 0


" Configure Netrw
" - - Open Netrw
let g:netrw_bufsettings = 'noma nomod rnu nowrap ro nobl'
let g:netrw_localcopycmd = 'cp'


" Map Tab to switch buffers
" <Tab>  - Next buffer
" \<Tab> - Previous buffer
:nnoremap <Tab> :bnext<CR>
:nnoremap <leader><Tab> :bprevious<CR>


" Use Markdown table corners
let g:table_mode_corner="|"
let g:table_mode_motion_up_map='<leader>t{'
let g:table_mode_motion_down_map='<leader>t}'


" Configure pymode
let g:pymode_virtualenv = 1
let g:pymode_lint = 0


" Configure folding
" \f - Toggle fold at the current level
set foldmethod=indent
set foldlevelstart=99
nmap <leader>f za


" Use rg for grep
set grepprg=rg\ --vimgrep\ --fixed-strings


" _ - Swap between true and false, etc.
let g:switch_mapping = "_"


" Configure Ctrl-P use the repo as the root directory, and use
" Ag for searching. Show results at the top
" Ctrl-P - Open file finder
" Ctrl-U - Open MRU file finder
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = 'rg --files --color never --glob "" %s'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_lazy_update = 1
nn <silent> <c-u> :<c-u>CtrlPMRU<CR>


" Auto save when entering normal mode only
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0


" Ctrl-[HJKL] - Move to split in direction
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>


" Highlight current line, map toggle for current column highlight
" \cc - Toggle column highlight
:set cursorline
nmap <leader>cc :set cursorcolumn!<CR>


" Map F2 to run make
" F2 - make
map <F2> :! bash make <CR>


" Configure session autosave and load
:let g:session_autosave = 'yes'
:let g:session_autoload = 'yes'


" Show tabs
set listchars=tab:▸\ 
set list

" Map git shortcuts
" \gs  - git status
" \gd  - git diff
" \gc  - git commit
" \gp  - git push
" \gca  - git commit all
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gca :Gcommit -a<CR>

" Enable syntax highlighting when diffing
if &diff
  syntax on
endif

autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Map generate Doxygen stub
" \do - Generate doc stub
nmap <leader>do :Dox<CR>


" Map split buffer to side
" \A - Split buffer vertically and remain in current buffer
nmap <leader>A :vsp<CR><C-w>l:A<CR><C-w>h


" Map go to next error
" \[ - Go to next error
nmap <leader>[ :cnext<CR>


" Map go to next error
" \[ - Go to next error
nmap <leader>t :tab split<CR>


" Auto reload vimrc
autocmd! bufwritepost .vimrc source %


" Configure YouCompleteMe, and map go to definition
" \jd - Go to definition
syntax on
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>jd :YcmCompleter GoTo<CR>

let g:ycm_enable_diagnostic_highlighting = 0


" Bookmarks
highlight BookmarkLine term=reverse cterm=reverse gui=reverse
highlight BookmarkAnnotationLine term=reverse cterm=reverse gui=reverse
let g:bookmark_highlight_lines = 1


" Fast replace all occurrences of word under cursor
" \S - Start find and replace all
:nnoremap <Leader>S :%s/\<<C-r><C-w>\>/


" GitHub integration
let g:gh_line_map_default = 0
let g:gh_line_map = '<leader>o'


" Snippets
let @p = "Obinding.pry"
let @f = "O# frozen_string_literal: truej^i"
let @v = "o# vim: ts=4 sw=4 sts=4 sr et	\	"


" Git Gutter settings
set signcolumn=yes

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

highlight GitGutterAdd    guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
highlight GitGutterChange guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
highlight GitGutterDelete guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE


" Dirvish disable spell check
autocmd FileType dirvish setlocal nospell


" Use login profile for :terminal
"set shell=bash\ -l
"set shellcmdflag=-ic

nnoremap <leader>F :Ack<Space>
let g:ackprg = 'rg --vimgrep --fixed-strings'


let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_ruby_rubocop_executable = 'bundle'
nmap <leader>a <Plug>(ale_next_wrap)

let g:ycm_collect_identifiers_from_tags_files = 1

" Fix diff colors
hi DiffAdd    gui=NONE guifg=NONE    guibg=#182a09
hi DiffChange gui=NONE guifg=NONE    guibg=#0e1d25
hi DiffDelete gui=NONE guifg=#330004 guibg=#330004
hi DiffText   gui=NONE guifg=NONE    guibg=#1c3a4a

" Disable man map
:map K <Nop>

" Always show status line
set laststatus=2

" Drag visual blocks
vmap <expr> <S-h> DVB_Drag('left')
vmap <expr> <S-l> DVB_Drag('right')
vmap <expr> <S-j> DVB_Drag('down')
vmap <expr> <S-k> DVB_Drag('up')

" Completion menu
set completeopt=menuone

" Disable workspace autosave
let g:workspace_autosave = 0

" Tests
set path=.,src,node_nodules
set suffixesadd=.js,.jsx

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" Tagbar
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['+', '-']

" Disable bell
set visualbell t_vb=
