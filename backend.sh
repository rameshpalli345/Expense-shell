#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%y-%m-%d-%H-%M)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER
USERID=$(id -u)
#echo " print the value $USERID"
CHECK_ROOT() {
    if [ $USERID -ne 0 ]
    then 
   echo -e "$R User not have previlleged access stop execute the script $N" |tee -a $LOG_FILE
   exit 1
   fi
}
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "$1 is ..$R installation failed $N" | tee -a $LOG_FILE
    else
    echo -e "$1 is ..$G installation sucess $N" | tee -a $LOG_FILE
    fi
}
 CHECK_ROOT
 dnf module disable nodejs -y &>>$LOG_FILE
 VALIDATE $? "disable nodejs previous version"
 dnf module enable nodejs:20 -y &>>$LOG_FILE
 VALIDATE $? "enable nodejs version20"

 id expense &>>$LOG_FILE
 if [ $? -ne 0 ]
 then 
 "echo -e  expense user not exit .$G.creating $N"
 useradd expense & >>$LOG_FILE
 VALIDATE $? "user expense created"
 else
 echo -e  "expense user already created.. $Y skipping..$N"
 fi
 mkdir -p /app & >>$LOG_FILE
 VALIDATE $? " Creating new directory"
 curl -o /tmp/backend.zip  https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip & >>$LOG_FILE
 VALIDATE $? "copy expense code temp directory"
 cd /app
 rm -rf /app/* #remove the exiting code
 unzip /tmp/backend.zip & >>$LOG_FILE
 VALIDATE $? "change directoy and extracting the code"








