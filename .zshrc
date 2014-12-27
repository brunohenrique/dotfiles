fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.scripts/git-completion.sh
source ~/.scripts/git-prompt.sh
source ~/.scripts/z.sh
source /etc/profile.d/rvm.sh

