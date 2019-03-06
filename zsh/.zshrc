autoload -Uz compinit && compinit
autoload -U colors && colors

export GPG_TTY=$(tty)
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source ~/.zsh/base16-ocean-dark.zsh
source ~/.scripts/git-prompt.sh
source ~/.scripts/z.sh
source ~/.zsh/pure.zsh

[[ -s /etc/profile.d/rvm.sh ]] && source /etc/profile.d/rvm.sh
[[ -s /root/.gvm/scripts/gvm ]] && source /root/.gvm/scripts/gvm


export GOPATH=$HOME/Workspace/side-projects/go
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$GOPATH/bin"
