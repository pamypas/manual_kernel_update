#!/bin/bash

yum install -y wget epel-release vim ncurses-devel make gcc bc openssl-devel elfutils-libelf-devel rpm-build flex bison rsync
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.5.2.tar.xz -P /root
tar xf /root/linux-5.5.2.tar.xz -C /root/
cd /root/linux-5.5.2
yes "" | make oldconfig
make rpm-pkg -j 10
cd /root/rpmbuild/RPMS/x86_64/
yum install -y ./kernel*
rm /boot/*3.10*
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
shutdown -r now
