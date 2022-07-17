#    __ _     _
#   / _(_)___| |__
#  | |_| / __| '_ \
#  |  _| \__ \ | | |
#  |_| |_|___/_| |_|
#

###############################################################################
###                              GENERAL                                    ###
###############################################################################
if status --is-interactive
and not set -q TMUX # https://github.com/fish-shell/fish-shell/issues/4434#issuecomment-332626369
    tmux new-session -A -s personal
end

set fish_theme nord
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx GPG_TTY (tty)
set -gx KUBE_EDITOR "nvim"
set -gx EDITOR "nvim"
set -gx GOPATH $HOME/Workspace/go
set -gx HOMEBREW_BUNDLE_FILE $HOME/.config/brew/Brewfile
set -gx FZF_DEFAULT_OPTS '
     --height 40%
     --layout=reverse
     --inline-info
     --color=fg:#e5e9f0,hl:#81a1c1
     --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
     --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
     --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

fish_add_path $HOME/.cargo/bin
fish_add_path $GOPATH/bin
fish_add_path $HOME/.krew/bin
fish_add_path /opt/local/bin
fish_add_path /opt/local/sbin

test -e ~/.dir_colors && eval (gdircolors --c-shell ~/.dir_colors)

###############################################################################
###                              ALIASES                                    ###
###############################################################################
alias tlarepl="java -cp /usr/local/lib/tla2tools.jar tlc2.REPL"

###############################################################################
###                              ERGONOMICS                                 ###
###############################################################################
function save_history --on-event fish_preexec
    history --save
    history --merge
end

function system_update
  fisher update
  brew bundle --cleanup -v
  nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  . ~/.config/fish/config.fish
end

# https://github.com/koekeishiya/skhd/issues/48
function who_stoped_skhd
  ioreg -l -w 0 \
          | perl -nle 'print $1 if /"kCGSSessionSecureInputPID"=(\d+)/' \
          | uniq \
          | xargs -I{} ps -p {} -o comm=
end
