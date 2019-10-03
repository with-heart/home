#!/usr/bin/env bash

# Ask for administrator password upfront
sudo -v

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brewfile contents
brew bundle

# Configure macos defaults
./.macos

