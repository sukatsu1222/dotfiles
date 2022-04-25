#zmodload zsh/zprof && zprof
#
# User configuration sourced by all invocations of the shell
#
setopt no_global_rcs

export LANG=en_US.UTF-8

export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state

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
  ${XDG_DATA_HOME}/zsh/Completions(N-/)
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
