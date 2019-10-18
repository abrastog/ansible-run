#!/bin/bash

set -e
C='\033[0;31m'
NOCOLOR="\033[0m"
#echo -e "HOSTNAME=${C}$1${NOCOLOR}"


read  -p  "enter the usernamei:-  " USERNAME
#read USERNAME

echo -e "${C}$USERNAME${NOCOLOR}"

function usercheck()
 {
  NAME="$USERNAME"
  CHECK=$(cat /etc/passwd | grep -i $NAME | awk -F: '{print $1}')
  if [ "$CHECK" == "$USERNAME" ];then
      echo "user is present in server"
  else
      echo "user is not present in server adding now"
      USER_ADD
  fi
}  

function USER_ADD()
{
 NAME="$USERNAME"
 read -p  "Enter the password you want for user :- " PASS
 read -p "Enter the commnet for user :- " COMMENT
 pass=$(perl -e 'print crypt($ARGV[0], "password")' $PASS)
 useradd -m -p $pass $USERNAME
} 


usercheck
