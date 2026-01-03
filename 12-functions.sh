#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 .... FAILURE"
        exit 1
    else
        echo "$2 ....SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR : YOU MUST HAVE SUDO ACCESS TO EXECUTE THIS SCRIPT"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed"
fi

dnf list intalled git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git"
else
    echo "Git is already installed"
fi

