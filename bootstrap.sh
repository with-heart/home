#!/usr/bin/env bash

# Ask for administrator password upfront
sudo -v

# sudo keep-alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install xcode developer tools
xcode-select --install
sudo xcodebuild -license accept

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brewfile contents
brew bundle

# Configure macos defaults
./.macos

# install rust
rustup-init

# install rvm and ruby
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Switch shell to Homebrew zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Configure fnm
fnm install latest
fnm use latest

# Install various things that aren't in homebrew

# git-branchless (https://github.com/arxanas/git-branchless)
cargo install git-branchless
