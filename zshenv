#zmodload zsh/zprof && zprof

setopt no_global_rcs

case $TERM in
  xterm* | screen* | linux*) LANGUAGE=en_US.UTF-8 ;;
  *) LANGUAGE=ja_JP.UTF-8 ;;
esac
export LANG=${LANGUAGE}

if [[ -z $TMUX ]] && [[ -e /usr/share/terminfo/x/xterm-256color ]]; then
  export TERM=xterm-256color
fi

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

typeset -U path fpath cdpath manpath

path=(
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /usr/bin(N-/)
  /usr/sbin(N-/)
  /bin(N-/)
  /sbin(N-/)
  $path
  ${HOME}/.local/bin(N-/)
  ${HOME}/bin(N-/)
)

# set pyenv and Python envirnment
if [ -d ${HOME}/.pyenv ]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi
if type pipenv >/dev/null 2>&1; then
  eval "$(pipenv --completion)"
  export PIPENV_VENV_IN_PROJECT=true
fi

# set goenv and Golang envirnment
if [ -d ${HOME}/.goenv ]; then
  export GOENV_ROOT="${HOME}/.goenv"
  export PATH="${GOENV_ROOT}/bin:${PATH}"
  eval "$(goenv init -)"
fi

if type go >/dev/null 2>&1; then
  export GOPATH=${HOME}/dev
  export PATH=${PATH}:${GOPATH}/bin
fi

fpath=(
  $fpath
  /usr/share/zsh/vendor-completions(N-/)
  ${HOME}/.local/share/zsh/Completions(N-/)
)

