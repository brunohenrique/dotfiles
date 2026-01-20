#    __ _     _
#   / _(_)___| |__
#  | |_| / __| '_ \
#  |  _| \__ \ | | |
#  |_| |_|___/_| |_|
#

###############################################################################
###                              GENERAL                                    ###
###############################################################################
eval (/opt/homebrew/bin/brew shellenv)
if status --is-interactive
and not set -q TMUX # https://github.com/fish-shell/fish-shell/issues/4434#issuecomment-332626369
    tmux new-session -A -s dotfiles -c ~/.dotfiles
end

atuin init fish --disable-up-arrow | source
starship init fish | source
zoxide init fish | source

set fish_theme nord
set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx EDITOR "nvim"
set -gx GPG_TTY (tty)
set -gx KUBE_EDITOR $EDITOR
set -gx GOPATH $HOME/Workspace/go
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml
set -gx HOMEBREW_BUNDLE_FILE $HOME/.config/brew/Brewfile
set -gx NBRC_PATH $HOME/.config/nb/nbrc
set -gx CPPFLAGS "-I/opt/homebrew/opt/curl/include"
set -gx LDFLAGS "-L/opt/homebrew/opt/curl/lib"
set -gx FZF_DEFAULT_OPTS '
     --height 40%
     --layout=reverse
     --inline-info
     --color=fg:#e5e9f0,hl:#81a1c1
     --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
     --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
     --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

fish_add_path $GOPATH/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/bin
fish_add_path /opt/homebrew/opt/curl/bin
fish_add_path /opt/local/bin
fish_add_path /opt/local/sbin
fish_add_path /usr/local/sbin

# test -e ~/.dir_colors && eval (gdircolors --c-shell ~/.dir_colors)
#
# ###############################################################################
# ###                              ALIASES                                    ###
# ###############################################################################

# ###############################################################################
# ###                              ERGONOMICS                                 ###
# ###############################################################################
function save_history --on-event fish_preexec
    history --save
    history --merge
end

function system_update
  brew bundle --cleanup -v
  . ~/.config/fish/config.fish
end
