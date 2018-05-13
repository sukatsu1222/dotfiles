# zsh/z2_sources.zsh
if type kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

if type minikube >/dev/null 2>&1; then
  source <(minikube completion zsh)
fi
