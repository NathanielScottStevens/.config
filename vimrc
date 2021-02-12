" Basic settings ---------------------- {{{
syntax enable
set tabstop=4
set number
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set clipboard^=unnamed,unnamedplus
set hidden
set foldtext=getline(v:foldstart)
set foldlevel=99
set backspace=indent,eol,start
set nocscopetag "Prevent tag jumps from not showing multiple tag hits

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" }}}

" Plugins ---------------------- {{{
call plug#begin('~/.vim/plugged')

" Run :PlugInstall in editor
Plug 'gmarik/Vundle.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher' " Faster/more-specific matching, need python (pip3 install pynvim)
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'janko/vim-test'
Plug 'tpope/vim-obsession' "Allows vim sessions to be restored
Plug 'sheerun/vim-polyglot' "Syntax highlighting for (almost) all languages
Plug 'ludovicchabant/vim-gutentags' "tag generation
Plug 'benmills/vimux' "Tmux

" Elixir
Plug 'elixir-editors/vim-elixir' " Syntax Highlighting and file type detection
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Need to run :CocInstall coc-elixir
Plug 'mhinz/vim-mix-format'

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent' "Runs hindent format on save
Plug 'jpalardy/vim-slime' "Not for Haskell specifically but used to send code to repl

" Racket
Plug 'wlangstroth/vim-racket'

call plug#end()

filetype plugin indent on   
" }}}

" Color settings ---------------------- {{{
set background=dark
colorscheme desert
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim?file=Xterm-color-table.png
autocmd ColorScheme * highlight! link SignColumn LineNr
highlight SignColumn ctermbg=none
highlight QuickFixLine ctermbg=234
highlight Folded ctermfg=gray ctermbg=none
highlight MatchParen ctermfg=white
highlight SpellBad ctermfg=black
highlight Pmenu ctermbg=gray

highlight DiffAdd     ctermfg=black ctermbg=lightgreen 
highlight DiffRemove   ctermfg=black ctermbg=darkmagenta
highlight DiffDelete   ctermfg=black ctermbg=darkmagenta
highlight DiffChange   ctermfg=black ctermbg=lightblue
highlight DiffText   ctermfg=black ctermbg=lightblue

highlight Search   ctermbg=17
" }}}

" Mappings  ---------------------- {{{
let mapleader = ","
let maplocalleader = "\\"

inoremap jk <esc>
nnoremap <Leader>ve :vsplit $MYVIMRC<cr>
nnoremap <Leader>vs :source $MYVIMRC<cr>
nnoremap <Leader>cs :split ~/config/cheat_sheet.md<cr>
nnoremap <leader>r :set relativenumber!<cr>
nnoremap <leader>s :set spell!<cr>
nnoremap <leader>h :set hlsearch!<cr>
nnoremap H ^
onoremap H ^
vnoremap H ^
nnoremap L $
onoremap L $
vnoremap L $
" }}}

" Fugitive ---------------------- {{{
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gr :Gread<CR>
" }}}

" Vim Test  ---------------------- {{{
nnoremap <silent> <leader>tt :call VimuxOpenRunner() \| TestNearest<CR>
nnoremap <silent> <leader>tb :call VimuxOpenRunner() \| TestFile<CR>
nnoremap <silent> <leader>ta :call VimuxOpenRunner() \| TestSuite<CR>
nnoremap <silent> <leader>tr :call VimuxOpenRunner() \| TestLast<CR>
let test#strategy = "vimux"
let test#vim#term_position = "belowright"
" }}}

" Vimux  ---------------------- {{{
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

" Open Runner
map <Leader>vo :call VimuxOpenRunner()<CR>

" Send command to Runner
map <Leader>vv :call VimuxPromptCommand()<CR>

" Send last command to Runner
map <Leader>vr :call VimuxRunLastCommand()<CR>
" }}}

" File ---------------------- {{{
nnoremap <leader>fy :let @* = expand("%") \| let @+ = expand("%")<cr>

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

" Ag Bindings ---------------------- {{{
augroup Ag
    command! -nargs=+ -complete=tag Ag silent! grep! <args> | cwindow | redraw!
    nnoremap <leader>/ :Ag<SPACE>
    nnoremap <leader>* :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>
augroup END
" }}}

" Quickfix Window ---------------------- {{{
nnoremap <C-k> :cp<CR>
nnoremap <C-j> :cn<CR>
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
let g:airline#extensions#branch#displayed_head_limit = 5
" }}}

" CtrlP ---------------------- {{{
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_working_path_mode = 0 "Use directory vim was started in as root directory
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " Use pymatcher
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
let g:mix_format_on_save = 1
augroup elixir 
    autocmd BufNewFile *.exs :set filetype=elixir<cr>
augroup END
" }}}

" Zettelkasten ---------------------- {{{
function! ZettelkastenGetTitle()
    call inputsave()
    let l:name = input("Title: ")
    call inputrestore()

    return l:name
endfunction

function! ZettelkastenGetFileName(title)
    let l:fileTitle = substitute(a:title, " ", "_", "g")
    return strftime("%Y%m%d%H%M") . "_" . l:fileTitle . ".md"
endfunction

function! ZettelkastenEditNewNote(file, title)
    execute "vsplit " . a:file
    call setline(1, "# " . a:title)
    call setline(2, a:file)
    call setline(3, '')
    call setline(4, "*Links:*")
    call setline(5, '')
    call setline(6, "---")
    call setpos('.', [0, 7, 1, 0])
endfunction

function! ZettelkastenNewLink()
    let l:title = ZettelkastenGetTitle()
    let l:fileName = ZettelkastenGetFileName(l:title)
    let l:linkLine = search('\*Links:\*')
    execute "normal! " . l:linkLine . "ggo[" . l:fileName . "](" . l:fileName . ")\<esc>"
    call ZettelkastenEditNewNote(l:fileName, l:title)
endfunction

function! ZettelkastenNewNote()
    let l:title = ZettelkastenGetTitle()
    let l:fileName = ZettelkastenGetFileName(l:title)
    call ZettelkastenEditNewNote(l:fileName, l:title)
endfunction

nnoremap <leader>nn :call ZettelkastenNewNote()<cr>
nnoremap <leader>nl :call ZettelkastenNewLink()<cr>

function! GetLinks()
   execute "silent! grep! %"
   execute 'g/\[.\+\]/caddexpr matchstr(getline("."), "[A-Za-z0-9._]\\+") . ":" . line(".") .  ":" . getline(".")'
   execute "noh"
   execute "cwindow"
   execute "redraw!"
endfunction

" augroup zettel
"     autocmd BufWinEnter */notes/*.md call GetLinks()
" augroup END
" }}}

" Racket ---------------------- {{{
" Override Racket DSLs so my ftplugin file still works
augroup RacketLangs
  autocmd FileType brag,br setlocal filetype=racket
augroup END
" }}}
