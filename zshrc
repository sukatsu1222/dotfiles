[[ -s ${HOME}/.zsh.d/zshrc_zim ]] && source ${HOME}/.zsh.d/zshrc_zim

# Read other setting
case ${OSTYPE} in
  darwin*)
    [[ -s ${HOME}/.zsh.d/zshrc_macos ]] && source ${HOME}/.zsh.d/zshrc_macos
    ;;
  linux*)
    [[ -s ${HOME}/.zsh.d/zshrc_linux ]] && source ${HOME}/.zsh.d/zshrc_linux
    ;;
esac
[[ -s ${HOME}/.zsh.d/zshrc_common ]] && source ${HOME}/.zsh.d/zshrc_common


if (( ${+commands[zprof]} )); then
  zprof | less
fi
