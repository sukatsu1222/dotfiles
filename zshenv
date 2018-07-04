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

export PAGER=less
export LESS='-R -i -M -X -F'
export LESSCHARSET='utf-8'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)    # Start blinking
export LESS_TERMCAP_md=$(tput bold; tput setaf 5)    # Start bold mode
export LESS_TERMCAP_me=$(tput sgr0)                  # End all mode like so, us, mb, md, and mr
export LESS_TERMCAP_so=$(tput setab 7; tput setaf 0) # Start standout mode
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)       # End standout mode
export LESS_TERMCAP_us=$(tput setaf 2)               # Start underlining
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)       # End underlining

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

# pyenv
if [ -d ${HOME}/.pyenv ]; then
  export PYENV_ROOT=${HOME}/.pyenv
  export PATH=${PYENV_ROOT}/bin/:${PATH}
  eval "$(pyenv init -)"
fi

# Golang
if [ -d /usr/local/go ]; then
  export GOPATH=${HOME}/dev
  export PATH=${PATH}:/usr/local/go/bin:${GOPATH}/bin
fi

fpath=(
  $fpath
  /usr/share/zsh/vendor-completions(N-/)
  ${HOME}/.local/share/zsh/Completions(N-/)
)

