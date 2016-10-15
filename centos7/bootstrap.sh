#!/bin/bash
echo 'start install yum repo'
rm -rf /etc/yum.repos.d/*
curl https://raw.githubusercontent.com/ifooth/vagrant/master/centos7/Centos-7.repo -o /etc/yum.repos.d/Centos-7.repo -s
curl https://raw.githubusercontent.com/ifooth/vagrant/master/centos7/epel.repo -o /etc/yum.repos.d/epel.repo -s
yum clean all
yum makecache

echo 'start install pkg'
yum install -y gcc make kernel-devel vim psmisc net-tools wget

echo 'start install VBoxGuestAdditions'
mount -t iso9660 -o loop,user /vagrant/VBoxGuestAdditions.iso  /mnt
cd /mnt
bash VBoxLinuxAdditions.run install

localectl set-locale LANG=en_US.UTF-8
timedatectl set-timezone Asia/Shanghai

echo 'bootstrap finish'