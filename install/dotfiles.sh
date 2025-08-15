#!/bin/bash

DOTFILES_REPOSITORY="${DOTFILES_REPOSITORY:-raeffs/dotfiles}"
DOTFILES_URL="https://github.com/${DOTFILES_REPOSITORY}.git"

sudo pacman -S --noconfirm --needed stow

echo -e "\nCloning from: ${DOTFILES_URL}"
rm -rf ~/.local/share/dotfiles/
git clone "${DOTFILES_URL}" ~/.local/share/dotfiles >/dev/null

rm ~/.bash_profile
rm ~/.bashrc
make -C ~/.local/share/dotfiles
