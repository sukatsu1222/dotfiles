#!/usr/bin/env zsh

DOT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)

# Install zimfw
if [[ ! -e ${HOME}/.zim/zimfw.zsh ]]; then
  curl -Lo ${HOME}/.zim/zimfw.zsh --create-dirs https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

source ${DOT_DIR}/deploy.sh

source ${HOME}/.zim/zimfw.zsh install
