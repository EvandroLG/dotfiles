#!/bin/bash

YELLOW="\033[1;33m"
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

PLATAFORM=`uname`

function vim_install() {
  echo -e "Installing ${YELLOW}vim${NC} plugins...\n"

  curl -Lo- https://bit.ly/janus-bootstrap | bash

  if [ ! -d ~/.vim/autoload ]; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
          curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    git clone https://github.com/walm/jshint.vim ~/.vim/bundle/jshint.vim
  fi

  echo -e "Updating my ${GREEN}.vimrc${NC}\n"
  curl -o ~/.vimrc https://raw.githubusercontent.com/EvandroLG/dotfiles/master/vim/.vimrc

  echo -e "\n${YELLOW}vim${NC} plugins were installed!"
}

function git_install() {
  echo -e "\nUpdating my ${YELLOW}git${NC} files...\n"

  if type git > /dev/null; then
    curl -o ~/.gitconfig https://raw.githubusercontent.com/EvandroLG/dotfiles/master/git/.gitconfig
    curl -o ~/.gitignore https://raw.githubusercontent.com/EvandroLG/dotfiles/master/git/.gitignore

    echo -e "\n${YELLOW}git${NC} files were updated!\n"
    echo -e "Downloading ${YELLOW}git-completion${NC}..."

    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
  else
      echo -e "${YELLOW}git${NC} is not installed!"
  fi
}

function profile_update() {
  if [[ "$PLATAFORM" == "Darwin" ]]; then
    echo -e "Downloading ${YELLOW}.bash_profile${NC}...\n"
    curl -o ~/.bash_profile https://raw.githubusercontent.com/EvandroLG/dotfiles/master/.bash_profile
    echo -e "\nMy ${YELLOW}.bash_profile${NC} is updated!"
  elif [[ "$PLATAFORM" == "Linux"  ]]; then
    echo -e "Downloading ${YELLOW}.bashrc${NC}...\n"
    curl -o ~/.bashrc https://raw.githubusercontent.com/EvandroLG/dotfiles/master/.bashrc
    echo -e "\nMy ${YELLOW}.bashrc${NC} is updated!"
  fi
}

function install_node() {
  if ! type node > /dev/null; then
    echo -e "Installing ${YELLOW}node${NC}...\n"

    git clone git://github.com/ry/node.git
    ./node/configure && make && sudo make install

    echo -e "${YELLOW}node${NC} was installed!"
  fi
}

function install_nginx() {
  curl http://nginx.org/download/nginx-1.6.0.tar.gz -o ~/nginx-1.6.0.tar.gz
  tar xvf ~/nginx-1.6.0.tar.gz && cd ~/nginx-1.6.0/
  sh ./configure --with-cc-opt="-Wno-deprecated-declarations" --with-http_ssl_module
  make && make install
}

vim_install
git_install
profile_update
install_node
nginx
