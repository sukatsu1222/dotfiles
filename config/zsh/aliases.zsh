# -----------------------------------------------------------------------------
# Aliases configuration
# -----------------------------------------------------------------------------

# Always create parent directories when using mkdir
alias mkdir='mkdir -p'

# Docker command aliases (only if docker is installed)
if (( ${+commands[docker]} )); then
  # Basic docker command
  alias dk='docker'

  # Container management
  alias dkc='docker container'
  alias dkcl='docker container ls -a'                                           # List all containers
  alias dkcr='docker container run --rm'                                        # Run container and remove after exit
  alias dkcR='docker container run --rm --publish-all --interactive --tty'      # Run interactive container with all ports published
  alias dkclogs='docker container logs'
  alias dkcin='docker container inspect'
  alias dkcrm='docker container rm'

  # Image management
  alias dki='docker image'
  alias dkil='docker image ls -a'                                               # List all images
  alias dkip='docker image pull'
  alias dkib='docker image build'
  alias dkiin='docker image inspect'
  alias dkirm='docker image rm'

  # Network management
  alias dkn='docker network'
  alias dknl='docker network ls'
  alias dknin='docker network inspect'
  alias dknrm='docker network rm'

  # Volume management
  alias dkv='docker volume'
  alias dkvl='docker volume ls'
  alias dkvin='docker volume inspect'
  alias dkvrm='docker volume rm'

  # Docker Compose
  alias dcomp='docker compose'
  alias dcompup='docker compose up --detach'                                    # Start services in detached mode
fi

# Kubernetes command aliases (only if kubectl is installed)
if (( ${+commands[kubectl]} )); then
  alias k='kubectl'
  
  # Get commands
  alias kg='kubectl get'
  alias kgpo='kubectl get pods'
  alias kgpoa='kubectl get pods --all-namespaces'
  alias kgpow='kubectl get pods --watch'
  alias kgd='kubectl get deployments'
  alias kgs='kubectl get services'
  alias kgn='kubectl get nodes'
  alias kgns='kubectl get namespaces'
  alias kgi='kubectl get ingress'
  alias kgcm='kubectl get configmaps'
  alias kgsec='kubectl get secrets'
  
  # Describe commands
  alias kd='kubectl describe'
  alias kdpo='kubectl describe pod'
  alias kdd='kubectl describe deployment'
  alias kds='kubectl describe service'
  alias kdn='kubectl describe node'
  
  # Delete commands
  alias kdel='kubectl delete'
  alias kdelpo='kubectl delete pod'
  alias kdeld='kubectl delete deployment'
  alias kdels='kubectl delete service'
  
  # Logs commands
  alias kl='kubectl logs'
  alias klf='kubectl logs -f'
  alias klp='kubectl logs -p'
  
  # Apply/Create commands
  alias ka='kubectl apply -f'
  alias kc='kubectl create'
  alias kcf='kubectl create -f'
  
  # Edit commands
  alias ke='kubectl edit'
  alias kepo='kubectl edit pod'
  alias ked='kubectl edit deployment'
  alias kes='kubectl edit service'
  
  # Exec commands
  alias kex='kubectl exec -it'
  alias keti='kubectl exec -it'
  
  # Context and namespace
  alias kctx='kubectl config current-context'
  alias kctxs='kubectl config get-contexts'
  alias kctxu='kubectl config use-context'
  alias kns='kubectl config set-context --current --namespace'
  
  # Port forward
  alias kpf='kubectl port-forward'
  
  # Top commands
  alias ktop='kubectl top'
  alias ktopn='kubectl top nodes'
  alias ktoppo='kubectl top pods'
  
  # Rollout commands
  alias kro='kubectl rollout'
  alias kros='kubectl rollout status'
  alias kror='kubectl rollout restart'
  alias krou='kubectl rollout undo'
  alias kroh='kubectl rollout history'
fi

# Neovim command alias (only if nvim is installed)
if (( ${+commands[nvim]} )); then
  alias nv='nvim'
fi

