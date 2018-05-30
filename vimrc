" Vundle
set nocompatible
filetype off
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
Plugin 'ricmatsui/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'Valloric/YouCompleteme'
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
call vundle#end()
filetype plugin indent on

colorscheme jellybeans

set autoindent
set spell

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
set guioptions+=c


" Set font on Mac
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  :set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h12
endif


" Set vim airline to clean dividers
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '^'
let g:airline_symbols.readonly = 'r'


" Disable unnecessary vim airline extensions
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'


" Cleanup vim airline sections and layout
let g:airline_section_a = airline#section#create_right(['crypt', 'paste', 'iminsert'])
let g:airline_section_x = airline#section#create_right([])
let g:airline_section_y = airline#section#create_right([])

let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'z', 'warning' ]
      \ ]


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


" Configure pymode
let g:pymode_virtualenv = 1
let g:pymode_lint = 0


" Configure folding
" \f - Toggle fold at the current level
set foldmethod=indent
set foldlevelstart=99
nmap <leader>f za


" Use Ag for grep
set grepprg=ag\ --nogroup\ --nocolor


" _ - Swap between true and false, etc.
let g:switch_mapping = "_"


" Configure Ctrl-P use the repo as the root directory, and use
" Ag for searching. Show results at the top
" Ctrl-P - Open file finder
" Ctrl-U - Open MRU file finder
let g:ctrlp_working_path_mode = 'cr'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_match_window_bottom = 0
nn <silent> <c-u> :<c-u>CtrlPMRU<CR>


" Enable passive syntax checking, use ESLint
" \a - Run syntax check
" :Errors to show list of errors
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_ruby_rubocop_exec = '/Users/ricardo/.rbenv/shims/rubocop'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
nmap <leader>a :SyntasticCheck<CR>


" Auto save when entering normal mode only
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0


" Ctrl-[HJKL] - Move to split in direction
nmap <silent> <c-k> :wincmd k<CR>   
nmap <silent> <c-j> :wincmd j<CR> 
nmap <silent> <c-h> :wincmd h<CR> 
nmap <silent> <c-l> :wincmd l<CR>


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


" Show whitespace
set listchars=tab:▸\ ,eol:¬
set list


" Map git shortcuts
" \gs  - git status
" \gd  - git diff
" \gc  - git commit
" \gp  - git push
" \gca  - git commit all
nmap <leader>gs :Gstatus<CR><C-w>10+
nmap <leader>gd :Gdiff<CR><C-w>10+
nmap <leader>gc :Gcommit<CR><C-w>10+
nmap <leader>gp :Gpush<CR>
nmap <leader>gca :Gcommit -a<CR><C-w>10+


" Map generate Doxygen stub
" \do - Generate doc stub
nmap <leader>do :Dox<CR>


" Map split buffer to side
" \A - Split buffer vertically and remain in current buffer
nmap <leader>A :vsp<CR><C-w>l:A<CR><C-w>h


" Map go to next error
" \n - Go to next error
nmap <leader>n :cnext<CR>


" Auto reload vimrc
autocmd! bufwritepost .vimrc source %


" Configure YouCompleteMe, and map go to definition
" \jd - Go to definition
syntax on
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>jd :YcmCompleter GoTo<CR>


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


" Dirvish disable spell check
autocmd FileType dirvish setlocal nospell


" Use login profile for :terminal
set shell=bash\ -l
