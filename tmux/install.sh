#!/bin/sh
#
# tmux
#
# This installs tmux Plugin Manager

# Check for tmux and git
if test $(which tmux) && test $(which git)
then
  if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    echo "  Installing tpm (tmux Plugin Manager) for you."
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  fi
fi

exit 0
