# aliases
alias source_profile="source ~/.bash_profile"
alias source_tmux="tmux source-file ~/.tmux.conf"
alias ll="ls -lah"
alias edit_hosts="vim /etc/hosts"
alias ..='cd ..'
alias vim_plugin_install="vim +PluginInstall +qall"

# alias nutrebem
alias heroku_production="heroku vim --app nutrebem-production"
alias heroku_staging="heroku vim --app nutrebem-staging"

# default
export VISUAL=vim
export EDITOR="$VISUAL"

# colors
export LSCOLORS='DxGxcxdxCxegedabagacad'
export PS1='\[\033[01;32m\]\u\[\033[01;31m\]\w\[\033[00m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\] ($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi) \[\033[01;96m\]($(~/.rvm/bin/rvm-prompt))\[\033[0m\] $ '

# postgres
alias psql="/Applications/Postgres.app/Contents/Versions/9.6/bin/psql"
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"

# mongodb
export PATH="$HOME/mongodb/bin:$PATH"

# python
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pipuninstallall="pip freeze | xargs pip uninstall -y"

# virtualenv
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh

# node
alias npmclean='npm -g ls | grep -v "npm@" | awk "/@/ {print $2}" | awk -F@ "{print $1}" | xargs npm -g rm'

# lua
alias lua_install='sudo luarocks install'

# rvm
[ -z "$PS1" ] && return

# perl
export PATH=/usr/local/pcre/bin:$PATH

# git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# heroku
PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