# mise command aliases
if (( ${+commands[mise]} )); then
  alias mi='mise'
  alias mii='mise install'        # Install tool versions
  alias miu='mise use'            # Set tool version for project
  alias mil='mise ls'             # List installed tools
  alias mir='mise run'            # Run tasks defined in mise configuration
fi

# -----------------------------------------------------------------------------
# ghq + fzf integration
# -----------------------------------------------------------------------------

# ghq + fzf: cd to repository
if (( ${+commands[ghq]} )) && (( ${+commands[fzf]} )); then
  # Change directory to a repository managed by ghq
  ghq-cd() {
    local repo=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.md 2>/dev/null || eza --tree --level=1 --icons $(ghq root)/{}")
    if [[ -n $repo ]]; then
      cd $(ghq root)/$repo
    fi
  }
  alias gc='ghq-cd'

  # Open repository in editor
  ghq-open() {
    local repo=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.md 2>/dev/null || eza --tree --level=1 --icons $(ghq root)/{}")
    if [[ -n $repo ]]; then
      cd $(ghq root)/$repo
      ${EDITOR:-nvim} .
    fi
  }
  alias ge='ghq-open'
fi

# -----------------------------------------------------------------------------
# Git + fzf integration
# -----------------------------------------------------------------------------

if (( ${+commands[git]} )) && (( ${+commands[fzf]} )); then
  # Checkout git branch (including remote branches)
  git-checkout-branch() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
             fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  }
  alias gcb='git-checkout-branch'

  # View git log with fzf
  git-log-fzf() {
    git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
  }
  alias glog='git-log-fzf'

  # Interactive git add
  git-add-fzf() {
    local files
    files=$(git status --short | fzf --multi --preview 'git diff --color=always {2}' | awk '{print $2}')
    if [[ -n $files ]]; then
      echo $files | xargs git add
      git status --short
    fi
  }
  alias gadd='git-add-fzf'
fi

# -----------------------------------------------------------------------------
# Kubernetes + fzf integration
# -----------------------------------------------------------------------------

if (( ${+commands[kubectl]} )) && (( ${+commands[fzf]} )); then
  # Select pod and get logs
  klog() {
    local pod
    pod=$(kubectl get pods --all-namespaces -o wide | fzf --header-lines=1 | awk '{print "-n " $1 " " $2}')
    if [[ -n $pod ]]; then
      kubectl logs $pod ${@}
    fi
  }

  # Select pod and exec into it
  kexec() {
    local pod
    pod=$(kubectl get pods --all-namespaces -o wide | fzf --header-lines=1 | awk '{print "-n " $1 " " $2}')
    if [[ -n $pod ]]; then
      kubectl exec -it $pod -- ${@:-sh}
    fi
  }

  # Select pod and describe it
  kdesc() {
    local pod
    pod=$(kubectl get pods --all-namespaces -o wide | fzf --header-lines=1 | awk '{print "-n " $1 " " $2}')
    if [[ -n $pod ]]; then
      kubectl describe pod $pod
    fi
  }

  # Select pod and delete it
  kdelpod() {
    local pods
    pods=$(kubectl get pods --all-namespaces -o wide | fzf --header-lines=1 --multi | awk '{print "-n " $1 " " $2}')
    if [[ -n $pods ]]; then
      echo $pods | xargs -L 1 kubectl delete pod
    fi
  }

  # Select context
  kctxf() {
    local context
    context=$(kubectl config get-contexts -o name | fzf)
    if [[ -n $context ]]; then
      kubectl config use-context $context
    fi
  }

  # Select namespace
  knsf() {
    local namespace
    namespace=$(kubectl get namespaces -o name | sed 's/namespace\///' | fzf)
    if [[ -n $namespace ]]; then
      kubectl config set-context --current --namespace=$namespace
      echo "Switched to namespace: $namespace"
    fi
  }
fi

# -----------------------------------------------------------------------------
# fzf utilities
# -----------------------------------------------------------------------------

if (( ${+commands[fzf]} )); then
  # Kill process with fzf
  fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if [[ -n $pid ]]; then
      echo $pid | xargs kill -${1:-9}
    fi
  }

  # Search command history with fzf (Ctrl+R is default, this is for manual use)
  alias hist='history | fzf --tac --no-sort'
fi
