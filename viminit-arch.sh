#!/bin/bash

set -e

# Install curl
sudo pacman -S --noconfirm curl

# install vim and neovim

# Install vim-plug
VIMPLUGURL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# Vanilla Vim
curl -fLo "~/.vim/autoload/plug.vim" --create-dirs $VIMPLUGURL

# NeoVim
curl -fLo "~/.local/share/nvim/site/autoload/plug.vim" --create-dirs $VIMPLUGURL

# Symlink ~/.vimrc to dotfiles
ln -s "$HOME/dotfiles-arch/config/nvim/init.vim" "$HOME/.vimrc"

# run nvim headless and run PlugInstall, then quit
nvim --headless +PlugInstall +qa
