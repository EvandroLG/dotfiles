#!/bin/bash

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Fafacxdxbxegedabagacad
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$HOME/mongodb/bin:$PATH"
export PATH=/usr/local/pcre/bin:$PATH
export PATH=$(brew --prefix openvpn)/sbin:$PATH
export LC_ALL=en_US.UTF-8

GREEN=$(tput setaf 2);
YELLOW=$(tput setaf 3);
RESET=$(tput sgr0);

function git_branch {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

export PS1='${YELLOW}\w${GREEN}$(git_branch)${RESET} $ '
CDPATH=.:$HOME:$HOME/Projects:$HOME/Desktop

# aliases
alias ..="cd .."
alias ll="ls -lah"
alias source_emcc="source ~/emsdk/emsdk_env.sh --build=Release"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
alias generate_ssh_key="ssh-keygen -t rsa -b 4096 -C 'evandrolgoncalves@gmail.com'"

# npm aliases
alias npm_clean='npm -g ls | grep -v "npm@" | awk "/@/ {print $2}" | awk -F@ "{print $1}" | xargs npm -g rm'
alias npm_update="npm install -g npm"
alias npm_flush="rm -rf node_modules && npm i"

# bash completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
. "$(brew --prefix)/etc/bash_completion"
fi
