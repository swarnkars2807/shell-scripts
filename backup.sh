#!/bin/bash
HOSTNAME="localhost"
PORT="27017" # default mongoDb port is 27017
USERNAME=""
PASSWORD=""
# Set backup path where you want to store database backup
BACKUP_PATH="Document/mongo/backup/"

echo "\n ========================================================================================================= \n"
echo " BACKUP PATH : ${BACKUP_PATH} \n"
echo "============================================================================================================ \n"

if [ "$USERNAME" != "" -a "$PASSWORD" != "" ]; then
    mongodump --host $HOSTNAME:$PORT -u $USERNAME -p $PASSWORD --out $BACKUP_PATH
else
    mongodump --host $HOSTNAME:$PORT --out $BACKUP_PATH
fi
