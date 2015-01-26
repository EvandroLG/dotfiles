#!/bin/bash

YELLOW="\033[1;33m"
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

function vim_install() {
  echo -e "Installing ${YELLOW}vim${NC} plugins...\n"

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
  unamestr=`uname`

  if [[ "$unamestr" == "Darwin" ]]; then
    echo -e "Downloading ${YELLOW}.bash_profile${NC}...\n"
    curl -o ~/.bash_profile https://raw.githubusercontent.com/EvandroLG/dotfiles/master/.bash_profile
    echo -e "My ${YELLOW}.bash_profile${NC} is updated!"
  elif [[ "$unamestr" == "Linux"  ]]; then
    echo -e "Downloading ${YELLOW}.bashrc${NC}...\n"
    curl -o ~/.bashrc https://raw.githubusercontent.com/EvandroLG/dotfiles/master/.bashrc
    echo -e "My ${YELLOW}.bashrc${NC} is updated!"
  fi
}

vim_install
git_install
profile_update
