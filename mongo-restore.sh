#!/bin/bash
HOSTNAME="127.0.0.1"
PORT="27017" # default mongoDb port is 27017
USERNAME=""
PASSWORD=""

# Set where database will be re-stored from
BACKUP_PATH="Documents/mongo/backup/"
echo The backup path is ${BACKUP_PATH}

# run dump on mongoDB
if [ "$USERNAME" != "" -a "$PASSWORD" != "" ]; then
	#sudo mongorestore --host $HOSTNAME:$PORT -u $USERNAME -p $PASSWORD $BACKUP_PATH --drop
	sudo mongorestore --host $HOSTNAME:$PORT -u $USERNAME -p $PASSWORD --authenticationDatabase admin --db client1 $BACKUP_PATH/client1 --drop
else
    sudo mongorestore --host $HOSTNAME:$PORT $BACKUP_PATH  --drop
fi
