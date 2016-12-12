alias bc='brew cleanup -s --force'
# Brew Alias to list with dependencies
# brew list | while read cask; do echo -n $fg[blue] $cask $fg[white]; brew deps $cask | awk '{printf(" %s ", $0)}'; echo ""; done

