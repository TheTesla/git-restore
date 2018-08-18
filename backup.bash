#!/bin/bash

export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
mkdir -p $2
cd $2
git init
mkdir remote
sshfs $1 remote
git add -A
git commit -am "Backup of $1 on $(date)"
git tag "backup-$(date +%Y%m%d%k%M%S)"
until fusermount -u remote
do
  sleep 1
done
rmdir remote
echo "Backup done."


