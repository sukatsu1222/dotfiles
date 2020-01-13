#zmodload zsh/zprof && zprof
#
# User configuration sourced by all invocations of the shell
#

setopt no_global_rcs

case $TERM in
  xterm* | screen* | linux*) LANGUAGE=en_US.UTF-8 ;;
  *) LANGUAGE=ja_JP.UTF-8
esac
export LANG=${LANGUAGE}

export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache

if type nvim >/dev/null 2>&1; then
  export EDITOR=nvim
elif type vim >/dev/null 2>&1; then
  export EDITOR=vim
else
  export EDITOR=vi
fi
export VISUAL=${EDITOR}

typeset -U path fpath cdpath manpath

path=(
  ${HOME}/.local/bin(N-/)
  /usr/local/sbin(N-/)
  /usr/local/bin(N-/)
  /usr/sbin(N-/)
  /usr/bin(N-/)
  /sbin(N-/)
  /bin(N-/)
  $path
)

fpath=(
  $fpath
  /usr/share/zsh/vendor-completions(N-/)
  ${HOME}/.local/share/zsh/Completions(N-/)
)

#
# Python (pyenv and poetry)
#
export PYENV_ROOT=${HOME}/.pyenv
path=(
  ${PYENV_ROOT}/bin(N-/)
  ${HOME}/.poetry/bin(N-/)
  $path
)
if (( ${+commands[pyenv]} )); then
  eval "$(pyenv init -)"
fi

#
# Golang
#
if [[ -d $(brew --prefix)/opt/go/libexec ]]; then
  export GOROOT=$(brew --prefix)/opt/go/libexec
elif [[ -d /usr/local/go ]]; then
  export GOROOT=/usr/local/go
fi
if [[ -n ${GOROOT} ]]; then
  export GOPATH=${HOME}/dev
  path=(
    ${GOPATH}/bin(N-/)
    ${GOROOT}/bin(N-/)
    $path
  )
fi

#
# Node.js
#
export NVM_DIR=${HOME}/.nvm
[[ -s $(brew --prefix)/opt/nvm/nvm.sh ]] && source $(brew --prefix)/opt/nvm/nvm.sh
[[ -s ${NVM_DIR}/nvm.sh ]] && ${NVM_DIR}/nvm.sh

# Define Zim location
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

