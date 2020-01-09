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

export PYENV_ROOT=${HOME}/.pyenv
export NVM_DIR=${HOME}/.nvm
export GOPATH=${HOME}/dev
if [[ -d /usr/local/opt/go ]]; then
  export GOROOT=/usr/local/opt/go/libexec
elif [[ -d /usr/local/go ]]; then
  export GOROOT=/usr/local/go
fi

typeset -U path fpath cdpath manpath

path=(
  ${GOROOT}/bin(N-/)
  ${GOPATH}/bin(N-/)
  ${PYENV_ROOT}/bin(N-/)
  ${HOME}/.poetry/bin(N-/)
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

if (( ${+commands[pyenv]} )); then
  eval "$(pyenv init -)"
fi

# Define Zim location
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

