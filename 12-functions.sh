#!/bin/bash
#Author - Jakeer
#Team - Devops
USERID=$(id -u)
CHECK_ROOT() {
    if [ $USERID -ne 0 ];then
    echo " you don't have root previlages to run this command "
    exit 1
    else
    echo " you have root previlages to run this command "
    fi
}
VALIDATE() {
    if [ $1 -ne 0 ];then
    echo " $2 command .. failed "
    exit 1
    else 
    echo " $2 command .. success "
}
VALIDATE $?
CHECK_ROOT
dnf list installed git
if [ $? -ne 0 ];then
echo " git is not installed "
dnf install git -y
VALIDATE $? "Installing Git"
else
echo "Git is already installed, nothing to do.."
fi
dnf list installed mysql
if [ $? -ne 0 ];then
echo " mysql is not installed "
dnf install mysql -y
VALIDATE $? "Installing mysql"
else
echo "Git is already installed, nothing to do.."
fi




