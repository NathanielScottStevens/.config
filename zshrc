# ZSH
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ASDF
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# AWS
export AWS_PROFILE=default

# BIN
PATH=$PATH:/Users/nathaniel.stevens/.local/bin

# GIT
alias gs="git status"

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"
