# -----------------------------------------------------------------------------
# Linux-specific configuration
# -----------------------------------------------------------------------------

# Set unlimited stack size for AC Library (C++ competitive programming)
ulimit -s unlimited

# Auto-start tmux on login
# Attach to existing 'default' session or create a new one
if [[ -o login ]] && (( ${+commands[tmux]} )) && [[ -z "${TMUX}" ]]; then
  tmux attach -t default || tmux new -s default
fi
