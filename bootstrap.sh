#!/usr/bin/env bash

# Ask for administrator password upfront
sudo -v

# sudo keep-alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brewfile contents
brew bundle

# Configure macos defaults
./.macos

# Create vscode symbolic links
rm ~/Library/Application\ Support/Code/User/settings.json
rm ~/Library/Application\ Support/Code/User/keybindings.json
ln -s /Users/$USER/.config/vscode/settings.json /Users/$USER/Library/Application\ Support/Code/User/settings.json
ln -s /Users/$USER/.config/vscode/keybindings.json /Users/$USER/Library/Application\ Support/Code/User/keybindings.json

# Install vscode extensions
cat ~/.config/vscode/extensions.list | grep -v '^#' | xargs -L1 code --install-extension

# Switch shell to Homebrew zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Configure fnm
upgrade-node
fnm use latest
