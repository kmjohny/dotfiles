#!/bin/sh
#
# vim-plug
#
# This installs vim plugin manager

# Check for vim
if test $(which vim)
then
  VIM_PLUG_FILE=$HOME/.vim/autoload/plug.vim
  VIM_PLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  if [ ! -f $VIM_PLUG_FILE ]; then
    echo "  Installing vim-plug (vim Plugin Manager) for you."
    curl -fLo $VIM_PLUG_FILE --create-dirs $VIM_PLUG_URL
  fi
fi

exit 0
