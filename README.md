# Dotfiles

My personal dotfiles repository with configurations for:
- Zsh (.zshrc)
- Emacs (.emacs.d)
- Vim (.vimrc)
- Git (.gitconfig)
- Tmux (.tmux.conf)

## Features

- Cross-platform support (macOS and Linux)
- Automatic OS detection
- Backup of existing dotfiles
- Missing file detection with warnings
- Platform-specific configurations
- Easy setup with a single command

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/andrewzweb/dotfiles.git ~/.dotfiles
   ```

2. Run the setup script:
   ```bash
   bash ~/.dotfiles/scripts/setup.sh
   ```

3. Restart your shell or source the new configuration:
   ```bash
   source ~/.zshrc  # or source ~/.bashrc
   ```

## Platform Support

### macOS
- Proper font and keybindings setup
- System clipboard integration
- Fullscreen toggle support
- PATH environment setup

### Linux
- Standard Linux configurations
- X11 clipboard support
- Native Linux keybindings

## Structure

- `zsh/` - Zsh configuration files
- `emacs/` - Emacs configuration
- `scripts/` - Setup and utility scripts
  - `setup.sh` - Main installation script

## Maintenance

- To update:
  ```bash
  cd ~/.dotfiles && git pull
  ```

- To add new configurations:
  1. Add files to appropriate directory
  2. Update setup.sh to create symlinks
  3. Commit and push changes

## Troubleshooting

If you encounter issues:
1. Check the backup directory created during setup
2. Review the setup script output for warnings
3. Ensure your platform is supported (macOS or Linux)
4. Check file permissions and symlinks
