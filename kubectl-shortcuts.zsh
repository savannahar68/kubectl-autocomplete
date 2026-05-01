[[ -n "${__KUBECTL_SHORTCUTS_ZSH_LOADED:-}" ]] && return
export __KUBECTL_SHORTCUTS_ZSH_LOADED=1

alias k='kubectl'
alias kgp='kubectl get pods'
alias kgpw='kubectl get pods -o wide'
alias kgpa='kubectl get pods --all-namespaces'
alias kgn='kubectl get namespaces'
alias kgd='kubectl get deployments'
alias kgss='kubectl get statefulsets'
alias kgsvc='kubectl get services'
alias kgno='kubectl get nodes'
alias kdp='kubectl describe pod'
alias kdd='kubectl describe deployment'
alias kdss='kubectl describe statefulset'
alias kdsvc='kubectl describe service'
alias kdno='kubectl describe node'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias klp='kubectl logs -p'
alias kex='kubectl exec -it'
alias ksh='kubectl exec -it'
alias kscale='kubectl scale'
alias kscaled='kubectl scale deployment'
alias kscaless='kubectl scale statefulset'
alias kdel='kubectl delete'
alias kdelp='kubectl delete pod'
alias kdeld='kubectl delete deployment'
alias ka='kubectl apply -f'
alias kc='kubectl create -f'
alias kctx='kubectl config current-context'
alias kns='kubectl config set-context --current --namespace'
alias kwp='watch kubectl get pods'
alias kwd='watch kubectl get deployments'
alias kwss='watch kubectl get statefulsets'
alias kpf='kubectl port-forward'
alias ktop='kubectl top'
alias ktopn='kubectl top nodes'
alias ktopp='kubectl top pods'
alias kgpn='kubectl get pods -n'
alias kln='kubectl logs -n'
alias kexn='kubectl exec -n'
alias kdn='kubectl describe -n'

fpath=("${HOME}/.zsh/completions" $fpath)
autoload -Uz compinit
compinit -C -d "${ZDOTDIR:-$HOME}/.zcompdump"

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

if whence -w _k8s_aliases >/dev/null 2>&1; then
  compdef _k8s_aliases kgp kgpw kgpa kgn kgd kgss kgsvc kgno
  compdef _k8s_aliases kdp kdd kdss kdsvc kdno
  compdef _k8s_aliases kl klf klp
  compdef _k8s_aliases kex ksh
  compdef _k8s_aliases kscale kscaled kscaless
  compdef _k8s_aliases kdel kdelp kdeld
  compdef _k8s_aliases ka kc
  compdef _k8s_aliases kpf ktop ktopn ktopp
  compdef _k8s_aliases kgpn kln kexn kdn
else
  compdef _kubectl kgp kgpw kgpa kgn kgd kgss kgsvc kgno
  compdef _kubectl kdp kdd kdss kdsvc kdno
  compdef _kubectl kl klf klp
  compdef _kubectl kex ksh
  compdef _kubectl kscale kscaled kscaless
  compdef _kubectl kdel kdelp kdeld
  compdef _kubectl ka kc
  compdef _kubectl kpf ktop ktopn ktopp
  compdef _kubectl kgpn kln kexn kdn
fi
