sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

echo "source '$(pwd)/zshrc'" >> ~/.zshrc

brew install gh nvim ripgrep
yarn global add eslint_d @fsouza/prettierd

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "source $(pwd)/vimrc" >> ~/.vimrc

mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim

mkdir -p ~/.cache/nvim

nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"
