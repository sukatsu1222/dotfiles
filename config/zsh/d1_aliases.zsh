# zsh/d1_aliases.zsh
alias ls='ls --color=auto --group-directories-first -X'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -Fhl'
alias la='ls -A'
alias lla='ls -AFhl'

alias mkdir='mkdir -p'

alias nv='nvim'

alias gst='git status'
alias gad='git add'
alias gco='git commit'

alias d='docker'
alias dils='docker image ls'
alias dcrun='docker container run --rm -P'
alias dcit='docker container run --rm -i -t -P'
alias dcps='docker contailner ps -a'
alias dcompose='docker-compose'

function mdcd() { mkdir -p "$@" && eval cd "\"\$$#\""; }

