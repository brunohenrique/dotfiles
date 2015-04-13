fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.scripts/git-completion.sh
source ~/.zsh/pure.zsh
source ~/.scripts/git-prompt.sh
source ~/.scripts/z.sh

[[ -s /etc/profile.d/rvm.sh ]] && source /etc/profile.d/rvm.sh
[[ -s /root/.gvm/scripts/gvm ]] && source /root/.gvm/scripts/gvm

