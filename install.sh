#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

export PATH="$HOME/.local/share/arch-install/bin:$PATH"
ARCH_INSTALL=~/.local/share/arch-install/install

catch_errors() {
  echo -e "\n\e[31mInstallation failed!\e[0m"
}

trap catch_errors ERR

source $ARCH_INSTALL/terminal.sh

source $ARCH_INSTALL/dotfiles.sh
