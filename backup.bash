#!/bin/bash

#    git-restore: Simple backup utility for servers, no extra software on server needed
#    Copyright (C) 2018  Stefan Helmert <stefan.helmert@t-online.de>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

tag="backup-$(date +%Y%m%d%k%M%S)"
if [ "$#" -eq 3 ] ; then
  tag=$3
fi
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
mkdir -p "$2/$1"
cd "$2/$1"
git init >/dev/null
mkdir remote
sshfs $1 remote
git add -A
git commit -am "Backup of $1 on $(date)" >/dev/null
git tag $tag
until fusermount -u remote 2>/dev/null
do
  sleep 1
done
rmdir remote


