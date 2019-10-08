#!/bin/bash

set -e
pushd "$HOME"

# $FILESLOCAL and $FILESLINKED must map by index correctly
FILESLOCAL=(
	"$HOME/.git-prompt.sh"
	"$HOME/.bashrc"
	"$HOME/.bash_logout"
	"$HOME/.bash_profile"
	"$HOME/.vimrc"
	"$HOME/.gitconfig"
	"$HOME/.lynxrc"
	"$HOME/.lynx_bookmarks.html"
	"$HOME/.tmux.conf"
)

FILESLINKED=(
	"$HOME/dotfiles-arch/git-prompt.sh"
	"$HOME/dotfiles-arch/bashrc"
	"$HOME/dotfiles-arch/bash_logout"
	"$HOME/dotfiles-arch/bash_profile"
	"$HOME/dotfiles-arch/vimrc"
	"$HOME/dotfiles-arch/gitconfig"
	"$HOME/dotfiles-arch/lynxrc"
	"$HOME/dotfiles-arch/lynx_bookmarks.html"
	"$HOME/dotfiles-arch/tmux.conf"
)

# ~/ dot file symlinks
for ((i=0; i<${#FILESLOCAL[@]}; ++i)); do
	if [ -f "${FILESLOCAL[$i]}" ];
	then
		mv "${FILESLOCAL[$i]}" "${DIRSLOCAL[$i]}.default"
	fi
	ln -s "${FILESLINKED[$i]}" "${FILESLOCAL[$i]}"
done

# ~/.config dir symlinks

# Allows swapping to a caps-ctrl keymap when using a non-HHKB keyboard with "sudo loadkeys jums-caps-swap.map" on systemd
MYKMPATH="$HOME/dotfiles-arch/keymaps"
CAPSWAPMAP="jums.map"
SYSKMPATH="/usr/share/kbd/keymaps/i386/qwerty"
sudo ln -s $MYKMPATH/$CAPSWAPMAP $SYSKEYMAPS/$CAPSWAPMAP

