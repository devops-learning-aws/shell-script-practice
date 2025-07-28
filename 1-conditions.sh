#!/bin/bash

USERID=(id -u)

if [ $USERID -ne 0 ]
then 
echo "please run with super user access "

else 
echo "you are a super user "

fi