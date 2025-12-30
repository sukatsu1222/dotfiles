#zmodload zsh/zprof && zprof
#
# User configuration sourced by all invocations of the shell
#
export LANG=en_US.UTF-8

export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state

export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

# Ensure paths are unique
typeset -U path cdpath manpath

# Set PATH
path=(
  ${HOME}/.local/bin(N-/)
  /opt/homebrew/bin(N-/)
  $path
)

if (( ${+commands[nvim]} )); then
  export EDITOR=nvim
elif (( ${+commands[vim]} )); then
  export EDITOR=vim
else
  export EDITOR=vi
fi
export VISUAL=${EDITOR}

export skip_global_compinit=1
