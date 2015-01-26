#!/bin/bash

RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

function vim_install() {
  echo -e "Installing ${GREEN}vim${NC} plugins...\n"

  # install janus
  curl -Lo- https://bit.ly/janus-bootstrap | bash

  # install my favorites plugins
  if [ ! -d ~/.vim/autoload ]; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
          curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    git clone https://github.com/walm/jshint.vim ~/.vim/bundle/jshint.vim
  fi

  # update ~/.vimrc
  if [ ! -f ~/.vimrc ]; then
    curl -o ~/.vimrc https://raw.githubusercontent.com/EvandroLG/dotfiles/master/vim/.vimrc
  fi

  echo -e "\n${GREEN}vim${NC} plugins were installed!"
}

function git_install() {
  echo -e "\nInstalling ${GREEN}git${NC}"
}

vim_install

