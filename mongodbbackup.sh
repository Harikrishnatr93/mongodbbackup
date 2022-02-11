#!/bin/sh


THEDB='mymongodb'
THEDBPW='mongodb+srv://admin:jwnnwkncc@mymongodb.xyzc.mongodb.net'
THEDATE=`date +%d_%m_%y_%H.%M`

# export database
mongodump --uri="$THEDBPW" | gzip > /root/dbbackup/dbbackup_${THEDB}_${THEDATE}.gz


# remove backups older than 3 days
find /root/dbbackup/dbbackup_* -mtime +3 -exec rm {} \;
