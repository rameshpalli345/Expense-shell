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
 dnf install mysql-server -y & >>LOG_FILE
 VALIDATE $? "install the my sql server"
 systemctl enable mysqld & >>LOG_FILE
 VALIDATE $? "check symlink connected"
 systemctl start mysqld & >>LOG_FILE
 VALIDATE $? "Check my sql service started"
 mysql_secure_installation --set-root-pass ExpenseApp@1 & >>LOG_FILE
 VALIDATE $? " set the root account password"
 
