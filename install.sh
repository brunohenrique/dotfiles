git clone git@github.com:brunohenrique/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && git submodule update --init && cd vimfiles && git submodule update --init

mkdir -p ~/.vim/

ln -s ~/.dotfiles/vimfiles/autoload ~/.vim/
ln -s ~/.dotfiles/vimfiles/colors ~/.vim/
ln -s ~/.dotfiles/vimfiles/bundle ~/.vim/
ln -s ~/.dotfiles/vimfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vimfiles/vimrc.bundles ~/.vimrc.bundles
ln -s ~/.dotfiles/vimfiles/vimrc.after ~/.vimrc.after

ln -s ~/.dotfiles/.editorconfig ~/
ln -s ~/.dotfiles/.gemrc ~/
ln -s ~/.dotfiles/.gitconfig ~/
ln -s ~/.dotfiles/.tmux.conf ~/
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/irbrc ~/.irbrc
ln -s ~/.dotfiles/pryrc ~/.pryrc

vim +BundleInstall +qall

mkdir ~/.fonts

curl https://raw.github.com/Lokaltog/powerline/develop/font/PowerlineSymbols.otf > ~/.fonts/PowerlineSymbols.otf
fc-cache -vf ~/.fonts

mkdir -p ~/.config/fontconfig/conf.d/
curl https://raw.github.com/Lokaltog/powerline/develop/font/10-powerline-symbols.conf > ~/.config/fontconfig/conf.d/10-powerline-symbols.conf
