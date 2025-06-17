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

# Install oh-my-zsh and plugins
install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "📦 Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        
        echo "📦 Installing zsh plugins..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        git clone https://github.com/Powerlevel9k/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
        
        echo "✅ oh-my-zsh and plugins installed"
    else
        echo "✅ oh-my-zsh already installed"
    fi
}

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

# Install oh-my-zsh and plugins
install_oh_my_zsh

# Main configurations
echo "📁 Setting up dotfiles..."
# Configure zsh plugins in .zshrc
if [ -f "$DOTFILES_DIR/zsh/.zshrc" ]; then
    echo "⚙️  Configuring zsh plugins..."
    sed -i.bak 's/^plugins=(.*)/plugins=(git zsh-syntax-highlighting)/' "$DOTFILES_DIR/zsh/.zshrc"
    sed -i.bak 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel9k\/powerlevel9k"/' "$DOTFILES_DIR/zsh/.zshrc"
fi

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
