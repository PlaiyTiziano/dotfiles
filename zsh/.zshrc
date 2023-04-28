export ZSH=/Users/plaiytiziano/.oh-my-zsh

plugins=(
  git
  docker
)

source $HOME/dotfiles/zsh/.env
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $HOME/dotfiles/zsh/aliases.zsh
source $HOME/dotfiles/zsh/exports.zsh
source $HOME/dotfiles/zsh/binds.zsh

export LANG='en_US.UTF-8'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Brew
eval $(/opt/homebrew/bin/brew shellenv)

# thefuck
eval $(thefuck --alias)

# Starship prompt
eval $(starship init zsh)

# Support option stacking (zsh docker plugin)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
