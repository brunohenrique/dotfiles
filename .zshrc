fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.scripts/git-completion.sh
source ~/.zsh/pure.zsh
source ~/.scripts/git-prompt.sh
source ~/.scripts/z.sh
source /etc/profile.d/rvm.sh

