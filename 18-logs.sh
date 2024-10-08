#!/bin/bash
SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
if [ -d $SOURCE_DIR ]
then
echo -e " $G SOURCE Directory exists..$R "
else 
echo -e " $R SOURCE Directory not exists..$N"
exit 1
fi
FILES=$(find $SOURCE_DIR -name "*.log" -mtime +1 )
echo "files: $FILES"
while IFS= read -r file #IFS = internal feed seperator and r emtpy white spaces 
do
echo "deleting the line : $file"
rm -rf $file
echo "deleted the $file"
done <<< $FILES

