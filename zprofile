# Golang
if (( ${+commands[brew]} )); then
  if [[ -d /usr/local/opt/go/libexec ]]; then
    export GOROOT=/usr/local/opt/go/libexec
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


# Node.js
NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [[ -d ${NVM_DIR} ]]; then
  export NVM_DIR
fi

# Python
if (( ${+commands[pyenv]} )); then
  eval "$(pyenv init --path)"
elif [[ -d ${HOME}/.pyenv ]]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi
