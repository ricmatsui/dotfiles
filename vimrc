set nocompatible
filetype off

set expandtab
set tabstop=4
set shiftwidth=4

" Do not auto-resize windows
set noequalalways

" Disable Macvim touchbar fullscreen button
let g:macvim_default_touchbar_fullscreen=0

" Polyglot - Settings before loading plugin
let g:polyglot_disabled = ['typescript.plugin'] " Disable due to error format override

" Vim-Plug
call plug#begin()
Plug 'sjl/gundo.vim'                   " Undo tree visualizer
Plug 'Shougo/vimproc.vim'              " Asynchronous execution library
Plug 'andrewradev/splitjoin.vim'       " Switch between a single-line statement and a multi-line one
Plug 'terryma/vim-multiple-cursors'    " Multiple selection
Plug 'junegunn/vim-easy-align'         " Alignment plugin
Plug '907th/vim-auto-save'             " Automatically saves changes
Plug 'airblade/vim-gitgutter'          " Git diff in the sign column
Plug 'dhruvasagar/vim-table-mode'      " Table creator & formatter
Plug 'jlanzarotta/bufexplorer'         " Switch between buffers
Plug 'ctrlpvim/ctrlp.vim'              " Full path fuzzy file, buffer, mru, tag finder
Plug 'matze/vim-move'                  " Moves lines and selections
Plug 'nanotech/jellybeans.vim'         " A colorful, dark color scheme
Plug 'vim-airline/vim-airline'         " Status/tabline
Plug 'vim-airline/vim-airline-themes'  " Theme repository for vim-airline
Plug 'scrooloose/nerdcommenter'        " Comment functions
Plug 'tpope/vim-fugitive'              " Plugin for Git
Plug 'vim-scripts/DoxygenToolkit.vim'  " Doxygen comments generator
Plug 'vim-scripts/a.vim'               " Switch between source and header files
Plug 'vim-scripts/gdbmgr'              " Window interface to gdb
Plug 'vim-scripts/restart.vim'         " Restart with command
Plug 'tpope/vim-surround'              " Mappings to modify parantheses, brackets, quotes in pairs
Plug 'AndrewRadev/switch.vim'          " Flip values or alternative syntax
Plug 'wellle/targets.vim'              " Adds various text objects: pair, quote, separator, argument, tag
Plug 'ruanyl/vim-gh-line'              " Opens a link to the current line on GitHub
Plug 'justinmk/vim-dirvish'            " Path navigator
Plug 'mileszs/ack.vim'                 " Run search tool with results list
Plug 'w0rp/ale'                        " Asynchronous Lint Engine
Plug 'ntpeters/vim-better-whitespace'  " Highlight trailing whitespace characters
Plug 'yegappan/greplace'               " Search and replace a pattern across multiple files
Plug 'yssl/QFEnter'                    " Open items from quickfix or location list
Plug 'kshenoy/vim-signature'           " Place, toggle and display marks
Plug 'tpope/vim-speeddating'           " Increment and decrement datetime formats
Plug 'tpope/vim-unimpaired'            " Pair mappings for next, previous, lines, encoding
Plug 'editorconfig/editorconfig-vim'   " Config support for EditorConfig
Plug 'chrisbra/NrrwRgn'                " Focus on a selected region while making the rest inaccessible
Plug 'tpope/vim-obsession'             " Automatically save sessions
Plug 'wesQ3/vim-windowswap'            " Swap windows
Plug 'sheerun/vim-polyglot'            " A collection of language packs
Plug 'AndrewRadev/sideways.vim'        " Move the item under the cursor left or right
Plug 'fisadev/vim-ctrlp-cmdpalette'    " Find and run vim commands
Plug 'nathanaelkane/vim-indent-guides' " Displaying indent levels
Plug 'christoomey/vim-titlecase'       " Operator for titlecasing
Plug 'Kuniwak/vim-qrcode'              " Display a QR code
Plug 'itkq/fluentd-vim'                " Fluentd syntax
"Plug 'psliwka/vim-smoothie'            " Smooth scrolling
"Plug 'rbong/vim-flog'                  " Git branch viewer
Plug 'chamindra/marvim'                " Macro Repository
Plug 'yegappan/taglist'                " Source Code Browser
Plug 'sk1418/QFGrep'                   " Quickfix filtering
Plug 'mhinz/vim-startify'              " Start screen
Plug 'jceb/vim-orgmode'                " Text outlining and task management
if has('nvim')
  Plug 'Shougo/deoplete.nvim'     " Completion framework
