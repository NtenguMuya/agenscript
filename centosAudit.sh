#!/bin/bash
#Description : centos 7 Audit

#Author: Levi

#Date: 24/04/2019

echo -e  "\n*****************************************************************\n " >> /var/log/centos7audit-$(date +%F)
echo -e "\n********************************* CENTOS 7 AUDIT \n" >> /var/log/centos7audit-$(date +%F)
echo -e "\n **********************************************************\n" >> /var/log/centos7audit-$(date +%F)

## Check hosts file

if [ -f /etc/hosts ] ; then
        echo "File /etc/hosts exist " >> /var/log/centos7audit-$(date +%F)
else
        echo "File /etc/hosts does not exist" >> /var/log/centos7audit-$(date +%F)

fi

##Check selinux
echo _e "\n cheking selinux\n" >> /var/log/centos7audit-$(date +%F)
echo -e "n\ The selinux is set to $(getenforce) \n" >> /var/log/centos7audit-$(date +%F)

### User nobody

echo -e "\nChecking nobody uid\n" >> /var/log/centos7audit-$(date +%F)
echo "The user nobody is $(id -u nobody)" >> /var/log/centos7audit-$(date +%F)

##Checking for saba

echo -e "\ncheking samaba package\n" >> /var/log/centos7audit-$(date +%F)
rpm -qa |grep samaba >/dev/null 2>&1

if [ $? -eq 0 ] ; then
echo -e "\n Package samba is installed\n" >> /var/log/centos7audit-$(date +%F)
else
echo -e "\n Package samba not installed\n" >> /var/log/centos7audit-$(date +%F)

fi

##Checking for curl

echo -e "\ncheking curl package\n" >> /var/log/centos7audit-$(date +%F)
rpm -qa |grep curl >/dev/null 2>&1

if [ $? -eq 0 ] ; then

echo -e "\n Package curl is installed\n" >> /var/log/centos7audit-$(date +%F)
else
echo -e "\n Package curl not installed\n" >> /var/log/centos7audit-$(date +%F)

fi

##Checking for docker

echo -e "\ncheking docker package\n" >> /var/log/centos7audit-$(date +%F)
rpm -qa |grep docker >/dev/null 2>&1

if [ $? -eq 0 ] ; then
echo -e "\n Package docker is installed\n" >> /var/log/centos7audit-$(date +%F)
else
echo -e "\n Package docker not installed\n" >> /var/log/centos7audit-$(date +%F)

fi

## Check network file

if [ -f /etc/sysconfig ] ; then
        echo "File /etc/sysconfig/network exist" >> /var/log/centos7audit-$(date +%F)
else
        echo "File /etc/sysconfig/network" >> /var/log/centos7audit-$(date +%F)

fi

##check host name

echo -e "\nthe system is $(getconf LONG_BIT)\n" >> /var/log/centos7audit-$(date +%F)

#Check  ip addr

echo -e " check what is the ip address of the server." >> /var/log/centos7audit-$(date +%F)

ifconfig |head -20 |tail -10 |awk  '{print $2}'|head -1 >> /var/log/centos7audit-$(date +%F)


##Checking  Linux Flavor

echo -e " check what linux flavor is running and the version." >> /var/log/centos7audit-$(date +%F)

cat /etc/*release |head -1 |awk '{print $1,$4}'|awk -F"." '{print $1 "." $2}' >> /var/log/centos7audit-$(date +%F)
exit

