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

# Python
if [[ -d ${HOME}/.pyenv ]]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  path=(
    ${PYENV_ROOT}/bin(N-/)
    $path
  )
  eval "$(pyenv init --path)"
fi
