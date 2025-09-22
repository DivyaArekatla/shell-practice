#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root prevelege"
    exit 1

fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Install mysql is failure"
    exit 1
else
    echo "Installing mysql is success"
fi