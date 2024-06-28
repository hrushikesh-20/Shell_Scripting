#!/bin/bash

FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')

TH=9060

if [[ $FREE_SPACE -lt $TH ]]
then
        echo "Warning, RAM is running low -> $FREE_SPACE MB"
else
        echo "RAM space is sufficient -> $FREE_SPACE MB"
fi
