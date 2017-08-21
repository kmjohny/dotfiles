#!/bin/sh

if test ! $(which spoof)
then
sudo npm install -g spoof
fi

# install livedown 
if test ! $(which livedown)
npm install -g livedown
fi
