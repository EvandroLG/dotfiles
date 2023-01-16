#!/usr/bin/env fish

set -x VISUAL vim
set -x EDITOR $VISUAL
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude node_modules'
set CDPATH .:$HOME:$HOME/Projects:$HOME/Desktop
fish_add_path ~/.npm-global/bin
fish_add_path /opt/homebrew/bin/
set -x JAVA_HOME (/usr/libexec/java_home -v 1.7)
fish_add_path $HOME/.jenv/bin
#eval (jenv init - | source)

## colors
set -x TERM xterm-256color
set -x CLICOLOR 1
set -x LSCOLORS ExFxCxDxBxegedabagacad

## aliases
alias ll="ls -lah"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
alias cat="bat"
alias find="fd"
alias node_latest="sudo n latest"
alias npm_clean='npm -g ls | grep -v "npm@" | awk "/@/ {print $2}" | awk -F@ "{print $1}" | xargs npm -g rm'
alias npm_update="npm install -g npm"
alias npm_flush="rm -rf node_modules && npm i"

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"
