setlocal shiftwidth=2 softtabstop=2 tabstop=2
iabbrev ref *Reference:* 
" Turn word into link
nmap <leader><leader>l ysiW]ya[Epcs[)
nnoremap <leader>fy :let @* = "[" . expand("%") . "](" . expand("%") . ")" \| let @+ = "[" . expand("%") . "](" . expand("%") . ")"<cr>
nnoremap <leader><leader>r :Ag %<cr>
