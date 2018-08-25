# git-restore
This is a simple backup utility for servers, no extra software on server is needed.

In the project directory just run:

```bash
./init.bash myusername@myremotesourcedomain.de:/my/remote/directory ~/mylocalbackup
./init.bash myotherusername@myotherremotesourcedomain.de:/my/other/remote/directory ~/mylocalbackup
```

to add remote backup sources.

To make a backup from your remote, run:

```bash
./backupall.bash ~/mylocalbackup
```

To restore to your remote, run:

```bash
./restoreall.bash ~/mylocalbackup
```

You can tag your backup with:

```bash
./backupall.bash ~/mylocalbackup mytag
```

and restored the tagged version:


```bash
./restore.bash ~/mylocalbackup mytag
```

## Author

Stefan Helmert


