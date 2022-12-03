#!/usr/bin/env zsh

DOT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)

source ${DOT_DIR}/deploy.sh

if (( ${+commands[nvim]} )) && [[ ! -s ${HOME}/.local/share/nvim/site/autoload/plug.vim ]]; then
    curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim -es -u $HOME/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "q"
fi

echo ""
echo "Installation Finished"