# Path to your oh-my-zsh installation.
export ZSH=/Users/plaiytiziano/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes for themes
# ZSH_THEME="spaceship"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# config aliases
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/"
alias tmuxconfig="nvim ~/.tmux.conf"
alias hyperconfig="nvim ~/.hyper.js"

# snippet aliases
alias jssnippets="nvim ~/.config/nvim/ultisnips/javascript.snippets"
alias rubysnippets="nvim ~/.config/nvim/ultisnips/ruby.snippets"

# convenience aliases
alias cat="bat"
alias v="nvim ."
alias mux="tmuxinator"

# Linting aliases (Requires: git)
# alias lint-rubocop=$(bundle exec rubocop $(git diff --name-only | grep "\.rb$"))

#Github aliases
alias gs="git status"
alias ga="git add ."
alias gp="git push"
alias gmt="git commit"
alias gc="git checkout"
alias gcn="git checkout -b"
alias gcl="git clone"
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

# export for ruby
# export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
# export PATH="/Users/plaiytiziano/.gem/ruby/3.0.0/bin:$PATH"

# Default editor setter
export VISUAL=nvim
export EDITOR="$VISUAL" 

# Brew
eval $(/opt/homebrew/bin/brew shellenv)

# export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"
# export PATH="/Users/plaiytiziano/.gem/ruby/3.1.0/bin:$PATH"
# export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export BUNDLER_USERNAME="PlaiyTiziano"
export BUNDLER_TOKEN="<SECRET_TOKEN>"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# thefuck
eval $(thefuck --alias)

# export PATH="/usr/local/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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
