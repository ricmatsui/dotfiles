" ~/.config/nvim/init.vim
"
" source ~/synced/Projects/dotfiles/nvim/init.vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &runtimepath = expand('<sfile>:p:h') . ',' . &runtimepath
let &packpath = &runtimepath

source ~/.vimrc

lua << EOF
require('ricmatsui')
EOF
