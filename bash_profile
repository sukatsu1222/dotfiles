#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

case $TERM in
  xterm* | screen* | linux*) export LANGUAGE=en_US.UTF-8 ;;
  *) export LANGUAGE=ja_JP.UTF-8 ;;
esac
export LANG=${LANGUAGE}

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache

if type nvim >/dev/null 2>&1; then
  export EDITOR=nvim
elif type vim >/dev/null 2>&1; then
  export EDITOR=vim
else
  export EDITOR=vi
fi
export VISUAL=$EDITOR
export GIT_EGITOR=$EDITOR

# pyenv
export PYENV_ROOT=${HOME}/.pyenv
export PATH=${PYENV_ROOT}/bin:${PATH}
if type pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Golang
export GOPATH=$HOME/dev
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

