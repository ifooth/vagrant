Download Files
==================
VirtualBox https://www.virtualbox.org/wiki/Downloads

Vagrant https://www.vagrantup.com/downloads.html

SSH https://github.com/PowerShell/Win32-OpenSSH

CentOS Vagrant Image http://cloud.centos.org/centos/7/vagrant/x86_64/images/


Install VBoxGuestAdditions And Provision Vagrant
===========================
1. copy VBoxGuestAdditions.iso to vagrant folder
2. download Vagrantfile to vagrant folder
3. vagrant up
4. vagrant provision


bootstrap.sh
=================
```bash
#!/bin/bash
echo 'start install yum repo'
rm -rf /etc/yum.repos.d/*
curl https://raw.githubusercontent.com/ifooth/vagrant/master/centos7/Centos-7.repo > /etc/yum.repos.d/Centos-7.repo
curl https://raw.githubusercontent.com/ifooth/vagrant/master/centos7/epel.repo > /etc/yum.repos.d/epel.repo
yum clean all
yum makecache

echo 'start install pkg'
yum install -y gcc make kernel-devel vim psmisc net-tools wget

echo 'start install VBoxGuestAdditions'
mount -t iso9660 -o loop,user /vagrant/VBoxGuestAdditions.iso  /mnt
cd /mnt
bash VBoxLinuxAdditions.run install

echo 'bootstrap finish'
```