else
  Plug 'Shougo/deoplete.nvim'     " Completion framework
  Plug 'roxma/nvim-yarp'          " Remote Plugin Framework
  Plug 'roxma/vim-hug-neovim-rpc' " Compatibility layer for neovim rpc client
endif
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' } " A Deoplete source for TabNine
Plug 'gyim/vim-boxdraw'                                 " Draw ASCII diagrams
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }                                               " Language Server Protocol support
"Plug 'fcpg/vim-kickfix'                         " Issue: Filters content by content of file not content of error
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " Issue: not complete beyond one symbol at a time
"Plug 'majutsushi/tagbar'                        " Issue: Auto updating issues with tag file
"Plug 'tpope/vim-sleuth'                         " Issue: Performance issues
"Plug 'Valloric/YouCompleteme'                   " Issue: TabNine compatibility issues
"Plug 'ludovicchabant/vim-gutentags'             " Issue: Generating tag files in non-project files
"Plug 'craigemery/vim-autotag'                   " Issue: Generating tag files in non-project files
"Plug 'galooshi/vim-import-js'                   " Issue: Need more config
"Plug 'thaerkh/vim-workspace'
"Plug 'terryma/vim-expand-region'
call plug#end()

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


" Hybrid line numbers
set number relativenumber


" Use normal alerts rather than UI alerts for errors
set guioptions=
set guioptions+=c


" Set font on Mac
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  :set guifont=Meslo\ LG\ S\ DZ:h13
endif

" Startify
let g:startify_custom_header = []
let g:startify_session_persistence = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
      \ 'max_list': 20,
      \ 'complete_suffix': v:false
      \ })
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

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

let g:airline_highlighting_cache = 1

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
  "\ 'tagbar',
  "\ 'whitespace',
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
let g:gundo_prefer_python3 = 1
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
" rg for searching.
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
" \Do - Generate doc stub
nmap <leader>Do :Dox<CR>


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


" Disable spell check dirvish and quickfix
autocmd FileType dirvish setlocal nospell
autocmd FileType qf setlocal nospell


" Use login profile for :terminal
"set shell=bash\ -l
"set shellcmdflag=-ic

nnoremap <leader>F :Ack<Space>
let g:ackprg = 'rg --vimgrep --fixed-strings'

"let g:ale_virtualtext_cursor = 1 " Only supported in NeoVim
let g:ale_linter_aliases = {
\   'asm': ['nasm'],
\}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'ruby': ['rubocop'],
\   'asm': ['nasm'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}
let g:ale_ruby_rubocop_executable = 'bundle'
nmap <leader>a <Plug>(ale_next_wrap)
nmap <leader>e <Plug>(ale_fix)

"let g:ycm_collect_identifiers_from_tags_files = 1 - Errors when tag pattern not found

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
set completeopt=menuone,noinsert,noselect
set pumheight=10

" Disable workspace autosave
let g:workspace_autosave = 0

" Tests
set path=.,src,node_nodules
set suffixesadd=.js,.jsx

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']

" Tagbar
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['+', '-']

" Disable bell
set visualbell t_vb=

" Move arguments left/right
nnoremap <leader>, :SidewaysLeft<cr>
nnoremap <leader>. :SidewaysRight<cr>

" Enable indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_start_level = 2

" Error formats
set errorformat+=%f\\(%l\\,%c\\):\ %trror\ %m                  " TSC error
set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m   " ESLint error
set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m " ESLint warning

" Define make programs
autocmd FileType javascript setlocal makeprg=yarn\ run\ lint
autocmd FileType typescript setlocal makeprg=yarn\ run\ lint

" Org Mode
let g:org_todo_keywords = [['TODO(t)', 'IN_PROGRESS(p)', '|', 'DONE(d)']]
let g:org_agenda_files = ['./TODO.org']
let g:org_indent = 1

" Language Client
let g:LanguageClient_serverCommands = {
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ }
nmap <F5> <Plug>(lcn-menu)
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> gr <Plug>(lcn-references)
nmap <silent> gq <Plug>(lcn-update-quickfixlist):cfirst<CR>
let g:LanguageClient_diagnosticsList = 'Quickfix'
let g:LanguageClient_diagnosticsSignsMax = 0
let g:LanguageClient_diagnosticsMaxSeverity = 'Warning'
let g:LanguageClient_hoverPreview = 'Always'
let g:LanguageClient_useFloatingHover = 0
let g:LanguageClient_usePopupHover = 0
