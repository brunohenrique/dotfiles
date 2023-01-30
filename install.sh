#!/usr/bin/env bash

git clone git@github.com:brunohenrique/dotfiles.git ~/.dotfiles && cd ~/.dotfiles || exit

mkdir ~/.config
for package in */
do
  stow --verbose=2 "$package" --target="$HOME"
done

if [ -s ~/.vim/autoload/plug.vim ]; then
  echo "VimPlug already installed for Vim"
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ -s ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
  echo "Packer.nvim already installed for NeoVim"
else
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi


vim +PlugInstall +qall

echo "Installing Neovim plugins ..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
