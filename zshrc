#
# User configuration sourced by interactive shells
#

# Starting tmux
if (( ${+commands[tmux]} )); then
  if [[ -z $TMUX ]] && [[ ${TERM_PROGRAM} != "vscode" ]]; then
    if $(tmux has-session 2> /dev/null); then
      tmux list-sessions
      echo -n "Tmux: attach? (Y/n/num) "
      read
      if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
        exec tmux -2 attach-session
      elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
        exec tmux -2 attach-session -t "$REPLY"
      elif [[ "$REPLY" =~ ^[Nn]$ ]]; then
        exec tmux -2 new-session
      fi
    else
      exec tmux -2 new-session
    fi
  fi
fi

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

case ${OSTYPE} in
  darwin*)
    [[ -s ${HOME}/.zshrc.macos ]] && source ${HOME}/.zshrc.macos
    ;;
  linux*)
    [[ -s ${HOME}/.zshrc.linux ]] && source ${HOME}/.zshrc.linux
    ;;
esac
[[ -s ${HOME}/.zshrc.common ]] && source ${HOME}/.zshrc.common

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export TMUX_ZSHRC="tmux zshrc"
if (( ${+commands[zprof]} )); then
  zprof | less
fi

