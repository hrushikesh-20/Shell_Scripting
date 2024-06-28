#!/bin/bash

FU=$(df -h | egrep -v "Filesystem|tmpfs" | grep "drivers" | awk '{print $5}' | tr -d %)

TO="hrushikesh20@gmail.com"

if [[ $FU -ge 80 ]]
then
        echo "Warning, Low disk space -> $FU %" | mail -s "Disk Space Alert!" $TO

else
        echo "All good"
fi
