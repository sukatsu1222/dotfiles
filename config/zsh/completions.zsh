# -----------------------------------------------------------------------------
# Zsh completions configuration
# -----------------------------------------------------------------------------

# Create completions directory if it doesn't exist
ZCOMPLETIONS=${HOME}/.local/share/zsh/completions
[[ ! -d ${ZCOMPLETIONS} ]] && mkdir -p ${ZCOMPLETIONS}

# kubectl
if (( ${+commands[kubectl]} )) && [[ ! -f ${ZCOMPLETIONS}/_kubectl ]]; then
  kubectl completion zsh > ${ZCOMPLETIONS}/_kubectl
fi

# helm
if (( ${+commands[helm]} )) && [[ ! -f ${ZCOMPLETIONS}/_helm ]]; then
  helm completion zsh > ${ZCOMPLETIONS}/_helm
fi

# kind
if (( ${+commands[kind]} )) && [[ ! -f ${ZCOMPLETIONS}/_kind ]]; then
  kind completion zsh > ${ZCOMPLETIONS}/_kind
fi

# kustomize
if (( ${+commands[kustomize]} )) && [[ ! -f ${ZCOMPLETIONS}/_kustomize ]]; then
  kustomize completion zsh > ${ZCOMPLETIONS}/_kustomize
fi

# mise
if (( ${+commands[mise]} )) && [[ ! -f ${ZCOMPLETIONS}/_mise ]]; then
  mise completion zsh > ${ZCOMPLETIONS}/_mise
fi

fpath=(${ZCOMPLETIONS} $fpath)
