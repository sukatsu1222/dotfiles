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

# Node.js
NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [[ -d ${NVM_DIR} ]]; then
  export NVM_DIR
fi

# Define Zim location
ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
