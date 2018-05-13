#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Read aliases file, if existing
[[ -f ${HOME}/.bash_aliases ]] && source ${HOME}/.bash_aliases

case $TERM in
  xterm* | screen* | linux*) LANGUAGE=en_US.UTF-8 ;;
  *) LANGUAGE=ja_JP.UTF-8 ;;
esac
export LANG=${LANGUAGE}
export LC_ALL=${LANGUAGE}

# Set dircolors
if type dircolors >/dev/null 2>&1; then
  test -r ${HOME}/.dircolors && eval "$(dircolors -b ${HOME}/.dircolors)" || eval "$(dircolors -b)"
fi
