#!/bin/bash

ARCH_INSTALL_REPOSITORY="${ARCH_INSTALL_REPOSITORY:-raeffs/arch-install}"
ARCH_INSTALL_URL="https://github.com/${ARCH_INSTALL_REPOSITORY}.git"

clear
sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning from: ${ARCH_INSTALL_URL}"
rm -rf ~/.local/share/arch-install/
git clone "${ARCH_INSTALL_URL}" ~/.local/share/arch-install >/dev/null

# Use custom branch if instructed
if [[ -n "$ARCH_INSTALL_REF" ]]; then
  echo -e "\eUsing branch: $ARCH_INSTALL_REF"
  cd ~/.local/share/arch-install
  git fetch origin "${ARCH_INSTALL_REF}" && git checkout "${ARCH_INSTALL_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/arch-install/install.sh
