#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root prevelege"
    exit 1 # failure is other than 0

fi

VALIDATE(){ # funstions receive inputs through args just like shell script args

    if [ $1 -ne 0 ]; then
        echo -e "Installng $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 .... $G SUCCESS $N"
    fi

}
dnf list installed mysql
# Install if it is not found
if [ $? -ne 0 ]; then 
dnf install mysql -y
VALIDATE $? "MySQL"
else
    echo -e "MySQL already exist ... $Y SKIPPING $N"
fi
dnf list installed nginx
if [ $? -ne 0 ]; then
dnf install nginx -y
VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist ... $Y SKIPPING $N"
fi
nf list installed python3
if [ $? -ne 0 ]; then
dnf install python3 -y
VALIDATE $? "Python3"
else 
    echo -e "python3 already exist ... $Y SKIPPING $N"
fi