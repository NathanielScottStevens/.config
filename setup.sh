mkdir ~/.vim
ln -s ~/config/spell ~/.spell
ln -s ~/config/tmux.conf ~/.tmux.conf
ln -s ~/config/vimrc ~/.vimrc
ln -s ~/config/ftplugin ~/.vim/ftplugin
ln -s ~/config/ftplugin ~/.config/nvim/ftplugin #neovim
ln -s ~/config/init.vim ~/.config/nvim
ln -s ~/config/spell ~/.vim/spell
ln -s ~/config/gitignore ~/.gitignore
ln -s ~/config/ctags ~/.ctags
ln -s ~/config/tool-versions ~/.tool-versions 

git config --global core.excludesfile ~/.gitignore
git config --global merge.tool vimdiff

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "source ~/config/zshrc" >> ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k  

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# prefix + I to install plugins

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install z
  brew install jq
  brew install lazydocker
  brew install node
  brew install tree
  brew install tmux
  brew install watch
  brew install ag
  brew install neovim
  brew install ctags
  brew install docker-compose
  brew install --cask docker
  brew install --cask iterm2
  brew install --cask google-chrome
  brew install --cask rectangle

  brew install fzf
  $(brew --prefix)/opt/fzf/install

  brew install asdf
  asdf plugin add erlang
  asdf plugin add elixir
  brew install autoconf
  brew install wxmac
  asdf install erlang 25.0.3 
  asdf install elixir 1.13.4-otp-25
fi

# For ctrlp-py-matcher plugin in vim
pip3 install pynvim

# Additional Steps:
# * Set iterm2 color setting to Solarized Dark - Patched: https://gist.github.com/kevin-smets/8568070
