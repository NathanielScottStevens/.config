setlocal shiftwidth=2 softtabstop=2 expandtab 
setlocal foldmethod=syntax foldlevel=1
iabbrev ii \|> IO.inspect(label: "<c-r>=@%<cr>:<c-r>=line(".")<cr>")
set makeprg=mix\ compile
nnoremap <leader>ta :Dispatch mix test<cr>
nnoremap <leader>c :make<cr>
nnoremap <leader>d :cexpr system('mix dialyzer')<cr>
