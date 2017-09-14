# Autocompletion for kubernetes-helm, a tool for managing Kubernetes charts
#

if [ $commands[helm] ]; then
  source <(helm completion zsh)
fi
