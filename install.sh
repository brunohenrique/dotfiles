#!/bin/sh

git clone git@github.com:brunohenrique/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
git submodule update --init

function create_links {
  directory=$(pwd)

  if [ "${1}" == "vimfiles/" ]; then
    ln -s ~/.dotfiles/vimfiles/autoload ~/.vim/
    cd vimfiles/
    directory=$(pwd)
  fi

  for file_name in $(ls -d .[a-z]*)
  do
    if [ "$file_name" == ".git" ]; then
      echo "Cannot link $file_name"
      continue
    fi

    if [ -s ~/$file_name ]; then
      echo "File: $file_name already exist in: ~/$file_name"
    else
      echo "CREATING A SYMBOLIC LINK TO: $file_name"
      ln -s $directory/$file_name ~/
    fi
  done
}

create_links
mkdir -p ~/.vim/
create_links vimfiles/


if [ -s ~/.vim/autoload/plug.vim ]; then
  echo "VimPlug already installed"
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


vim +PlugInstall +qall

git clone git@github.com:powerline/fonts.git ~/fonts
cd ~/fonts && ./install.sh
rm -r ~/fonts

source ~/.zshrc
