source ${HOME}/.zsh.d/zim.zsh

# Read other setting
case ${OSTYPE} in
  darwin*)
    [[ -s ${HOME}/.zsh.d/macos.zsh ]] && source ${HOME}/.zsh.d/macos.zsh
    ;;
  linux*)
    [[ -s ${HOME}/.zsh.d/linux.zsh ]] && source ${HOME}/.zsh.d/linux.zsh
    ;;
esac
[[ -s ${HOME}/.zsh.d/common.zsh ]] && source ${HOME}/.zsh.d/common.zsh


if (( ${+commands[zprof]} )); then
  zprof | less
fi
