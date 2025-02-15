#!/bin/bash

# Dotfiles setup script

# Detect OS
OS="$(uname -s)"
case "$OS" in
    Linux*)     PLATFORM="Linux" ;;
    Darwin*)    PLATFORM="Mac" ;;
    *)          PLATFORM="Unknown" ;;
esac

echo "Detected platform: $PLATFORM"

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# Create backup directory
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Function to safely create symlinks
link_file() {
    local src=$1
    local dst=$2
    
    # Check if source file exists
    if [ ! -e "$src" ]; then
        echo "⚠️  Source file $src does not exist - skipping"
        return 1
    fi
    
    # Backup existing file if it exists
    if [ -e "$dst" ]; then
        echo "🔧 Backing up $dst to $BACKUP_DIR"
        mv "$dst" "$BACKUP_DIR/"
    fi
    
    echo "🔗 Creating symlink: $dst -> $src"
    ln -sf "$src" "$dst"
}

# Main configurations
echo "📁 Setting up dotfiles..."
link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/emacs/.emacs.d" "$HOME/.emacs.d"
link_file "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
link_file "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

# Platform specific configurations
if [ "$PLATFORM" = "Mac" ]; then
    echo "🍎 Applying macOS specific configurations..."
    # Add any macOS specific configs here
elif [ "$PLATFORM" = "Linux" ]; then
    echo "🐧 Applying Linux specific configurations..."
    # Add any Linux specific configs here
fi

# Create config and local directories
echo "📂 Creating config directories..."
mkdir -p ~/.config
mkdir -p ~/.local/share

echo ""
echo "✅ Dotfiles setup complete!"
echo "   Backups stored in $BACKUP_DIR"
echo "   Please restart your terminal or source your shell config"
