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

" Do not auto-resize windows
set noequalalways

" Disable Macvim touchbar fullscreen button
let g:macvim_default_touchbar_fullscreen=0

" Vim-Plug
call plug#begin()
Plug 'sjl/gundo.vim'                   " Undo tree visualizer
Plug 'Shougo/vimproc.vim'              " Asynchronous execution library
Plug 'andrewradev/splitjoin.vim'       " Switch between a single-line statement and a multi-line one
Plug '907th/vim-auto-save'             " Automatically saves changes
Plug 'nvim-lua/plenary.nvim'           " Lua Utils
Plug 'lewis6991/gitsigns.nvim', { 'branch': 'main' } " Git sign column
Plug 'ctrlpvim/ctrlp.vim'              " Full path fuzzy file, buffer, mru, tag finder
Plug 'nanotech/jellybeans.vim'         " A colorful, dark color scheme
Plug 'vim-airline/vim-airline'         " Status/tabline
Plug 'vim-airline/vim-airline-themes'  " Theme repository for vim-airline
Plug 'scrooloose/nerdcommenter'        " Comment functions
Plug 'tpope/vim-fugitive'              " Plugin for Git
Plug 'vim-scripts/a.vim'               " Switch between source and header files
Plug 'tpope/vim-surround'              " Mappings to modify parantheses, brackets, quotes in pairs
Plug 'AndrewRadev/switch.vim'          " Flip values or alternative syntax
Plug 'wellle/targets.vim'              " Adds various text objects: pair, quote, separator, argument, tag
Plug 'ruanyl/vim-gh-line'              " Opens a link to the current line on GitHub
Plug 'justinmk/vim-dirvish'            " Path navigator
Plug 'mileszs/ack.vim'                 " Run search tool with results list
Plug 'w0rp/ale'                        " Asynchronous Lint Engine
Plug 'tpope/vim-speeddating'           " Increment and decrement datetime formats
Plug 'tpope/vim-unimpaired'            " Pair mappings for next, previous, lines, encoding
Plug 'editorconfig/editorconfig-vim'   " Config support for EditorConfig
Plug 'wesQ3/vim-windowswap'            " Swap windows
Plug 'fisadev/vim-ctrlp-cmdpalette'    " Find and run vim commands
Plug 'Kuniwak/vim-qrcode'              " Display a QR code
Plug 'itkq/fluentd-vim'                " Fluentd syntax
Plug 'sk1419/QFGrep'                   " Quickfix filtering
Plug 'mhinz/vim-startify'              " Start screen
Plug 'direnv/direnv.vim'               " Direnv support
Plug 'gcmt/taboo.vim'                  " Tab renaming
Plug 'skywind3000/asyncrun.vim'        " Async Run
Plug 'tpope/vim-repeat'                " Repeat for plugin commands
Plug 'tversteeg/registers.nvim', { 'branch': 'main' } " Show vim register values
Plug 'lukas-reineke/indent-blankline.nvim' " Indent guides
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} " Autocompletion
Plug 'vimwiki/vimwiki'                 " Wiki
Plug 'junegunn/fzf'                    " File finder for Zettel
Plug 'junegunn/fzf.vim'                " File finder for Zettel
Plug 'michal-h21/vim-zettel'           " Note taking
Plug 'takemon-go/dotd'                 " Date completion
Plug 'tikhomirov/vim-glsl'             " GLSL support
Plug 'jxnblk/vim-mdx-js'               " MDX support
Plug 'wellle/context.vim'              " Context of lines

