#!/usr/bin/env bash
# 
# Script for setting up a new OSX machine
# 
# Apps not included due to no cask being available
#
# Notes:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.
#
# Usefull links:
#
# https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md
# https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716
#
# For appstore apps
# https://github.com/mas-cli/mas

# TODO NEEDD TO ADD DOCKER-COMPOSE-COMPLETION AND DOCKER-COMPLETION, VS CODE EXTENSIONS
# https://gist.github.com/mdschweda/2311e3f2c7062bf7367e44f8a7aa8b55 - vs code exts
# https://dotfiles.github.io

# Ask for password upfront and keep it alive until our script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 \"$$\" || exit; done 2>/dev/null & 


# Load environment variables
source $HOME/dotfiles/.dotfiles_env

# Start with the homebrew stuff
echo "\nStarting install of casks and packages"

# Check for Homebrew, install if we don't have it
if ! which brew; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

echo "\nStarting install of packages"
source $DOTFILES/.packages.sh

echo "Cleaning up..."
brew cleanup

echo "\nInstalling casks..."
source $DOTFILES/.casks.sh

echo "\nStarting install of fonts"
source $DOTFILES/.fonts.sh

echo "\nInstalling Python packages..."
sudo pip install ipython
sudo pip install virtualenv 
sudo pip install virtualenvwrapper

echo "\nInstalling Ruby gems"
sudo gem install bundler
sudo gem install filewatcher
sudo gem install cocoapods
sudo gem install rufo

echo "\nInstalling global npm packages..."
npm install marked -g

echo "\nConfiguring OSX..."
source $DOTFILES/.macos.sh

echo "\nStarting VS Code and extensions."
source $DOTFILES/.vscodeextensions

echo "\nInstalling terminal replacement - iTerm + zsh +oh my zsh"
source $DOTFILES/.zshsetup.sh
    
#echo "Installing Mac App Store apps"
#source $DOTFILES/.mas.sh

echo "\nSwitching shell to ZSH"
chsh -s /usr/local/bin/zsh

echo "Bootstrapping complete"
echo "==============================================================="
neofetch
