sudo apt-get update

# command line tools for transferring data with URL
sudo apt-get install curl wget

# install git
sudo apt-get install git-core

# install nodejs and npm
sudo apt-get install nodejs npm

# install zsh
sudo apt-get install zsh

# install oh-my-zsh framework
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
#wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

# Set zsh as your default shell
chsh -s /bin/zsh

# install rvm
curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.bash_profile #reload
source ~/.bashrc #reload
source ~/.zshrc #reload

# install rbenv
# git clone git://github.com/sstephenson/rbenv.git .rbenv
# git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
# echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv
# echo 'eval "$(rbenv init -)"' >> ~/.zshenv
# echo 'source $HOME/.zshenv' >> ~/.zshrc
# exec $SHELL

# install dependencias
sudo apt-get install build-essential openssl libreadline6 libreadline6-dev \
libyaml-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 \
libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison  \
subversion pkgconfig libmysqlclient-dev libpq-dev

# install vim and gvim
sudo apt-get install vim-gnome

# install janus
curl -Lo- https://bit.ly/janus-bootstrap | bash

mkdir -p ~/.vim/colors
# cp files/themes/vim/Tomorrow-Night.vim ~/.vim/colors/Tomorrow-Night.vim
curl https://raw.github.com/brunohenrique/myEnv/master/files/themes/vim/Tomorrow-Night.vim >> ~/.vim/colors/Tomorrow-Night.vim


# cp files/gemrc ~/.gemrc
curl https://raw.github.com/brunohenrique/myEnv/master/files/gemrc >> ~/.gemrc


# cp files/gitconfig ~/.gitconfig
curl https://raw.github.com/brunohenrique/myEnv/master/files/gitconfig >> ~/.gitconfig


# cp files/gitignore ~/.gitignore
curl https://raw.github.com/brunohenrique/myEnv/master/files/gitignore >> ~/.gitignore


# cp files/gvimrc.after ~/.gvimrc.after
curl https://raw.github.com/brunohenrique/myEnv/master/files/gvimrc.after >> ~/.gvimrc.after


# cp files/vimrc.before ~/.gvimrc.before
curl https://raw.github.com/brunohenrique/myEnv/master/files/vimrc.before >> ~/.vimrc.before
