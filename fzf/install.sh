#!/bin/sh
# Check for fzf
if test $(which fzf)
then 
  echo "  Installing fzf extensions for you."
  yes | /usr/local/opt/fzf/install
fi
