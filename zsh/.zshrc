export GPG_TTY=$(tty)
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export GOPATH"=$HOME/Workspace/go"
export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=$HOME/code/go
export PATH="$PATH:$GOPATH/bin"
export PATH="/usr/local/sbin:$PATH"

export PURE_PROMPT_SYMBOL=∑
export PURE_PROMPT_VICMD_SYMBOL=∫
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export ZPLUG_HOME=/usr/local/opt/zplug

source ~/.zsh/history.zsh
source $ZPLUG_HOME/init.zsh

zplug "agkozak/zsh-z"
zplug "chriskempson/base16-shell", use:scripts/base16-ocean.sh, as:theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

zplug load

# Enable vim mode
bindkey -v
# Enable reverse search
#bindkey '^R' history-incremental-search-backward

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
