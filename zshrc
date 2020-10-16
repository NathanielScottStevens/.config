# ZSH
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
plugins=(git)
source ~/.oh-my-zsh/oh-my-zsh.sh

# AWS
export AWS_PROFILE=default

# BIN
PATH=$PATH:~/bin

# GIT
alias gs="git status"
alias gc="git for-each-ref --format='%(refname:short)' refs/heads | fzf | xargs git checkout"

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Alias
alias as="alias | grep "

# MISC
alias s="source ~/.zshrc"
