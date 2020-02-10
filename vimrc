syntax on
set tabstop=4
set number
set relativenumber
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set clipboard=unnamed

" I mostly did this for the sake of Dispatch opening
" in the right place
set splitbelow
set splitright

hi QuickFixLine ctermbg=234

let mapleader = ","
let maplocalleader = "\\"

inoremap jk <esc>
nnoremap <Leader>ve :vsplit $MYVIMRC<cr>
nnoremap <Leader>vs :source $MYVIMRC<cr>
nnoremap <Leader>cs :split ~/config/cheat_sheet.md<cr>
nnoremap H ^
nnoremap L $

" Vim Test
nnoremap <silent> <leader>tt :TestNearest<CR>
nnoremap <silent> <leader>tb :TestFile<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tr :TestLast<CR>
let test#strategy = "dispatch"


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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'mhinz/vim-startify' 
Plugin 'tpope/vim-dispatch'
Plugin 'janko/vim-test'

" Elixir
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'mhinz/vim-mix-format'

Plugin 'tpope/vim-obsession' "Allows vim sessions to be restored

" Haskell
Plugin 'neovimhaskell/haskell-vim'
Plugin 'alx741/vim-hindent' "Runs hindent format on save
Plugin 'jpalardy/vim-slime' "Not for Haskell specifically but used to send code to repl
call vundle#end()            

filetype plugin indent on   

" Airline
let g:airline_theme='papercolor'
let g:airline_powerline_fonts=1

" NerdTree
map <F2> :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

" Haskell
let g:hindent_on_save = 1
let g:haskell_indent_disable = 1

" Elixir
let g:mix_format_on_save = 1
