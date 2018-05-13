# zsh/b1_history.zsh
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "^[[B" history-beginning-search-forward-end
