#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$( echo $0 | cut -d "." -f1 )
TIMESTAMP=$( date +%Y-%m-%d-%H-%M-%S )
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE/$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ....$R FAILURE"
        exit 1
    else
        echo -e "$2 .... $G SUCCESS"
    fi
}

echo "Script started executed at : $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR : YOU MUST HAVE SUDO ACCESS TO EXECUTE THIS SCRIPT"
    exit 1
fi

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing MySQL"
else
    echo -e "MySQL is already $Y installed"
fi

dnf list intalled git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing git"
else
    echo "Git is already $Y installed"
fi