"Disabled plugins
"Plug 'terryma/vim-multiple-cursors'    " Multiple selection
"Plug 'junegunn/vim-easy-align'         " Alignment plugin
"Plug 'dhruvasagar/vim-table-mode'      " Table creator & formatter
"Plug 'jlanzarotta/bufexplorer'         " Switch between buffers - Possible perf issue?
"Plug 'matze/vim-move'                  " Moves lines and selections
"Plug 'vim-scripts/DoxygenToolkit.vim'  " Doxygen comments generator
"Plug 'vim-scripts/gdbmgr'              " Window interface to gdb
"Plug 'vim-scripts/restart.vim'         " Restart with command
"Plug 'ntpeters/vim-better-whitespace'  " Highlight trailing whitespace characters
"Plug 'yegappan/greplace'               " Search and replace a pattern across multiple files
"Plug 'yssl/QFEnter'                    " Open items from quickfix or location list
"Plug 'kshenoy/vim-signature'           " Place, toggle and display marks
"Plug 'chrisbra/NrrwRgn'                " Focus on a selected region while making the rest inaccessible
"Plug 'tpope/vim-obsession'             " Automatically save sessions
"Plug 'sheerun/vim-polyglot'            " A collection of language packs - possible perf issue?
"Plug 'AndrewRadev/sideways.vim'        " Move the item under the cursor left or right
"Plug 'nathanaelkane/vim-indent-guides' " Displaying indent levels - possible perf issue?
"Plug 'christoomey/vim-titlecase'       " Operator for titlecasing
"Plug 'psliwka/vim-smoothie'            " Smooth scrolling
"Plug 'rbong/vim-flog'                  " Git branch viewer
"Plug 'chamindra/marvim'                " Macro Repository
"Plug 'yegappan/taglist'                " Source Code Browser
"Plug 'gyim/vim-boxdraw'                " Draw ASCII diagrams
"Plug 'gerw/vim-HiLinkTrace'            " Highlight debugging - possible perf issue?
"Plug 'thaerkh/vim-workspace'
"Plug 'terryma/vim-expand-region'
"Plug 'nvim-lua/completion-nvim'        " Completion engine
"Plug 'aca/completion-tabnine', { 'do': 'version=3.1.9 ./install.sh' }
"Plug 'steelsojka/completion-buffers'
"Plug 'github/copilot.vim', { 'branch': 'release' }
"Plug 'renerocksai/telekasten.nvim', { 'branch': 'main' } " No custom template, no unique file names
"Plug 'jceb/vim-orgmode'                " Text outlining and task management

"Future plugins
"https://github.com/AckslD/nvim-neoclip.lua
"https://github.com/nvim-neorg/neorg
"https://github.com/ojroques/nvim-hardline
"https://github.com/nvim-treesitter/nvim-treesitter
"https://github.com/nvim-treesitter/nvim-treesitter-textobjects
"https://github.com/mfussenegger/nvim-lint
"Plug 'nvim-telescope/telescope.nvim'

"Conflicting plugins
"Plug 'fcpg/vim-kickfix'                         " Issue: Filters content by content of file not content of error
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " Issue: not complete beyond one symbol at a time
"Plug 'majutsushi/tagbar'                        " Issue: Auto updating issues with tag file
"Plug 'tpope/vim-sleuth'                         " Issue: Performance issues
"Plug 'Valloric/YouCompleteme'                   " Issue: TabNine compatibility issues
"Plug 'ludovicchabant/vim-gutentags'             " Issue: Generating tag files in non-project files
"Plug 'craigemery/vim-autotag'                   " Issue: Generating tag files in non-project files
"Plug 'galooshi/vim-import-js'                   " Issue: Need more config
"Plug 'Quramy/tsuquyomi'                         " Issue: Freezes
"Plug 'neovim/nvim-lspconfig'                    " Issue: Using ALE for now
"Plug 'kristijanhusak/orgmode.nvim' " Requires treesitter
call plug#end()

colorscheme jellybeans

" Dark background
let g:jellybeans_overrides = {
      \    'background': { 'ctermbg': '000000', '256ctermbg': '000000' },
      \}
if has('termguicolors') && &termguicolors
  let g:jellybeans_overrides['background']['guibg'] = '000000'
endif

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
if has('gui_macvim')
  set guifont=Meslo\ LG\ S\ DZ:h13
endif

" Startify
let g:startify_custom_header = []
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ ]

" Set vim airline to clean dividers
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' '

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_highlighting_cache = 1

" Disable unnecessary vim airline extensions
let g:airline#extensions#branch#enabled = 0

" Cleanup vim airline sections and layout
let g:airline_section_a = airline#section#create(['crypt', 'paste', 'iminsert'])
"let g:airline_section_c_only_filename = 1
"let g:airline_stl_path_style = 'short'
let g:airline_section_x = airline#section#create_right([])
let g:airline_section_y = airline#section#create_right([])

