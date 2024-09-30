# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH
export ZSH_THEME="powerlevel10k/powerlevel10k"
export plugins=(git vi-mode asdf fzf)
bindkey -M viins 'jk' vi-cmd-mode
source ~/.oh-my-zsh/oh-my-zsh.sh

# ASDF
# This is required when asdf is installed through brew
export PATH=~/.asdf/shims:$PATH

# AWS
export AWS_PROFILE=default

function dev_instances() {
  aws ec2 describe-instances --query 'Reservations[].Instances[].[InstanceId,Tags[?Key==`product`]| [0].Value]' --output table
}

# BIN
PATH=$PATH:~/bin

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"


function update_migration() {
  local migration_file=$1
  local migration_name=${migration_file:14}
  local new_time=$(date +"%Y%m%d%H%M%S")

  mv $1 "$new_time$migration_name"
}


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


# Find Replace
function find_replace() {
  local target=$1
  local replacement=$2
  local file_ext=$3

  find . -name '*.'${file_ext} -print0 | xargs -0 sed -i "" "s/"${target}"/"${replacement}/"g"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.config/p10k.zsh

# Abbr
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
