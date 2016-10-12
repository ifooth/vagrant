#!/bin/bash
rm -rf /etc/yum.repos.d/*
cp /vagrant/*repo /etc/yum.repos.d
yum clean all
yum makecache
yum install -y gcc make kernel-devel vim psmisc net-tools wget
mount -t iso9660 -o loop,user /vagrant/VBoxGuestAdditions.iso  /mnt
cd /mnt
bash VBoxLinuxAdditions.run install
reboot