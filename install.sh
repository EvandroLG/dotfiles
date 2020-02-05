#!/bin/bash

set -e

cd $HOME
mkdir -p Projects/

if [[ $(command -v brew) == "" ]]; then
  echo "Installing Brew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

fi

echo "Updating Brew..."
brew install wget ren fzf htop bash-completion the_silver_searcher node neovim ngrok

wget https://raw.githubusercontent.com/EvandroLG/dotfiles/master/git/.gitconfig
wget https://raw.githubusercontent.com/EvandroLG/dotfiles/master/git/.gitignore
wget https://raw.githubusercontent.com/EvandroLG/dotfiles/master/.bash_profile

echo "Setting up nvim..."
mkdir -p .config/nvim
wget https://raw.githubusercontent.com/EvandroLG/dotfiles/master/nvim/init.vim -P .config/nvim
wget https://raw.githubusercontent.com/EvandroLG/dotfiles/master/nvim/coc-settings.json -P .config/nvim
vim +PlugInstall +qall

# Based on https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# Decreases the delay repetition on keyboard
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
