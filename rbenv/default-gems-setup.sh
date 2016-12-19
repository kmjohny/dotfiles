#!/bin/sh
#
# rbenv-default-gems setup

DOTFILES_ROOT=$(pwd -P)

# Check for rbenv
if test $(which rbenv)
then
  if [ ! -f $HOME/.rbenv/default-gems ]; then
    ln -s $DOTFILES_ROOT/rbenv/default-gems $HOME/.rbenv/default-gems
  fi
fi

exit 0
