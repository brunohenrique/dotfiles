#!/bin/sh

git clone git@github.com:brunohenrique/dotfiles.git ~/.dotfiles && cd ~/.dotfiles

for package in $(ls -d */)
do
  echo "Instaling package: $package"
  $(stow $package)
done

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
