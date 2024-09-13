#!/bin/bash
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if $3 is empty then 14 days by default
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

# Check the arugments are provided 

   USAGE ()
   {
     echo  "$R USAGE:: $N sh 19-backup.sh source(dir) and destination(dir) and days (number)"
    
   }
 
    if [ $# -lt 2 ] {
    then
        USAGE
    }
    fi



