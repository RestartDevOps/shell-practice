#!/bin/bash
#Author - Jakeer
#Team - DevOps
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$IMESTAMP-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ];then
    echo " you don't have root previlages to run this command " &>>LOG_FILE
    exit 1
    else 
    echo " you have root previlages "
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ];then
    echo -e " $2 is command $R .. failed $N " &>>LOG_FILE
    exit 1
    else 
    echo -e " $2 is command $G .. success $N " &>>LOG_FILE
    fi
}
CHECK_ROOT
for package in $@
do
dnf list installed $package
if [ $? -ne 0 ];then
echo -e " $package is not installed going to install " &>>LOG_FILE
dnf install $package -y
VALIDATE $? " installing $package " 
else 
echo -e " $package is already installed nothing to do " &>>LOG_FILE
fi
done