#zmodload zsh/zprof && zprof
#
# User configuration sourced by all invocations of the shell
#

setopt no_global_rcs

export LANG=en_US.UTF-8

export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache

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
  /usr/share/zsh/vendor-completions(N-/)
  ${HOME}/.local/share/zsh/Completions(N-/)
  $fpath
)

if (( ${+commands[nvim]} )); then
  export EDITOR=nvim
elif (( ${+commands[vim]} )); then
  export EDITOR=vim
else
  export EDITOR=vi
fi
export VISUAL=${EDITOR}

#
# Python (pyenv and poetry)
#
if [[ -d ${HOME}/.pyenv ]]; then
  export PYENV_ROOT=${HOME}/.pyenv
fi
if [[ -n ${PYENV_ROOT} ]]; then
  path=(
    ${PYENV_ROOT}/bin(N-/)
    ${HOME}/.poetry/bin(N-/)
    $path
  )
  if (( ${+commands[pyenv]} )); then
    eval "$(pyenv init -)"
  fi
fi

#
# Golang
#
if (( ${+commands[brew]} )); then
  if [[ -d $(brew --prefix)/opt/go/libexec ]]; then
    export GOROOT=$(brew --prefix)/opt/go/libexec
  fi
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
NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [[ -d ${NVM_DIR} ]]; then
  export NVM_DIR
  if (( ${+commands[brew]} )); then
    [[ -s $(brew --prefix)/opt/nvm/nvm.sh ]] && source $(brew --prefix)/opt/nvm/nvm.sh
  fi
  [[ -s ${NVM_DIR}/nvm.sh ]] && source ${NVM_DIR}/nvm.sh
fi

# Define Zim location
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
