syntax on
set tabstop=4
set relativenumber
set shiftwidth=4
set expandtab
set smartindent
set clipboard=unnamed


" Vundle
set nocompatible              
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Run :PluginInstall in editor
Plugin 'gmarik/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/paredit.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive' "Git Wrapper
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mhinz/vim-startify'

" Elixir
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-editors/vim-elixir'

Plugin 'tpope/vim-obsession' "Allows vim sessions to be restored

" Haskell
Plugin 'neovimhaskell/haskell-vim'
Plugin 'jpalardy/vim-slime' "Not for Haskell specifically but used to send code to repl
call vundle#end()            

filetype plugin indent on   

" NerdTree
map <F2> :NERDTreeToggle<CR>
