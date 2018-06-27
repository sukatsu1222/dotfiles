#
# ~/.bash_aliases
#
alias sudo='sudo '

alias ls='ls --color=auto --group-directories-first -X'
alias ll='ls -Fhl'
alias la='ls -A'
alias lla='ls -AFhl'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias mkdir='mkdir -p'

if type nvim >/dev/null 2>&1; then
  alias nv='nvim'
elif type vim >/dev/null 2>&1; then
  alias vi='vim'
fi

function mdcd() { mkdir -p "$@" && eval cd "\"\$$#\""; }

