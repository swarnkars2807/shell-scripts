#!/bin/bash

#Target directory
dir=$1

#Max file shoudld be there in dir
MAX_COUNT=$2

#ROllover duration after that logs file is roll over and new file is created
ROLLOVER_DURATION=$3

for d in "$dir"/*; do 
    if [-d $d ] ; then
        count=`1s -1 $d/*.logs | wc -l`
        if [ "$count" -gt "$MAX_COUNT" ]; then
            echo "$count number of file in $d exceed deleteing old files"
            find $d/.logs -type f -mmin +$(($ROLLOVER_DURATION*$MAX_COUNT)) -print -delete
        fi
    fi
doneI
