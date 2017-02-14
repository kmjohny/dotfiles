#!/bin/sh
#
# minikube requires docker-machine-driver-xhyve which needs root owner and uid.
#
#
if test $(which docker-machine-driver-xhyve)
then
  sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
  sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
fi