let g:airline_extensions = [
  \ 'ale',
  \ 'ctrlp',
  \ 'fugitiveline',
  \ 'quickfix',
  \ 'tabline',
  \ 'term',
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
        let a:palette.inactive['airline_c'][3] = '236'
        let a:palette.normal['airline_c'][2] = 'White'
        let a:palette.normal['airline_c'][3] = '236'
        let a:palette.visual['airline_c'][2] = 'White'
        let a:palette.visual['airline_c'][3] = '236'
        let a:palette.insert['airline_c'][2] = 'White'
        let a:palette.insert['airline_c'][3] = '236'
        let a:palette.replace['airline_c'][2] = 'White'
        let a:palette.replace['airline_c'][3] = '236'
        let g:testoutput = keys(a:palette)
    endif
endfunction

" Taboo config
let g:taboo_tab_format = "%f%m"
let g:taboo_renamed_tab_format = "[%l]%m"
nnoremap <leader>tr :TabooRename<Space>
nnoremap <leader>tc :TabooReset<CR>

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


" Grep with Ack and rg
nnoremap <leader>F :Ack<Space>
let g:ackprg = 'rg --vimgrep --fixed-strings'
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
" \ch - Toggle column highlight
nnoremap <leader>ch :set cursorcolumn!<CR>


" Show tabs
set listchars=tab:▸\ 
set list

" Map git shortcuts
" \gs  - git status
" \gd  - git diff
" \gc  - git commit
" \gp  - git push
" \gca  - git commit all
nmap <leader>gs :Git<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gca :Gcommit -a<CR>

" Enable syntax highlighting when diffing
if &diff
  syntax on
endif

autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" Map split buffer to side
" \A - Split buffer vertically and remain in current buffer
nmap <leader>A :vsp<CR><C-w>l:A<CR><C-w>h


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


" Disable spell check dirvish and quickfix
autocmd FileType dirvish setlocal nospell
autocmd FileType qf setlocal nospell


let g:ale_virtualtext_cursor = 1 " Only supported in NeoVim
let g:ale_virtualtext_prefix = '# '
let g:ale_linter_aliases = {
\   'asm': ['nasm'],
\   'markdown.mdx': ['markdown'],
\}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'markdown': [],
\   'json': ['jsonlint'],
\   'ruby': ['rubocop'],
\   'rust': ['analyzer'],
\   'asm': ['nasm'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'markdown': ['prettier'],
\   'rust': ['rustfmt'],
\}

let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_options = '--cache'
let g:ale_javascript_eslint_use_global = 1

let g:ale_hover_to_floating_preview = 1

nmap <leader>a <Plug>(ale_next_wrap)
nmap <leader>e <Plug>(ale_fix)
nmap <leader>d <Plug>(ale_detail)
nmap <leader>v <Plug>(ale_hover)

" Fix diff colors
hi DiffAdd    gui=NONE guifg=NONE    guibg=#182a09
hi DiffChange gui=NONE guifg=NONE    guibg=#0e1d25
hi DiffDelete gui=NONE guifg=#330004 guibg=#330004
hi DiffText   gui=NONE guifg=NONE    guibg=#1c3a4a

" Disable man map
:map K <Nop>

" Always show status line
set laststatus=2

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

" Error formats
set errorformat+=%f\\(%l\\,%c\\):\ %trror\ %m                  " TSC error
set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m   " ESLint error
set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m " ESLint warning

" Define make programs
autocmd FileType javascript setlocal makeprg=yarn\ run\ lint
autocmd FileType typescript setlocal makeprg=yarn\ run\ lint

" Org Mode
"let g:org_todo_keywords = [['TODO(t)', 'IN_PROGRESS(p)', '|', 'DONE(d)']]
"let g:org_agenda_files = ['./TODO.org']
"let g:org_indent = 1

" NERD Commenter
let g:NERDCustomDelimiters={
      \ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
      \}

" VimR
if has('gui_vimr')
  " Switch tabs
  nnoremap <S-D-{> :tabp<CR>
  vnoremap <S-D-{> :tabp<CR>
  inoremap <S-D-{> :tabp<CR>
  nnoremap <S-D-}> :tabn<CR>
  vnoremap <S-D-}> :tabn<CR>
  inoremap <S-D-}> :tabn<CR>
  " Save file
  nnoremap <d-s> :w<CR>
  inoremap <d-s> <C-o>:w<CR>
  " Close current buffer/file
  nnoremap <d-w> :q<CR>
  inoremap <d-w> <C-o>:q<CR>
endif

" New tab
nnoremap <M-t> :tabnew<CR>
" Switch tabs
nnoremap <M-{> :tabp<CR>
vnoremap <M-{> :tabp<CR>
inoremap <M-{> :tabp<CR>
nnoremap <M-}> :tabn<CR>
vnoremap <M-}> :tabn<CR>
inoremap <M-}> :tabn<CR>
" Close current buffer/file
nnoremap <M-w> :q<CR>
inoremap <M-w> <C-o>:q<CR>

" Format JSON command
command! FormatJSON %!jq .

" Async make command
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" Async Run - automatically open quickfix with 8 lines visible
let g:asyncrun_open = 8

" gitsigns
lua << EOF
    require('gitsigns').setup {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~_' },
        },

        on_attach = function(bufnr)
            local function map(mode, lhs, rhs, opts)
                opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
                vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
            end

            map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
            map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

            map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
            map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        end
    }
