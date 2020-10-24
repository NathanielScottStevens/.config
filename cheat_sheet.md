# Cheat Sheet

## Vim
### netrw
Create new file
`%`

### Tabs
Create new tab
`:tabnew file`

Create new tab with search term
`:tabf file*`

Reorder tabs
`:tabm 0`

### Obsession
To start a session
`:Obsess`
To load a session
`:source` or `vim -S`

### Slime
Send highlighted code to the repl in another pane
C-c, C-c   (You can double tap c)

### Elixir Alchemist
Auto Completion `<C-x><C-o>`
View Docs `K`
Jump to definition `<C-]>`

### Surround
- `cs[{`: change surrounding `[` to `{`
- `ds(`: delete surrounding parens
- `ysiw)`: surround word with parens
- `vwS)`: go into visual mode, highlight a word, surround with parens

## Tmux
Switch between sessions
```
C-z (  previous session
C-z s  choose session from a list
```

## Misc
Find and replace
`find . -name "*.txt" | xargs sed -i "" "s/alyssa/nathaniel/g"`

List to UDP
`nc -ulp #{port}`
Listen to TCP on local
`nc -lkp #{port}`

Listen to HTTP Requests
```
npm install http-echo-server -g
PORT=8081 http-echo-server
```

Edit command in vim on command line
`fc`


