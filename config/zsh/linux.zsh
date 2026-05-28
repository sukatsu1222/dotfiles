# -----------------------------------------------------------------------------
# Linux-specific configuration
# -----------------------------------------------------------------------------

# Set unlimited stack size for AC Library (C++ competitive programming)
ulimit -s unlimited

# Auto-start tmux on login
# Attach to existing 'default' session if present (silent check to avoid
# racing with tmux-continuum auto-restore), otherwise create a new one.
if [[ -o login ]] && (( ${+commands[tmux]} )) && [[ -z "${TMUX}" ]]; then
  if tmux has-session -t default 2>/dev/null; then
    tmux attach -t default
  else
    tmux new -s default
  fi
fi
