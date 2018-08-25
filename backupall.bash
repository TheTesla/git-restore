#!/bin/bash

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"


cd "$1"
realpathbackup=$(realpath $1)
pathlenbackup=${#realpathbackup}
for d in $(find $1 -name '.git'); do
    remotepath=${d:$((pathlenbackup+1)):-5}
    echo "Backup   $remotepath ->  $realpathbackup/$remotepath"
    $HERE/backup.bash "$remotepath" "$realpathbackup" $2
done

