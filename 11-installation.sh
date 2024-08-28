#!/bin/bash
#Author - Jakeer
#Team - Devops
USERID=$(id -u)
if [ $USERID -ne 0 ];then
echo " you don't have root previlages to run this command please run with root privilages or add sudo before the command "
else 
echo " you have root previlages to run this command "
fi
dnf list installed git
if [ $? -ne 0 ];then
echo " git is not installed "
dnf install git -y
else 
echo " git installed nothing to do "
fi