EOF

" completion-nvim
"autocmd BufEnter * lua require'completion'.on_attach()
"set shortmess+=c
"let g:completion_chain_complete_list = {
    "\ 'default': [
    "\    {'complete_items': ['tabnine']},
    "\    {'complete_items': ['buffers']},
    "\    {'mode': '<c-p>'},
    "\    {'mode': '<c-n>'}
    "\]
"\}
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
"let g:completion_confirm_key = ''
"let g:completion_trigger_on_delete = 1

"imap <c-j> <Plug>(completion_next_source)
"imap <c-k> <Plug>(completion_prev_source)

" Indent blankline
" Workaround for https://github.com/neovim/neovim/issues/14209
set colorcolumn=99999
lua << EOF
require('indent_blankline').setup {
}
EOF

"lua << EOF
"require('orgmode').setup({
  "org_agenda_files = {'./TODO.org'},
  "org_default_notes_file = './TODO.org',
  "org_todo_keywords = {'TODO(t)', 'IN_PROGRESS(p)', '|', 'DONE(d)'},
  "org_indent_mode = 'noindent',
  "org_log_done = 'false',
"})
"EOF

"let g:copilot_filetypes = {
            "\ 'markdown': v:true,
            "\ }

let g:coq_settings = {
            \ 'auto_start': 'shut-up',
            \ 'display.pum.fast_close': v:false,
            \ 'clients.tabnine.enabled': v:true,
            \ 'clients.snippets.enabled': v:false,
            \ 'clients.snippets.warn': [],
            \ 'clients.buffers.enabled': v:false,
            \ 'display.ghost_text.enabled': v:false,
            \ 'display.icons.mode': 'none',
            \ 'keymap.jump_to_mark': '<c-s>',
            \ }

nnoremap <silent> <c-h> :wincmd h<CR>

let g:vimwiki_list = [
            \     {
            \         'path': '~/synced/Wiki',
            \         'syntax': 'markdown',
            \         'ext': '.md'
            \     }
            \ ]

let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_listsyms = ' .X'
let g:vimwiki_key_mappings = {
            \ 'headers': 0,
            \ }
"let g:vimwiki_folding = 'list'
hi! link VimwikiCheckBoxDone Title
nmap <Leader>ws <Plug>VimwikiSplitLink
nmap <Leader>wv <Plug>VimwikiVSplitLink
nmap <Leader>wt <Plug>VimwikiTabnewLink

let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_options = [
            \ {
            \     'template': '~/synced/Wiki/template.tpl',
            \     'disable_front_matter': 1
            \ }
            \ ]
nmap <leader>zo :ZettelOpen<CR>

augroup dateformats
	autocmd!
	autocmd VimEnter * silent execute 'SpeedDatingFormat %i %Y-%m-%d'
augroup END

let g:context_max_height = 2
