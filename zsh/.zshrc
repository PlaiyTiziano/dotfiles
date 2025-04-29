export LANG='en_US.UTF-8'
export ZSH=$HOME/.oh-my-zsh
export GPG_TTY=$(tty)

plugins=(
  git
  docker
)

arch=$(uname -m)

# Brew
case "$arch" in
  x86_64)
    eval $( /usr/local/bin/brew shellenv)
    ;;
  arm64)
    eval $(/opt/homebrew/bin/brew shellenv)
    ;;
esac


# Starship prompt
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

source $HOME/dotfiles/zsh/.env
source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $HOME/.zsh/exports.zsh
source $HOME/.zsh/binds.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/copilot.zsh
source $HOME/.zsh/weather.zsh
source $HOME/.zsh/zoxide.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt auto_cd

# thefuck
eval $(thefuck --alias)

# Support option stacking (zsh docker plugin)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
