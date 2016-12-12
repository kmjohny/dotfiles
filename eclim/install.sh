#!/bin/sh
# Check for eclim

ECLIM_DOWNLOAD_URL=https://github.com/ervandew/eclim/releases/download/2.6.0/eclim_2.6.0.jar
ECLIM_DOWNLOAD_FILE=/tmp/eclim.jar
ECLIPSE_HOME=/Applications/Eclipse.app/Contents/Eclipse

if [ -d $ECLIPSE_HOME ]; then 
  echo "  Installing eclim for you."  
  curl -Lo $ECLIM_DOWNLOAD_FILE $ECLIM_DOWNLOAD_URL

  if [ -f $ECLIM_DOWNLOAD_FILE ]; then
    java -Dvim.files=$HOME/.vim -Declipse.home=$ECLIPSE_HOME -jar $ECLIM_DOWNLOAD_FILE uninstall

    rm $ECLIM_DOWNLOAD_FILE
    
#    ln -s $ECLIPSE_HOME/eclim /usr/local/bin/eclim
#    ln -s $ECLIPSE_HOME/eclimd /usr/local/bin/eclimd
 fi
fi