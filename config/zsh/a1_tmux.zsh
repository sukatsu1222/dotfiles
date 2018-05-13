# zsh/a1_tmux.zsh
if type tmux >/dev/null 2>&1; then
  if [ -z $TMUX ]; then
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
