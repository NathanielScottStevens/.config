mkdir ~/.vim
ln -s ~/config/spell ~/.spell
ln -s ~/config/tmux.conf ~/.tmux.conf
ln -s ~/config/vimrc ~/.vimrc
ln -s ~/config/ftplugin ~/.vim/ftplugin
ln -s ~/config/spell ~/.vim/spell
ln -s ~/config/gitignore ~/.gitignore
ln -s ~/config/ctags ~/.ctags

git config --global core.excludesfile ~/.gitignore
git config --global merge.tool vimdiff

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "source ~/config/zshrc" >> ~/.zshrc
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# prefix + I to install plugins

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install z
  brew install jq
  brew install lazydocker
  brew install node
  brew install erlang
  brew install elixir
  brew install tree
  brew install tmux
  brew install watch
  brew install ag
  brew cask install iterm2

  brew install fzf
  $(brew --prefix)/opt/fzf/install
fi
  
