#!/bin/bash

DATE=$(date +%Y-%m-%dT%H:%M:%S)
KEEP=100

# Create backup dir and change into it
mkdir -p /palworld/backups && cd /palworld/Pal
echo ">>> Creating backup"
tar cfz /palworld/backups/saved-$DATE.tar.gz Saved/
echo ">>> Done"
echo ">>> Removing backups except for the latest $KEEP"
cd /palworld/backups
ls /palworld/backups/ -1tr | sort |head -n -$KEEP | xargs -I% -d '\n' rm -f /palworld/backups/%
