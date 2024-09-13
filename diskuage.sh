#!/bin/bash
DISK_USAGE=$(df -hT | grep xfs)
DISK_THERSHOLD=5

while IFS= read -r line #IFS = internal feed seperator and r emtpy white spaces 
do
  USAGE=$(echo $line | grep xfs |awk -F  " " '{print $8F}' | cut -d "%" -f1)
  PARTITION=$(echo $line | grep xfs | awk -F "   " '{print $NF}')
  if [ $USAGE -ge $DISK_THERSHOLD ]
  then
       echo "$PARTITION is more than $DISK_THERSHOLD current valu: $USAGE , please check"
   fi
   done <<< $DISK_USAGE
