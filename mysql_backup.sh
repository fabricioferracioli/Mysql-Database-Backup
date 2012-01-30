#!/bin/bash
NOW=$( date +%d-%m-%YT%H:%I:%S )
PAST_MONTH=$( date +%d-%m-%YT%H:%I:%S -d "-1 month")

MYSQL_USERNAME=username
MYSQL_HOST=host
MYSQL_PASSWD=passwd
MYSQL_DB=database

BKP_FILE=~/backup/$MYSQL_DB.$NOW.sql
BKP_FILE_GZ=$BKP_FILE.tar.gz

mysqldump -u $MYSQL_USERNAME --host=$MYSQL_HOST --password=$MYSQL_PASSWD $MYSQL_DB > $BKP_FILE
tar -czf $BKP_FILE_GZ $BKP_FILE

#delete files older than 30 days
for f in $( find ~/backup/* -mtime +30 ); do
    rm f
done
