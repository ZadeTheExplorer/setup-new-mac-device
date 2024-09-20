#!/bin/bash

# Detect architecture (Intel or ARM)
ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ]; then
    HOMEBREW_PREFIX="/opt/homebrew"
    SHELL_PROFILE="$HOME/.zprofile"
else
    HOMEBREW_PREFIX="/usr/local"
    SHELL_PROFILE="$HOME/.bash_profile"
fi

# Install Homebrew if not installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH
    echo 'eval "$('"$HOMEBREW_PREFIX"'/bin/brew shellenv)"' >> "$SHELL_PROFILE"
    eval "$("$HOMEBREW_PREFIX"/bin/brew shellenv)"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install Python 3
echo "Installing Git..."
brew install git

# Install Python 3
echo "Installing Python 3..."
brew install python

# Install Node.js
echo "Installing Node.js..."
brew install node

echo "Installing Zed - light weight text editor..."
brew install --cask zed

# Install Docker Desktop
echo "Installing Docker Desktop..."
brew install --cask docker

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
brew install --cask visual-studio-code

# Install Spotify
echo "Installing Spotify..."
brew install --cask spotify

# Install Pycharm
echo "Installing Pycharm..."
brew install --cask pycharm


echo "Installation completed. Please restart your terminal or source your profile to update the PATH."
