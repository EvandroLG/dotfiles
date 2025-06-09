#!/usr/bin/env bash

set -e

# ---------------------------
# Homebrew & Base Tools
# ---------------------------

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

brew install \
  ghostty \
  google-chrome --cask \
  docker --cask \
  fish \
  node \
  go \
  rustup-init \
  python \
  ruby \
  lua \
  openjdk \
  bat \
  fd \
  wget \
  aicommits

brew install --cask docker

# ---------------------------
# Java setup
# ---------------------------
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home /Library/Java/JavaVirtualMachines/openjdk-17.jdk

# ---------------------------
# Ghostty Config
# ---------------------------
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
curl -o ~/Library/Application\ Support/com.mitchellh.ghostty/config \
  https://raw.githubusercontent.com/EvandroLG/dotfiles/master/ghostty/config

# ---------------------------
# Fish Config & Plugins
# ---------------------------
mkdir -p ~/.config/fish/functions
curl -o ~/.config/fish/config.fish https://raw.githubusercontent.com/EvandroLG/dotfiles/master/fish/config.fish

# Fish functions
for f in docker_clean git_checkout git_sync gpr reload; do
  curl -o ~/.config/fish/functions/$f.fish https://raw.githubusercontent.com/EvandroLG/dotfiles/master/fish/functions/$f.fish
done

# Install fisher and plugins
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install dracula/fish
fisher install edc/bass
fish -c 'fish_config theme choose "Dracula Official"'

# ---------------------------
# SSH Setup
# ---------------------------
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519 -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh-keyscan github.com >> ~/.ssh/known_hosts

# ---------------------------
# Neovim Setup
# ---------------------------
brew install neovim
mkdir -p ~/.config/nvim
curl -o ~/.config/nvim/init.vim https://raw.githubusercontent.com/EvandroLG/dotfiles/master/nvim/init.vim
curl -o ~/.config/nvim/coc-settings.json https://raw.githubusercontent.com/EvandroLG/dotfiles/master/nvim/coc-settings.json

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Neovim plugins
nvim +PlugInstall +qall

# ---------------------------
# Claude Code CLI
# ---------------------------
npm install -g @anthropic-ai/claude-code

# ---------------------------
# Prompt for API Keys
# ---------------------------
read -p "Enter your OpenAI API key: " OPENAI_API_KEY
read -p "Enter your Anthropic API key: " ANTHROPIC_API_KEY

echo "set -x OPENAI_API_KEY $OPENAI_API_KEY" >> ~/.config/fish/config.fish
echo "set -x ANTHROPIC_API_KEY $ANTHROPIC_API_KEY" >> ~/.config/fish/config.fish

# ---------------------------
echo "✅ Setup complete! Restart your terminal or run 'exec fish' to apply changes."
echo "🔑 Remember to add your new SSH key to GitHub:"
echo "    pbcopy < ~/.ssh/id_ed25519.pub"
