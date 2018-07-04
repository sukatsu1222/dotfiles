# zsh/c1_completions.zsh
autoload -Uz compinit && compinit -u
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' format '%B%F{white}Completing %d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %F{cyan}At %p: Hit TAB for more, or the character to insert%f
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %F{cyan}Scrolling active: current selection at %p%f
zstyle ':completion:*' verbose true
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin

bindkey "^i" menu-complete
