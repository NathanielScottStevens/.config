setlocal shiftwidth=2 softtabstop=2 expandtab 
setlocal foldmethod=syntax

iabbrev ii \|> IO.inspect(label: "<c-r>=@%<cr>:<c-r>=line(".")<cr>")

setlocal makeprg=mix\ compile
nnoremap <leader><leader>c :make<cr>
nnoremap <leader><leader>d :cexpr system('mix dialyzer')<cr>
nnoremap <leader><leader>f :MixFormat<cr>
onoremap m :<c-u>normal! F%vf{%<cr> " Operate on elixir map
nnoremap <leader><leader>ve :vsplit ~/config/ftplugin/elixir.vim<cr>
