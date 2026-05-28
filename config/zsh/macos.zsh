# -----------------------------------------------------------------------------
# macOS-specific configuration
# -----------------------------------------------------------------------------

# eza (modern ls replacement)
if (( ${+commands[eza]} )); then
  alias ls='eza --git'
  alias la='eza --git --all'
  alias ll='eza --git --long --header --git'
  alias lla='eza --git --long --header --git --all'
  alias lt='eza --git --tree --level=2'
  alias lta='eza --git --tree --level=2 --all'
else
  # Fallback to standard ls with color on macOS
  alias ls="ls -G"
fi

# bat (modern cat replacement)
if (( ${+commands[bat]} )); then
  alias cat='bat'
  alias bcat='bat --style=plain'          # no decorations
fi

# Quick access to iCloud Drive folder
alias icloud="cd ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs"

# Obsidian CLI
obsidian() {
  /Applications/Obsidian.app/Contents/MacOS/Obsidian "$@"
}
