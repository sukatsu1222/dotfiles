# -----------------------------------------------------------------------------
# macOS-specific configuration
# -----------------------------------------------------------------------------

# Quick access to iCloud Drive folder
alias icloud="cd ${HOME}/Library/Mobile\ Documents/com~apple~CloudDocs"

# Obsidian CLI
obsidian() {
  /Applications/Obsidian.app/Contents/MacOS/Obsidian "$@"
}
