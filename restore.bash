#!/bin/bash

export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
cd "$2/$1"
mkdir remote
sshfs $1 remote
tag="master"
if [ "$#" -eq 3 ] ; then
  tag=$3
fi
echo "checkout $tag"
git checkout $tag -f
until fusermount -u remote
do
  sleep 1
done
rmdir remote
echo "Restore done."

