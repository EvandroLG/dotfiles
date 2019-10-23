alias generate_ssh_key="ssh-keygen -t rsa -b 4096 -C 'evandrolgoncalves@gmail.com'"
alias ll="ls -lah"
alias npmclean='npm -g ls | grep -v "npm@" | awk "/@/ {print $2}" | awk -F@ "{print $1}" | xargs npm -g rm'
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
export PS1='\[\033[01;32m\]\w\[\033[00m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\] ($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi) '

# mongodb
export PATH="$HOME/mongodb/bin:$PATH"

# perl
export PATH=/usr/local/pcre/bin:$PATH

# opevpn
export PATH=$(brew --prefix openvpn)/sbin:$PATH
