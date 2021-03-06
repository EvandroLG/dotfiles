#!/bin/bash

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$HOME/mongodb/bin:$PATH"
export PATH=/usr/local/pcre/bin:$PATH
export PATH=$(brew --prefix openvpn)/sbin:$PATH
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude node_modules'
export LC_ALL=en_US.UTF-8

GREEN=$(tput setaf 2);
YELLOW=$(tput setaf 3);
RESET=$(tput sgr0);

# Shows the current branch if in a git repository
function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/'
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
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source /usr/local/etc/bash_completion.d/git-completion.bash
