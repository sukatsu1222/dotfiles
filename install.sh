#!/usr/bin/env bash

DOT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)

source ${DOT_DIR}/deploy.sh

# Install TPM (Tmux Plugin Manager) on Ubuntu
if [[ "$(uname -s)" == "Linux" ]]; then
  TPM_DIR="${HOME}/.config/tmux/plugins/tpm"
  if [[ ! -d "${TPM_DIR}" ]]; then
    echo "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "${TPM_DIR}"
  else
    echo "TPM is already installed."
  fi
fi

# Install zimfw (Zim - Zsh IMproved)
ZIM_HOME="${HOME}/.config/zsh/.zim"
if [[ ! -d "${ZIM_HOME}" ]]; then
  echo "Installing zimfw..."
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | ZIM_HOME="${ZIM_HOME}" zsh
else
  echo "zimfw is already installed."
fi

echo ""
echo "Installation Finished"
