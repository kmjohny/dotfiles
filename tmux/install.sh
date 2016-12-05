#!/bin/sh
#
# tmux
#
# This installs tmux Plugin Manager

# Check for Homebrew
if test $(which tmux) && test $(which git)
then
  echo "  Installing tpm (tmux Plugin Manager) for you."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
fi

exit 0
