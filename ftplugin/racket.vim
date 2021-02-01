nnoremap <buffer> <leader><leader>ro :call VimuxOpenRunner() \| call VimuxRunCommand("echo; racket") \| :call VimuxRunCommand("(enter! \"" . expand("%") . "\")")<CR>
nnoremap <buffer> <leader><leader>rr :call VimuxRunCommand("(enter! \"" . expand("%") . "\")")<CR>
nnoremap <buffer> <leader><leader>rs :call VimuxSendText(@*)<CR>

