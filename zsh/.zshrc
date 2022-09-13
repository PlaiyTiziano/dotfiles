# Path to your oh-my-zsh installation.
export ZSH=/Users/plaiytiziano/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes for themes
# ZSH_THEME="spaceship"

plugins=(
  git
  docker
)

source ~/dotfiles/zsh/.env
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

TERMINAL="alacritty"
TERMINAL_CONFIG_FILE="alacritty.yml"

# config aliases
alias zshconfig="nvim ~/dotfiles/zsh/.zshrc"
alias nvimconfig="nvim ~/dotfiles/nvim/"
alias tmuxconfig="nvim ~/dotfiles/tmux/.tmux.conf"
alias termconfig="nvim ~/dotfiles/$TERMINAL/$TERMINAL_CONFIG_FILE"

# snippet aliases
alias jssnippets="nvim ~/.config/nvim/ultisnips/javascript.snippets"
alias rubysnippets="nvim ~/.config/nvim/ultisnips/ruby.snippets"

# convenience aliases
alias cat="bat"
alias v="nvim ."
alias mux="tmuxinator"

# Linting aliases (Requires: git)
# alias lint-rubocop="$(bundle exec rubocop -A $(git diff --name-only --diff-filter=AM | grep "\.rb$"))"

#Github aliases
alias gd="git status -s \
 | fzf --no-sort --reverse \
 --preview 'git diff --color=always {+2} | diff-so-fancy' \
 --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up \
 --preview-window=right:60%:wrap"

# export for brew
export LANG='en_US.UTF-8'

# export for GOLANG
export GOPATH=$HOME/Documents/go
export PATH="$GOPATH/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Default editor setter
export VISUAL=nvim
export EDITOR="$VISUAL" 

# Brew
eval $(/opt/homebrew/bin/brew shellenv)

export BUNDLER_USERNAME=$GITHUB_USERNAME
export BUNDLER_TOKEN=$GITHUB_ACCESS_TOKEN

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# thefuck
eval $(thefuck --alias)

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# export PATH="/usr/local/bin:$PATH"

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/Users/plaiytiziano/.gem/ruby/3.1.0/bin:$PATH"

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

function rebase() {
  current_branch=$(git rev-parse --abbrev-ref HEAD)

  git checkout "$1"
  git pull
  git checkout "$current_branch"
  git rebase "$1"
}

# Prompt
eval $(starship init zsh)

# Support option stacking (zsh docker plugin)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Spicetify
export PATH=$PATH:/Users/plaiytiziano/.spicetify
