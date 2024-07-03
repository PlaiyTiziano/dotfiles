export VISUAL=nvim
export EDITOR="$VISUAL"

# Golang
export GOPATH=$HOME/Documents/go

# Ruby (rbenv)
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

add_to_path() {
    local dir="$1"
    if [[ ":$PATH:" != *":$dir:"* ]]; then
        export PATH="$dir:$PATH"
    fi
}

dirs_to_add=(
    "/usr/local/bin"
    "/usr/bin"
    "usr/sbin"
    "/sbin"
    "$HOME/.local/bin"

    # Dotfile scripts
    "$HOME/dotfiles/scripts/nipro"

    # PNPM
    "$HOME/Libaray/pnpm"

    # Golang
    "$GOPATH/bin"

    # Rust
    "$HOME/.cargo/bin"

    # Ruby
    "$HOME/.rbenv/shims"

    # Mint
    "$HOME/.mint/bin"
)

for dir in "${dirs_to_add[@]}"; do
    add_to_path "$dir"
done


# path+=/usr/local/bin
# path+=/usr/bin
# path+=/usr/sbin
# path+=/sbin
# path+="$HOME/.local/bin"
# path+="$HOME/.yarn/bin"

# path+=/opt/homebrew/opt/libpq/bin
# path+="$HOME/.local/share/bob/nvim-bin"

# Dotfile scripts
path+=$HOME/dotfiles/scripts/nipro

# pnpm (yarn equivalent)
# export PNPM_HOME="$HOME/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac

# path+="$GOPATH/bin"

# Rust
# path+="$HOME/.cargo/bin"

# Ruby
# path+="$HOME/.gem/ruby/3.3.3/bin"
# path+="$HOME/.rbenv/shims"

# path+="$HOME/.mint/bin"

# NephroFlow
export BUNDLER_USERNAME=$GITHUB_USERNAME
export BUNDLER_TOKEN=$GITHUB_ACCESS_TOKEN
