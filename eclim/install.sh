#!/bin/sh
# Check for eclim

ECLIM_DOWNLOAD_URL=https://github.com/ervandew/eclim/releases/download/2.8.0/eclim_2.8.0.bin
ECLIM_DOWNLOAD_FILE=/tmp/eclim.bin
ECLIPSE_HOME=/Applications/eclipse/java-photon/Eclipse.app

if [ -d $ECLIPSE_HOME ]; then 
  echo "  Installing eclim for you."  
  curl -Lo $ECLIM_DOWNLOAD_FILE $ECLIM_DOWNLOAD_URL

  if [ -f $ECLIM_DOWNLOAD_FILE ]; then
    chmod +x $ECLIM_DOWNLOAD_FILE

    $ECLIM_DOWNLOAD_FILE \
    --yes \
    --eclipse=$ECLIPSE_HOME \
    --vimfiles=$HOME/.vim \
    --plugins=jdt,pydev

    rm $ECLIM_DOWNLOAD_FILE
    
    if [ ! -f /usr/local/bin/eclimd ]; then
      ln -s $ECLIPSE_HOME/Contents/Eclipse/eclimd /usr/local/bin/eclimd
    fi
 fi
fi

exit 0
