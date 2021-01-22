#!/bin/bash


# install Openstack


# quel OS ?
if [command -v yum]
then #yum - centOS packstack
	yum install $package -y
else #apt - ubuntu devstack ?
	apt-get install $package -y
fi
