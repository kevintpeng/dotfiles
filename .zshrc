# Base16 Shell, for coloring asthetic
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
# fix colors in tmux
# export TERM="xterm-256color"
# if [ "$TMUX" = "" ]; then tmux -2; fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Case sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export PATH=~/Library/Python/3.6/bin:$PATH

autoload -U promptinit; promptinit

# set pureshell prompt
prompt pure

# automatically generated by fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# configure fasd
fasd_cache="$HOME/.fasd-init-zsh"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache


# tab completion for colorls
#source $(dirname $(gem which colorls))/tab_complete.sh
#alias ls=colorls
#alias l="colorls -lA --sd"
alias devup="sudo ansible-pull -U https://github.com/kevintpeng/dev-environment-as-code.git --extra-vars username=$(whoami)"

# pretty print json strings
alias json="python -m json.tool"

alias atom="atom -a"

alias learn="atom ~/Code/Learn-Something-Every-Day"

# modify history settings
setopt hist_ignore_dups share_history inc_append_history extended_history

#disable auto correct
unsetopt correct_all

# Load any unsynchronized local zshrc configurations and settings
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Load taskwarrior aliases and functions
if [ -f ~/.zshrc-taskwarrior ]; then
  source ~/.zshrc-taskwarrior
fi

# set shell color
base16_default-dark

better_gist() {
  gist $1 | pbcopy && echo "$1 copied!"
}

alias gist=better_gist
