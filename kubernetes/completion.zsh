# Initilize kubectl completion for zsh.
# Check for kubectl
if test $(which kubectl)
then
  source <(kubectl completion zsh)
fi



