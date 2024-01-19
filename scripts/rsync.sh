#!/bin/sh

# Basic snapshot-style rsync backup script 

echo "MAKE SURE TO MOUNT HARD DISK TO /mnt!!!"
# Config
OPT="-aPh"
LINK="--link-dest=/snapshots/username/last/" 
SRC="/home/cheecho/"
SNAP="/mnt/cheecho-backup/"
LAST="/mnt/cheecho-backup/last"
date=`date "+%Y-%b-%d:_%T"`

# Run rsync to create snapshot
rsync $OPT $LINK $SRC ${SNAP}$date

# Remove symlink to previous snapshot
rm -f $LAST

# Create new symlink to latest snapshot for the next backup to hardlink
ln -s ${SNAP}$date $LAST
