#!/bin/bash

# install Openstack

# fixer ip statique via ifconfig

adresse="$(dig +short myip.opendns.com @resolver1.opendns.com)"
ifconfig eth0 $adresse
systemctl restart network

#touch /etc/sysconfig/network-scripts/ifcfg-eth0
#echo "BOOTPROTO=none" >> /etc/sysconfig/network-scripts/ifcfg-eth0
#echo "ONBOOT=yes" >> /etc/sysconfig/network-scripts/ifcfg-eth0
#echo "PREFIX=24" >> /etc/sysconfig/network-scripts/ifcfg-eth0
#echo "IPADDR=$adresse" >> /etc/sysconfig/network-scripts/ifcfg-eth0


# quel OS ?
if [ -n "$(command -v yum)" ]
then #yum - centOS packstack

	# cassage du firewall
	systemctl stop firewalld
	systemctl disable firewalld
	echo "selinux=disabled" >> /etc/selinux/config
	touch /.autorelabel

	# installation de openstack
	yum -y update ( en cas de probleme avec update ; il faut arreter processus packagekitd)
	yum -y install centos-release-openstack-queens
	yum -y update
	yum -y install openstack-packstack
	packstack --allinone --os-heat-install=y

else #apt - ubuntu devstack ?

	# Update repositories
	sudo apt-get --yes update

	# Basic tools used by DevStack
	sudo apt-get install --yes sudo vim vim-nox lynx zip binutils wget
	sudo apt-get install --yes openssl ssl-cert ssh

	# Delete "apparmor"
	sudo service apparmor stop
	sudo update-rc.d -f apparmor remove
	sudo apt-get remove --yes apparmor apparmor-utils
	sudo apt-get purge --yes apparmor apparmor-utils

	# Install NTP
	sudo apt-get install --yes ntp

	# Requirements for the DevStack script
	sudo apt-get install bridge-utils
	sudo apt-get install --yes git
	sudo apt-get install --yes python-pip
	sudo pip install --upgrade pip
	sudo pip install -U os-testr

	#création de l'utilisateur dédié stack
	sudo groupadd stack
	sudo useradd -s /bin/bash -d /opt/stack -m stack

	cd /etc/sudoers.d
	umask 226 && echo "stack ALL=(ALL) NOPASSWD:ALL" > etc/sudoers.d/50_stack_sh

	# téléchargement devstack
	su stack
	cd
	git clone https://git.openstack.org/openstack-dev/devstack
	cd devstack
	git checkout stable/train

	# configurations minimales pour pouvoir utiliser le script d'installation
	
	touch local.conf
	echo "[[local|localrc]]" >> local.conf
	echo "ADMIN_PASSWORD=openstack" >> local.conf
	echo "DATABASE_PASSWORD=openstack" >> local.conf
	echo "RABBIT_PASSWORD=openstack" >> local.conf
	echo "SERVICE_PASSWORD=openstack" >> local.conf
	echo "GIT_BASE=https://git.openstack.org" >> local.conf
	echo "\n" >> local.conf
	# activer d'autres puglins si besoin ?
	echo "enable_plugin heat https://git.openstack.org/openstack/heat stable/train" >> local.conf

	# lancer l'installation, nettoyage si échec
	./stack.sh || ./clean.sh

fi


read -p reb "Reboot ? y/n"

if [test $reb -eq "y"]
then
	reboot
fi
