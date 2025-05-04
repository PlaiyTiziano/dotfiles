export VISUAL=nvim
export EDITOR="$VISUAL"

# Golang
export GOPATH=$HOME/Documents/go


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
    "$HOME/.yarn/bin"

    "/opt/homebrew/opt/libpq/bin"

    # Dotfile scripts
    "$HOME/dotfiles/scripts/nipro"

    # PNPM
    "$HOME/Libaray/pnpm"

    # Golang
    "$GOPATH/bin"

    # Rust
    "$HOME/.cargo/bin"
)

for dir in "${dirs_to_add[@]}"; do
    add_to_path "$dir"
done

# Prioritize asdf shims
export PATH="$HOME/.asdf/shims:$PATH"

# NephroFlow
export BUNDLER_USERNAME=$GITHUB_USERNAME
export BUNDLER_TOKEN=$GITHUB_ACCESS_TOKEN
export NPM_TOKEN=$GITHUB_ACCESS_TOKEN
