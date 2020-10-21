# ZSH
export ZSH_THEME="powerlevel10k/powerlevel10k"
bindkey -v # vim mode
bindkey -M viins 'jk' vi-cmd-mode

# AWS
export AWS_PROFILE=default

# BIN
PATH=$PATH:~/bin

# GIT
alias gs="git status"
alias gc="git for-each-ref --format='%(refname:short)' refs/heads | fzf | xargs git checkout"
alias gcoa="git checkout ."

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Alias
alias as="alias | grep "

# MISC
alias s="source ~/.zshrc"
alias po="lsof -i -P -n | grep LISTEN"
