if [[ -x "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

path=(
  ${HOME}/.local/bin(N-/)
  $path
)

export PATH
