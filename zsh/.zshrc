export LANG='en_US.UTF-8'
export ZSH=/Users/plaiytiziano/.oh-my-zsh

plugins=(
  git
  docker
)

# Brew
eval $(/opt/homebrew/bin/brew shellenv)

# Starship prompt
eval $(starship init zsh)

source $HOME/dotfiles/zsh/.env
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $HOME/dotfiles/zsh/exports.zsh
source $HOME/dotfiles/zsh/binds.zsh
source $HOME/dotfiles/zsh/aliases.zsh
source $HOME/dotfiles/zsh/copilot.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# thefuck
eval $(thefuck --alias)

# Support option stacking (zsh docker plugin)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# pnpm
export PNPM_HOME="/Users/plaiytiziano/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
