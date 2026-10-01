#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Linking dotfiles from $DOTFILES_DIR..."

# Ensure target directories exist
mkdir -p "$HOME/.config"

# Symlink configs back to $HOME
ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/config/starship.toml" "$HOME/.config/starship.toml"
ln -sfn "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"

echo "Installing Homebrew bundle packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

echo "Setup complete! Reload your shell with: source ~/.zshrc"
