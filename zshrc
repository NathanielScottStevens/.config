# ZSH
export ZSH_THEME="powerlevel10k/powerlevel10k"
export plugins=(git vi-mode asdf fzf)
bindkey -M viins 'jk' vi-cmd-mode

# AWS
export AWS_PROFILE=default

# BIN
PATH=$PATH:~/bin

# GIT
alias gs="git status"
alias gcos="git for-each-ref --format='%(refname:short)' refs/heads | fzf | xargs git checkout"
alias gcoa="git checkout ."
alias glogt="glod | grep 'Nathaniel\|tag' | less"
alias gtodo="git diff develop -S TODO"

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"
alias mp="mix phx.server"
alias mpi="iex -S mix phx.server"
alias mdg="mix deps.get"
alias mem="mix ecto.migrate"
alias mer="mix ecto.reset"
alias megm="mix ecto.gen.migration"
alias gtn="grep '^\s\+\d\+)'"
alias mt="mix test | tee results.test"
alias mtn="mix test | gtn"

# Alias
alias as="alias | grep "

# MISC
alias s="source ~/.zshrc"
alias po="lsof -i -P -n | grep LISTEN"

# VIM
alias vim="nvim"

# Z
. $(brew --prefix)/etc/profile.d/z.sh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# DOCKER
alias dps="docker ps"
alias dk="docker kill"

# POMODORO
alias pom="sleep 25m && osascript -e 'display notification \"Step away!\" with title \"Pomodoro Over\"'"
