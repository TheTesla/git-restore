#!/bin/bash

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

tag="backup-$(date +%Y%m%d%k%M%S)"
if [ "$#" -eq 2 ] ; then
  tag=$2
fi

cd "$1"
realpathbackup=$(realpath $1)
pathlenbackup=${#realpathbackup}
for d in $(find $1 -name '.git'); do
    remotepath=${d:$((pathlenbackup+1)):-5}
    echo "Backup   $remotepath ->  $realpathbackup/$remotepath"
    $HERE/backup.bash "$remotepath" "$realpathbackup" $tag
done

