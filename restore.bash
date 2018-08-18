#!/bin/bash

export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
cd $2
mkdir remote
sshfs $1 remote
git checkout master -f
until fusermount -u remote
do
  sleep 1
done
rmdir remote
echo "Restore done."

