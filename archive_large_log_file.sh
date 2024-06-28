#!/bin/bash

BASE=/home/hrushikesh/temp
DAYS=10
DEPTH=1
RUN=0

#To check if path exists

if [ ! -d $BASE ]
then
        echo "Folder doen not exist: $BASE"
        exit 1
fi

#To check and create archive folder

if [ ! -d $BASE/archive ]
then
        mkdir $BASE/archive
fi

for i in `find $BASE -maxdepth $DEPTH -type f -size +1M`
do
        if [ $RUN -eq 0 ]
        then
                echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive"
                gzip $i || exit 1
                mv $i.gz $BASE/archive || exit 1
        fi
done
