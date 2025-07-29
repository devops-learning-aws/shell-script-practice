#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) 
LOGFILE=/tem/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "please enter your DB Password"
read -s mysql_root_password

VALIDATE(){
    if [$1 -ne 0 ]
    then 
    echo "$2  failled"
    exit 1
    else
    echo "$2 success"
    fi
}




if [ $USERID -ne 0 ]
then
echo " $R please run with super user access $N"
exit 1
else 
echo "you are a super user"
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing myql"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling mysql"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Starting mysql"

mysql -h db.daws78s.online -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE

if [ $? -ne 0 ]
then 
mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
VALIDATE $? "setting up root password"
else 
echo "Already setuped skpping .."
fi