alias nvim="nvim --listen /tmp/$(tmux display-message -p '#S-#{window_index}-#I')"
alias cat="bat"
alias lg="lazygit"

TERMINAL="alacritty"
TERMINAL_CONFIG_FILE="alacritty.yml"
alias termconfig="nvim $HOME/dotfiles/$TERMINAL/$TERMINAL_CONFIG_FILE"

alias zshconfig="nvim $HOME/dotfiles/zsh/.zshrc"
alias nvimconfig="nvim $HOME/dotfiles/nvim/"
alias tmuxconfig="nvim $HOME/dotfiles/tmux/.tmux.conf"
alias gitconfig="nvim $HOME/dotfiles/git/.gitconfig"

alias gs="git status"
alias gd="git status -s \
 | fzf --no-sort --reverse \
 --preview 'git diff --color=always {+2} | diff-so-fancy' \
 --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up \
 --preview-window=right:60%:wrap"
