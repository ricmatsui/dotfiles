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
Plug 'tpope/vim-speeddating'           " Increment and decrement datetime formats
Plug 'tpope/vim-unimpaired'            " Pair mappings for next, previous, lines, encoding
Plug 'editorconfig/editorconfig-vim'   " Config support for EditorConfig
Plug 'wesQ3/vim-windowswap'            " Swap windows
Plug 'fisadev/vim-ctrlp-cmdpalette'    " Find and run vim commands
Plug 'Kuniwak/vim-qrcode'              " Display a QR code
Plug 'itkq/fluentd-vim'                " Fluentd syntax
Plug 'sk1418/QFGrep'                   " Quickfix filtering
Plug 'mhinz/vim-startify'              " Start screen
Plug 'direnv/direnv.vim'               " Direnv support
Plug 'gcmt/taboo.vim'                  " Tab renaming
Plug 'skywind3000/asyncrun.vim'        " Async Run
Plug 'tpope/vim-repeat'                " Repeat for plugin commands
Plug 'tversteeg/registers.nvim', { 'branch': 'main' } " Show vim register values
Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v2.20.8' } " Indent guides
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} " Autocompletion
Plug 'vimwiki/vimwiki'                 " Wiki
Plug 'junegunn/fzf'                    " File finder for Zettel
Plug 'junegunn/fzf.vim'                " File finder for Zettel
Plug 'michal-h21/vim-zettel'           " Note taking
Plug 'takemon-go/dotd'                 " Date completion
Plug 'tikhomirov/vim-glsl'             " GLSL support
Plug 'jxnblk/vim-mdx-js'               " MDX support
Plug 'neovim/nvim-lspconfig'           " LSP support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Tree-sitter support
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'mizlan/iswap.nvim'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'pwntester/octo.nvim'
Plug 'supermaven-inc/supermaven-nvim', { 'branch': 'main' }
Plug 'stevearc/conform.nvim'
Plug 'mfussenegger/nvim-lint'

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
"Plug 'jose-elias-alvarez/null-ls.nvim', { 'branch': 'main' }
"Plug 'stevearc/oil.nvim' " Some compatibility issue?

"Future plugins
"https://github.com/AckslD/nvim-neoclip.lua
"https://github.com/nvim-neorg/neorg
"https://github.com/ojroques/nvim-hardline
"https://github.com/nvim-treesitter/nvim-treesitter
"https://github.com/nvim-treesitter/nvim-treesitter-textobjects
"https://github.com/mfussenegger/nvim-lint
"https://github.com/mizlan/iswap.nvim
"https://github.com/gbprod/substitute.nvim
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
"Plug 'kristijanhusak/orgmode.nvim' " Requires treesitter
"Plug 'wellle/context.vim'                       " Issue: Renders context over ALE details
call plug#end()
