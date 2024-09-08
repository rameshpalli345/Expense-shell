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
fi
FILES=$(find $SOURCE_DIR -name "*.log" -mtime +0)

