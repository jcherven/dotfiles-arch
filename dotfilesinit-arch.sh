#!/bin/bash

set -e
pushd "$HOME"

# Symlinks for files that are located in ~/
# the arrays FILESLOCAL and FILESLINKED correspond by index order
FILESLOCAL=(
  "$HOME/.Xresources"
  "$HOME/.git-prompt.sh"
  "$HOME/.bash_profile"
  "$HOME/.bashrc"
  "$HOME/.bash_logout"
  "$HOME/.gitconfig"
  "$HOME/.tmux.conf"
)

FILESLINKED=(
  "$HOME/dotfiles-arch/Xresources"
  "$HOME/dotfiles-arch/git-prompt.sh"
  "$HOME/dotfiles-arch/bash_profile"
  "$HOME/dotfiles-arch/bashrc"
  "$HOME/dotfiles-arch/bash_logout"
  "$HOME/dotfiles-arch/gitconfig"
  "$HOME/dotfiles-arch/tmux.conf"
)

# Symlinks for directories that are located in ~/.config
# the arrays DIRSLOCAL and DIRSLINKED correspond by index order
DIRSLOCAL=(
  "$HOME/.config/ranger"
)

DIRSLINKED=(
  "$HOME/dotfiles/config/ranger"
)

# run the viminit script here maybe?
# source "./viminit.sh"

# ~/ dot file symlinks
# requires a c-style loop to access array index numbers
for ((i=0; i<${#FILESLOCAL[@]}; ++i)); do
  if [ -f "${FILESLOCAL[$i]}" ];
  then
    mv "${FILESLOCAL[$i]}" "${FILESLOCAL[$i]}.default"
  fi
  ln -s "${FILESLINKED[$i]}" "${FILESLOCAL[$i]}"
done

# ~/.config directory symlinks
for ((j=0; j<${#DIRSLOCAL[@]}; ++j)); do
  if [ -d "${DIRSLOCAL[$j]}" ]
  then
    mv "${DIRSLOCAL[$j]}" "${DIRSLOCAL[$j]}.default"
  fi
  ln -s "${DIRSLINKED[$j]}" "${DIRSLOCAL[$j]}"
done

# Allows swapping to a caps-ctrl keymap when using a non-HHKB keyboard with "sudo loadkeys jums-caps-swap.map" on systemd
MYKMPATH="$HOME/dotfiles-arch/keymaps"
CAPSWAPMAP="jums.map"
SYSKMPATH="/usr/share/kbd/keymaps/i386/qwerty"
sudo ln -s $MYKMPATH/$CAPSWAPMAP $SYSKEYMAPS/$CAPSWAPMAP

popd

echo "dotfileInit.sh has completed."

