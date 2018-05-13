umask 022
limit coredumpsize 0

# Use emacs keybindings
bindkey -e

# Word chars (without /)
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

ZSH_CONFIG=${HOME}/.config/zsh
for f in ${ZSH_CONFIG}/*.zsh; do
  source $f
done

if type zprof >/dev/null 2>&1; then
  zprof | less
fi
