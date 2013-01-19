sudo apt-get -y update

# command line tools for transferring data with URL
sudo apt-get -y install curl wget

# install git
sudo apt-get -y install git-core

# install nodejs and npm
sudo apt-get -y install python-software-properties
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get -y update
#If you want to compile Node C++ modules:
sudo apt-get -y install nodejs-dev
sudo apt-get -y install nodejs npm

# install zsh
sudo apt-get -y install zsh

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
git clone git://github.com/sstephenson/rbenv.git .rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbnv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(rbenv init -)"' >> ~/.zshenv
echo 'source $HOME/.zshenv' >> ~/.zshrc
exec $SHELL

source ~/.bash_profile #reload
source ~/.bashrc #reload
source ~/.zshrc #reload


# install dependencies
sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev \
libyaml-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libmysqlclient-dev ruby-dev\
libxml2-dev autoconf libc6-dev libncurses5-dev automake libtool bison  \
subversion pkgconfig libmysqlclient-dev libpq-dev bison libxml2-dev libxslt1-dev zlib1g-dev

# install vim and gvim
sudo apt-get -y install vim vim-gnome

# install janus(Vim Distribution)
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
