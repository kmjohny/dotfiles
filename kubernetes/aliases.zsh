# ------------------------------------
# kubectl alias
# ------------------------------------

alias k="kubectl"

alias kd="kubectl describe"

alias kg="kubectl get"

alias kc="kubectl create"

alias kdel="kubectl delete"

alias ke="kubectl exec -it"

alias kdes="kubectl describe"

alias kl="kubectl logs"


# ------------------------------------
# kubectl function
# ------------------------------------
ksetns() {
  export CONTEXT=$(kubectl config view | grep current-context | awk '{print $2}')
  kubectl config set-context $CONTEXT --namespace=$1
}
