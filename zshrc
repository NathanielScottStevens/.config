# ZSH
export ZSH_THEME="powerlevel10k/powerlevel10k"
export plugins=(git vi-mode asdf fzf)
bindkey -M viins 'jk' vi-cmd-mode

# AWS
export AWS_PROFILE=default

function dev_instances() {
  aws ec2 describe-instances --query 'Reservations[].Instances[].[InstanceId,Tags[?Key==`product`]| [0].Value]' --output table
}

# BIN
PATH=$PATH:~/bin

# GIT
alias gs="git status"
alias gcos="git for-each-ref --format='%(refname:short)' refs/heads | fzf | xargs git checkout"
alias gcoa="git checkout ."
alias glogt="glod | grep 'Nathaniel\|tag' | less"
alias gtodo="git diff develop -S TODO"
alias glast="git rev-parse --short HEAD | pbcopy"

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"
alias mp="mix phx.server"
alias mpi="iex -S mix phx.server"
alias mdg="mix deps.get"
alias mem="mix ecto.migrate"
alias mer="mix ecto.rollback -n=1"
alias megm="mix ecto.gen.migration"
alias gtn="grep '^\s\+\d\+)'"
alias mt="mix test | tee results.test"
alias mtn="mix test | gtn"
alias mcc="mix coveralls.html | grep -v '0$'"
alias mgc="mix xref callers"
alias mgr="mix xref graph --only-nodes --source" 


function update_migration() {
  local migration_file=$1
  local migration_name=${migration_file:14}
  local new_time=$(date +"%Y%m%d%H%M%S")

  mv $1 "$new_time$migration_name"
}

# Search
alias as="alias | grep "
alias es="env | grep -i "

# MISC
alias s="source ~/.zshrc"
alias po="lsof -i -P -n | grep LISTEN"

function gen_uuid {
  [[ -n $1 ]] && count=$1 || count=1
  curl -s "https://www.uuidgenerator.net/version4/bulk.json?amount=$count" | jq ".[]" | tr -d '"'
}

# VIM
alias vim="nvim"

# Z
. $(brew --prefix)/etc/profile.d/z.sh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# DOCKER
alias dps="docker ps | vim -R --cmd 'set nowrap'"   
alias dk="docker kill"
alias dc="docker-compose"
alias dburn='docker stop $(docker ps -aq); docker rm $(docker ps -aq)'

# Find Replace
function find_replace() {
  local target=$1
  local replacement=$2
  local file_ext=$3

  find . -name '*.'${file_ext} -print0 | xargs -0 sed -i "" "s/"${target}"/"${replacement}/"g"
}

