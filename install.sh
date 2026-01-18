#!/usr/bin/env bash

DOT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)

source ${DOT_DIR}/deploy.sh

# Install TPM (Tmux Plugin Manager) on Ubuntu
if [[ "$(uname -s)" == "Linux" ]]; then
  TPM_DIR="${HOME}/.config/tmux/plugins/tpm"
  if [[ ! -d "${TPM_DIR}" ]]; then
    echo "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "${TPM_DIR}"
    echo ""
    echo "TPM installed successfully!"
    echo "To install tmux plugins, start tmux and press:"
    echo "  prefix + I (capital i)"
  else
    echo "TPM is already installed."
  fi
fi

# Install zimfw (Zim - Zsh IMproved)
ZIM_HOME="${HOME}/.config/zsh/.zim"
if [[ ! -d "${ZIM_HOME}" ]]; then
  echo "Installing zimfw..."
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
else
  echo "zimfw is already installed."
fi

# Install LazyVim
NVIM_CONFIG="${HOME}/.config/nvim"
LAZYVIM_MARKER="${NVIM_CONFIG}/lua/config/lazy.lua"
if [[ ! -f "${LAZYVIM_MARKER}" ]]; then
  echo "Installing LazyVim..."

  # Backup existing Neovim config if it exists
  if [[ -d "${NVIM_CONFIG}" ]]; then
    echo "Backing up existing Neovim config to ${NVIM_CONFIG}.bak..."
    mv "${NVIM_CONFIG}" "${NVIM_CONFIG}.bak"
  fi

  # Clone LazyVim starter template
  git clone https://github.com/LazyVim/starter "${NVIM_CONFIG}"

  # Remove .git directory from starter template
  rm -rf "${NVIM_CONFIG}/.git"

  # Deploy dotfiles config (this will symlink our custom config)
  source ${DOT_DIR}/deploy.sh

  echo "LazyVim installed successfully!"
  echo "Start Neovim to complete the installation:"
  echo "  nvim"
else
  echo "LazyVim is already installed."
fi

echo ""
echo "Installation Finished"
