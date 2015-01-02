liases
alias sourceprofile="source ~/.bash_profile"
alias ll="ls -lah"
alias findfile="find | grep"
alias edithosts="vim /etc/hosts"
alias ..='cd ..'
alias apt-get='sudo apt-get'
alias dirsubl="/Users/evandro/Library/Application\ Support/Sublime\ Text\ 3/"

#/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

#postgres
alias psql="/Applications/Postgres93.app/Contents/MacOS/bin/psql"
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"

# python
alias pyclean='find . -name "*.pyc" -exec rm {} \;'
alias pipuninstallall="pip freeze | xargs pip uninstall -y"

# node
alias npmclean='npm -g ls | grep -v "npm@" | awk "/@/ {print $2}" | awk -F@ "{print $1}" | xargs npm -g rm'

# colors
export LSCOLORS='DxGxcxdxCxegedabagacad'
export PS1='\[\033[01;32m\]\u\[\033[01;31m\]\w\[\033[00m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\] ($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi) $ '

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source /usr/local/bin/virtualenvwrapper.sh

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
#export PATH
source /usr/local/bin/virtualenvwrapper.sh
