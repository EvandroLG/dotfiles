# general aliases
alias generate_ssh_key="ssh-keygen -t rsa -b 4096 -C 'evandrolgoncalves@gmail.com'"
alias ll="ls -lah"
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pipuninstallall="pip freeze | xargs pip uninstall -y"
alias mysql_local="mysql -u root -p"
alias npmclean='npm -g ls | grep -v "npm@" | awk "/@/ {print $2}" | awk -F@ "{print $1}" | xargs npm -g rm'
alias lua_install='sudo luarocks install'
alias uninstall_all_gems='for x in `gem list --no-versions`; do gem uninstall $x -a -x -I; done'
alias source_emcc="source ~/emsdk/emsdk_env.sh --build=Release"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

# default
export VISUAL=vim
export EDITOR="$VISUAL"

# settings for the new utf-8 terminal support in sierra
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# colors
export LSCOLORS='DxGxcxdxCxegedabagacad'
export PS1='\[\033[01;32m\]\u\[\033[01;31m\]\w\[\033[00m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\] ($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi) \[\033[01;96m\]($(~/.rvm/bin/rvm-prompt))\[\033[0m\] $ '

# postgres
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# mongodb
export PATH="$HOME/mongodb/bin:$PATH"

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# rvm
[ -z "$PS1" ] && return
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# perl
export PATH=/usr/local/pcre/bin:$PATH

# git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# heroku
PATH="/usr/local/heroku/bin:$PATH"

# react-native (android)
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# opevpn
export PATH=$(brew --prefix openvpn)/sbin:$PATH
