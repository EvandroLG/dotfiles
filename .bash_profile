# aliases
alias source_profile="source ~/.bash_profile"
alias source_tmux="tmux source-file .tmux.conf"
alias ll="ls -lah"
alias edit_hosts="vim /etc/hosts"
alias ..='cd ..'
alias vim_plugin_install="vim +PluginInstall +qall"

# default
export VISUAL=vim
export EDITOR="$VISUAL"

# colors
export LSCOLORS='DxGxcxdxCxegedabagacad'
export PS1='\[\033[01;32m\]\u\[\033[01;31m\]\w\[\033[00m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\] ($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi) $ '

# postgres
alias psql="/Applications/Postgres93.app/Contents/MacOS/bin/psql"
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

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# perl
export PATH=/usr/local/pcre/bin:$PATH

# git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# heroku
PATH="/usr/local/heroku/bin:$PATH"
