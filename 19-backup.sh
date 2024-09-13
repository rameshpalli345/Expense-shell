#!/bin/bash
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if $3 is empty then 14 days by default
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

# Check the arugments are provided 

   USAGE(){
     echo  "$R USAGE:: $N sh 19-backup.sh source(dir) and destination(dir) and days (number)"
   }
  if [ $# -lt 2 ] 
    then
        USAGE
    fi

  if [ ! -d $SOURCE_DIR ]
    then  
       echo " Source directory does not exit ... please check"
  fi

  if [ ! -d $DEST_DIR ]
    then 
       echo " Destination directory does not exit . please check."
  fi
    FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
    if [ ! -z $FILES ] # true if the files is empty ! nakes it expression is false
    then 
        echo "files are found "
        ZIP_FILE="$DEST_DIR/applogs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@
  # check if the zip correctly woking
        if [ -f $ZIP_FILE ]
         then
            echo "succesfully zipped the logs older than $DAYS"
            while IFS= read -r file #IFS = internal feed seperator and r emtpy white spaces 
             do
                echo "deleting the line : $file"
                rm -rf $file
                echo "deleted the $file"
            done <<< $FILES
        else 
            echo "files are not zipped"
            exit 1
        fi
    else
        echo "no files older than $DAYS"
    fi



