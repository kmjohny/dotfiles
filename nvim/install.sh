#!/bin/sh

if [ ! -d $HOME/.config/nvim ]; then
  ln -s $HOME/.vim $HOME/.config/nvim
fi

if [ ! -f $HOME/.config/nvim/init.vim ]; then
  ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
fi
