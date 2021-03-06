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

# $1 remote 
# $2 database login

remotehost=$(echo $1 | cut -d':' -f1)
remotedir=$(echo $1 | cut -d':' -f2)
dbuser=$(echo $2 | cut -d':' -f1)
dbpasswd=$(echo $2 | cut -d':' -f2)

ssh "$remotehost" /bin/bash << EOF
  nohup mysql -u $dbuser -p$dbpasswd < mysql-backup.sql 2>mysql-restore.err
EOF


