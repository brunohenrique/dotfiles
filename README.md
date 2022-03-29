# My environment

## Features
1. [TEST](#test)

## Dependencies

 - [Alacritty](https://github.com/jwilm/alacritty)
 - [Bat](https://github.com/sharkdp/bat)
 - [FZF](https://github.com/junegunn/fzf)
 - [Fish Shell](https://fishshell.com/)
 - [GNU Stow](https://www.gnu.org/software/stow/)
 - [Git](https://git-scm.com/)
 - [Neovim](https://neovim.io/)
 - [Universal Ctags](https://github.com/universal-ctags/ctags)
 - [fd](https://github.com/sharkdp/fd)
 - [tmux](https://github.com/tmux/tmux)
 - [ShellCheck](https://www.shellcheck.net/)
 - [jq](https://stedolan.github.io/jq/)
 - [shfmt](https://github.com/mvdan/sh)
 - [LuaFormatter](https://github.com/Koihik/LuaFormatter)

## Install

```bash
$ git clone git@github.com:brunohenrique/dotfiles.git
$ cd dotfiles/
$ ./install.sh
```

## Terminal bindings

* `Ctrl-a` - Move to the start of the line.
* `Ctrl-e` - Move to the end of the line.
* `Ctrl-b` - Move back one character.
* `Alt-b` - Move back one word.
* `Ctrl-f` - Move forward one character.
* `Alt-f` - Move forward one word.
* `Ctrl-u` - Delete from the cursor to the beginning of the line.
* `Ctrl-k` - Delete from the cursor to the end of the line.
* `Ctrl-w` - Delete from the cursor to the start of the word.
* `Esc-Del` - Delete previous word (may not work, instead try Esc
  followed by Backspace)
* `Ctrl-y` - Pastes text from the clipboard.
* `Ctrl-l` - Clear the screen leaving the current line at the top of the
  screen.
* `Ctrl-x` - Ctrl-u  Undo the last changes.'Ctrl-_ does the same
* `Alt-r` - Undo all changes to the line.
* `Alt-Ctrl-e` - Expand command line.
* `Ctrl-r` - Incremental reverse search of history.
* `Alt-p` - Non-incremental reverse search of history.
* `!!` - Execute last command in history
* `!abc` - Execute last command in history beginning with abc
* `!abc:p` - Print last command in history beginning with abc
* `!n` - Execute nth command in history
* `!$` - Last argument of last command
* `!^` - First argument of last command
* `!*` - All arguments of last command
* `!:[number]` - The [number] argument of last command
* `^abc^xyz` - Replace first occurrence of abc with xyz in last command
  and execute it
* `cd -` - Go to previous directory
