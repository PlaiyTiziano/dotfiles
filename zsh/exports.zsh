export VISUAL=nvim
export EDITOR="$VISUAL"

path+=/usr/local/bin
path+=/usr/bin
path+=/usr/sbin
path+=/sbin
path+="$HOME/.local/bin"
path+="$HOME/.yarn/bin"

path+=/opt/homebrew/opt/libpq/bin
path+="$HOME/.local/share/bob/v0.9.0/nvim-macos/bin"

# Dotfile scripts
path+=$HOME/dotfiles/scripts/nipro

# pnpm (yarn equivalent)
export PNPM_HOME="/Users/plaiytiziano/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Golang
export GOPATH=$HOME/Documents/go
path+="$GOPATH/bin"

# Rust
path+="$HOME/.cargo/bin"

# Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
path+="$HOME/.gem/ruby/3.1.0/bin"
path+="$HOME/.rbenv/shims"

path+="$HOME/.mint/bin"

# NephroFlow
export BUNDLER_USERNAME=$GITHUB_USERNAME
export BUNDLER_TOKEN=$GITHUB_ACCESS_TOKEN
