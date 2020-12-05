setlocal shiftwidth=2 softtabstop=2 tabstop=2
setlocal spell
iabbrev ref *Reference:*
" Turn word into link
nmap <leader><leader>l ysiW]ya[Epcs[)
nnoremap <leader>fy :let @* = "[" . expand("%") . "](" . expand("%") . ")" \| let @+ = "[" . expand("%") . "](" . expand("%") . ")"<cr>
nnoremap <leader><leader>r :call GetLinks()<cr>

" Add a dash for list items with `o`
function! AddDashIfList() 
    if match(getline("."), '^\s*-\s\[') >= 0 " Todo item
        exe "normal! o- [ ] \<ESC><<<<"
        call feedkeys('A')
    elseif match(getline("."), '^\s*-\s') >= 0 " Normal list item
        exe "normal! o- \<ESC><<<<"
        call feedkeys('A')
    else 
        exe "normal! o\<ESC>"
        call feedkeys('i')
    endif
endfunction

nnoremap o :call AddDashIfList()<CR>

" Todo
function! ToggleDone() 
    if match(getline("."), '\[\s\]') >= 0
        exe "normal! ^f[lrxdd"
        let x = search('^## Done', 's')
        exe "normal! p''"
    elseif match(getline("."), '\[x\]') >= 0
        exe "normal! ^f[lr "
    endif
endfunction

nnoremap <leader><leader>t o- [ ] 
nnoremap <leader><leader><space> :call ToggleDone()<CR>

