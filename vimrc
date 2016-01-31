" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteme'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/a.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mbbill/code_complete'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-session'"
Plugin 'nanotech/jellybeans.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/gdbmgr'
Plugin '907th/vim-auto-save'
Plugin 'tpope/vim-sleuth'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/restart.vim'
Plugin 'rking/ag.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'derekwyatt/vim-scala'
Plugin 'ricmatsui/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'luochen1990/rainbow'
Plugin 'rosenfeld/conque-term'
Plugin 'matze/vim-move'
call vundle#end()
filetype plugin indent on


colorscheme jellybeans

set autoindent
set spell


" Use system clipboard
set clipboard=unnamedplus


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


" Map Tab to switch buffers
" <Tab>  - Next buffer
" \<Tab> - Previous buffer
:nnoremap <Tab> :bnext<CR>
:nnoremap <leader><Tab> :bprevious<CR>


" Don't enable rainbow highlighting by default, map toggle for rainbow
" \rt - Toggle rainbow highlighting
let g:rainbow_active = 0
nmap <leader>rt :RainbowToggle<CR>


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


" Configure Ctrl-P use the repo as the root directory, and use
" Ag for searching
let g:ctrlp_working_path_mode = 'cr'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


" Enable passive syntax checking, use JSX hint
" \sc - Run syntax check
" :Errors to show list of errors
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
nmap <leader>sc :SyntasticCheck<CR>


" Auto save when entering normal mode only
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0


" Ctrl-[HJKL] - Move to split in direction
nmap <silent> <c-k> :wincmd k<CR>   
nmap <silent> <c-j> :wincmd j<CR> 
nmap <silent> <c-h> :wincmd h<CR> 
nmap <silent> <c-l> :wincmd l<CR>


" Map open shell, disable slow warning message
" \ba - Open bash shell
nmap <leader>ba :ConqueTerm bash -l<CR>
let g:ConqueTerm_StartMessages = 0


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


" Configure NERDTree, hide help, ignore files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
:let g:NERDTreeMinimalUI = 1
let NERDTreeIgnore=['.pyc$', '\~$']
