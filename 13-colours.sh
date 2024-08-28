#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
CHECK_ROOT(){
    if [ $USERID -ne 0 ];then
    echo " $R you dont have root previlages $N "
    exit 1
    else 
    echo " $G you have root previlages to run this command $N "
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ];then
    echo " $R $2 command .. failed $N "
    exit 1
    else 
    echo  " $G $2 command .. success $N "
    fi
 }
 CHECK_ROOT
 dnf list installed git
 if [ $? -ne 0 ];then
 echo " git installation failed "
  dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed, nothing to do.."
fi
dnf list installed mysql
 if [ $? -ne 0 ];then
 echo " mysql installation failed "
  dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo "mysql is already installed, nothing to do.."
fi