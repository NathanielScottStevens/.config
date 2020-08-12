# ZSH
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
plugins=(git)
source ~/.oh-my-zsh/oh-my-zsh.sh

# AWS
export AWS_PROFILE=default

# BIN
PATH=$PATH:~/bin

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# MISC
alias s="source ~/.zshrc"
