Download Files
==================
VirtualBox https://www.virtualbox.org/wiki/Downloads

Vagrant https://www.vagrantup.com/downloads.html

SSH https://github.com/PowerShell/Win32-OpenSSH

centos images http://cloud.centos.org/centos/7/vagrant/x86_64/images/


Install VBoxGuestAdditions
===========================
1. copy VBoxGuestAdditions.iso to vagrant folder
2. bash install.sh


install.sh
=================
```bash
su - root
rm -rf /etc/yum.repos.d/*
cp /vagrant/*repo /etc/yum.repos.d
yum clean all
yum makecache
yum install -y gcc make kernel-devel vim psmisc net-tools wget
mount -t iso9660 -o loop,user /vagrant/VBoxGuestAdditions.iso  /mnt
cd /mnt
bash VBoxLinuxAdditions.run install
reboot
```
