# -----------------------------------------------------------------------------
# macOS-specific configuration
# -----------------------------------------------------------------------------

# eza (modern ls replacement)
if (( ${+commands[eza]} )); then
  alias ls='eza --icons --git'
  alias la='eza --icons --git --all'
  alias ll='eza --icons --git --long --header --git'
  alias lla='eza --icons --git --long --header --git --all'
  alias lt='eza --icons --git --tree --level=2'
  alias lta='eza --icons --git --tree --level=2 --all'
else
  # Fallback to standard ls with color on macOS
  alias ls="ls -G"
fi

# bat (modern cat replacement)
if (( ${+commands[bat]} )); then
  alias cat='bat --style=auto'
  alias bcat='bat --style=plain'  # Plain output without decorations
fi

# Quick access to iCloud Drive folder
alias icloud="cd ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs"
