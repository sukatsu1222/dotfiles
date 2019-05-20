#zmodload zsh/zprof && zprof

setopt no_global_rcs

case $TERM in
  xterm* | screen* | linux*) LANGUAGE=en_US.UTF-8 ;;
  *) LANGUAGE=ja_JP.UTF-8 ;;
esac
export LANG=${LANGUAGE}

if [[ -z ${TMUX} ]] && [[ -e /usr/share/terminfo/x/xterm-256color ]]; then
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
export VISUAL=${EDITOR}
export PYENV_ROOT=${HOME}/.pyenv
export NVM_DIR="${HOME}/.nvm"
export GOPATH=${HOME}/dev
if [[ -d /usr/local/opt/go ]]; then
  export GOROOT=/usr/local/opt/go/libexec
elif [[ -d /usr/local/go ]]; then
  export GOROOT=/usr/local/go
fi

# set pyenv and Python envirnment
if (( ${+commands[pyenv]} )); then
  eval "$(pyenv init - --no-rehash)"
fi

[[ -s "/usr/local/opt/nvm/nvm.sh" ]] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[[ -s "${NVM_DIR}/nvm.sh" ]] && . "${NVM_DIR}/nvm.sh"  # This loads nvm

typeset -U path fpath cdpath manpath

path=(
  ${PYENV_ROOT}/bin(N-/)
  ${PYENV_ROOT}/shims(N-/)
  ${GOROOT}/bin(N-/)
  ${GOPATH}/bin(N-/)
  ${HOME}/.local/bin(N-/)
  ${HOME}/bin(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /usr/bin(N-/)
  /usr/sbin(N-/)
  /bin(N-/)
  /sbin(N-/)
  $path
)

fpath=(
  $fpath
  /usr/share/zsh/vendor-completions(N-/)
  ${HOME}/.local/share/zsh/Completions(N-/)
)

