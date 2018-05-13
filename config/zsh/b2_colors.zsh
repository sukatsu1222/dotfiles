# zsh/b2_colors.zsh
if [ -x /usr/bin/dircolors ]; then
  test -r ${HOME}/.dircolors && eval "$(dircolors -b ${HOME}/.dircolors)" || eval "$(dircolors -b)"
fi
