#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error : you must have sudo access to execute this script"
    exit 1
fi

dnf install mysqll -y

if [ $? -ne 0 ]
then
    echo "Installing MySQL.... FAILURE"
    exit 1
else
    echo "Installing MySQL.... SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "Installing git.....FAILURE"
    exit 1
else
    echo "Installing git.....SUCCESS"
    fi