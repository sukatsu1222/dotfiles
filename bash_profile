#
# ~/.bash_profile
#

if [ -f "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ]; then
    PATH="${PATH}:${HOME}/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/.local/bin" ]; then
    PATH="${PATH}:${HOME}/.local/bin"
fi

if type nvim >/dev/null 2>&1; then
  export EDITOR=nvim
elif type vim >/dev/null 2>&1; then
  export EDITOR=vim
else
  export EDITOR=vi
fi
export VISUAL=${EDITOR}
export GIT_EDITOR=${EDITOR}

# pyenv
if [ -d ${HOME}/.pyenv ]; then
  export PYENV_ROOT=${HOME}/.pyenv
  export PATH=${PYENV_ROOT}/bin:${PATH}
  eval "$(pyenv init -)"
fi

# Golang
if [ -d /usr/local/go ]; then
  export GOPATH=${HOME}/dev
  export PATH=${PATH}:/usr/local/go/bin:${GOPATH}/bin
fi

