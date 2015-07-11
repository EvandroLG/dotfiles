# aliases
alias sourceprofile="source ~/.bash_profile"
alias ll="ls -lah"
alias edithosts="vim /etc/hosts"
alias ..='cd ..'

# default
export VISUAL=vim
export EDITOR="$VISUAL"

# postgres
alias psql="/Applications/Postgres93.app/Contents/MacOS/bin/psql"
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"

# python
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pipuninstallall="pip freeze | xargs pip uninstall -y"

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# node
alias npmclean='npm -g ls | grep -v "npm@" | awk "/@/ {print $2}" | awk -F@ "{print $1}" | xargs npm -g rm'

# colors
export LSCOLORS='DxGxcxdxCxegedabagacad'
export PS1='\[\033[01;32m\]\u\[\033[01;31m\]\w\[\033[00m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\] ($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi) $ '

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#nginx
export PATH="/usr/local/nginx/sbin:$PATH"
alias nginx_stop="nginx -s stop"
alias nginx_start="nginx -c /usr/local/nginx/conf/nginx.conf"
