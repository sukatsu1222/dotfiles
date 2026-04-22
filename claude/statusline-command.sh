#!/usr/bin/env bash
# Claude Code status line command
# Displays: model, context usage, rate limits, current directory, git branch
# Each field is separated by | and colored with ANSI escape codes

input=$(cat)

# ANSI color codes (Dracula theme)
RESET='\033[0m'
GRAY='\033[38;2;98;114;164m'    # Separator color (Dracula Comment #6272a4)
CYAN='\033[38;2;189;147;249m'   # Model name (Dracula Purple #bd93f9)
YELLOW='\033[38;2;241;250;140m' # Context usage (Dracula Yellow #f1fa8c)
MAGENTA='\033[38;2;255;121;198m' # Rate limits (Dracula Pink #ff79c6)
GREEN='\033[38;2;80;250;123m'   # Current directory (Dracula Green #50fa7b)
ORANGE='\033[38;2;139;233;253m' # Git branch (Dracula Cyan #8be9fd)

SEP="${GRAY} | ${RESET}"

# Model display name
model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
model_part="${CYAN}${model}${RESET}"

# Context window usage percentage
ctx_used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$ctx_used" ]; then
  ctx_part="${YELLOW}Ctx:$(printf '%.0f' "$ctx_used")%${RESET}"
else
  ctx_part="${YELLOW}Ctx:--${RESET}"
fi

# Rate limits: 5-hour and 7-day
five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
rate_str=""
if [ -n "$five" ]; then
  rate_str="5h:$(printf '%.0f' "$five")%"
fi
if [ -n "$week" ]; then
  [ -n "$rate_str" ] && rate_str="${rate_str} "
  rate_str="${rate_str}7d:$(printf '%.0f' "$week")%"
fi
[ -n "$rate_str" ] && rate_part="${MAGENTA}${rate_str}${RESET}"

# Current directory (replace $HOME with ~)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // "?"')
cwd="${cwd/#$HOME/~}"
cwd_part="${GREEN}${cwd}${RESET}"

# Git branch name (hidden when not in a git repository)
branch=$(git -C "$(echo "$input" | jq -r '.workspace.current_dir // .cwd // "."')" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)
[ -n "$branch" ] && branch_part="${ORANGE}${branch}${RESET}"

# Assemble status line with colored separators
result="${model_part}${SEP}${ctx_part}"
[ -n "$rate_part" ] && result="${result}${SEP}${rate_part}"
result="${result}${SEP}${cwd_part}"
[ -n "$branch_part" ] && result="${result}${SEP}${branch_part}"

printf "%b" "$result"
