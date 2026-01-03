#zmodload zsh/zprof && zprof
#
# User configuration sourced by all invocations of the shell
#
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# XDG Base Directory
export XDG_BIN_HOME="${HOME}/.local/bin"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

typeset -U path cdpath manpath fpath

if [[ -x "/opt/homebrew/bin/nvim" ]]; then
  export EDITOR="/opt/homebrew/bin/nvim"
elif [[ -x "/usr/local/bin/nvim" ]]; then
  export EDITOR="/usr/local/bin/nvim"
elif [[ -x "/usr/bin/nvim" ]]; then
  export EDITOR="/usr/bin/nvim"
elif (( $+commands[nvim] )); then
  export EDITOR="nvim"
elif (( $+commands[vim] )); then
  export EDITOR="vim"
else
  export EDITOR="vi"
fi
export VISUAL="${EDITOR}"

export skip_global_compinit=1
