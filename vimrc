" Basic settings ---------------------- {{{
syntax on
set tabstop=4
set number
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set clipboard=unnamed
set hidden
set foldtext=getline(v:foldstart)
set foldlevel=99
" }}}

" Color settings ---------------------- {{{
set background=dark
colorscheme desert
highlight QuickFixLine ctermbg=234
highlight Folded ctermfg=gray ctermbg=none
" }}}

" Mappings  ---------------------- {{{
let mapleader = ","
let maplocalleader = "\\"

inoremap jk <esc>
nnoremap <Leader>ve :vsplit $MYVIMRC<cr>
nnoremap <Leader>vs :source $MYVIMRC<cr>
nnoremap <Leader>cs :split ~/config/cheat_sheet.md<cr>
nnoremap <leader>r :set relativenumber!<cr>
nnoremap H ^
onoremap H ^
nnoremap L $
onoremap L $
" }}}

" Vim Test  ---------------------- {{{
nnoremap <silent> <leader>tt :TestNearest<CR>
nnoremap <silent> <leader>tb :TestFile<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tr :TestLast<CR>
let test#strategy = "dispatch"
" }}}

" File ---------------------- {{{
nnoremap <leader>fy :let @" = expand("%")<cr>

function! CopyFile()
    call inputsave()
    let l:name = input("File name: ")
    call inputrestore()

    let l:fileName = expand("%:h") . "/" . l:name . "." .  expand("%:e")

    execute "silent !cp " . expand("%") . " " . l:fileName
    execute "redraw!"
    execute "edit " . l:fileName
endfunction
nnoremap <leader>fc :call CopyFile()<cr>
" }}}

" Searching ---------------------- {{{
if executable('ag')
  " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
endif
" }}}

" Ag Bindings {{{
augroup Ag
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap <leader>/ :Ag<SPACE>
    nnoremap <leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
augroup END
" }}}

" Quickfix Window ---------------------- {{{
nnoremap <C-k> :cp<CR>
nnoremap <C-j> :cn<CR>
" }}}

" Vundle ---------------------- {{{
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
Plugin 'tpope/vim-dispatch'
Plugin 'janko/vim-test'
Plugin 'tpope/vim-obsession' "Allows vim sessions to be restored
Plugin 'sheerun/vim-polyglot' "Syntax highlighting for (almost) all languages
Plugin 'vimwiki/vimwiki'

" Elixir
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-editors/vim-elixir' " Syntax Highlighting and file type detection
Plugin 'mhinz/vim-mix-format'


" Haskell
Plugin 'neovimhaskell/haskell-vim'
Plugin 'alx741/vim-hindent' "Runs hindent format on save
Plugin 'jpalardy/vim-slime' "Not for Haskell specifically but used to send code to repl
call vundle#end()            

filetype plugin indent on   
" }}}

" Vinegar ---------------------- {{{
" Prevents C-6 from cycling through vinegar buggers
let g:netrw_altfile = 1
augroup hideFileType
    autocmd FileType netrw setl bufhidden=wipe
augroup END
" }}}

" Airline ---------------------- {{{
let g:airline_theme='papercolor'
let g:airline_powerline_fonts=1
" }}}

" CtrlP ---------------------- {{{
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_working_path_mode = 0 "Use directory vim was started in as root directory

nnoremap <leader>p :call SearchDirectoryToggle()<cr>

function! SearchDirectoryToggle()
    if g:ctrlp_working_path_mode . 1 ==? 'ra1'
        let g:ctrlp_working_path_mode = 0
    else
        let g:ctrlp_working_path_mode = 'ra'
    endif
endfunction
" }}}

" Slime ---------------------- {{{
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
" }}}

" Haskell ---------------------- {{{
let g:hindent_on_save = 1
let g:haskell_indent_disable = 1
" }}}

" Elixir ---------------------- {{{
" let g:mix_format_on_save = 1
augroup elixir 
    autocmd BufNewFile *.exs :set filetype=elixir<cr>
augroup END
" }}}

" VimWiki ---------------------- {{{
let g:vimwiki_list = [{'path': '~/notes/',
            \ 'syntax': 'markdown', 'ext': '.md'}]
" }}}
