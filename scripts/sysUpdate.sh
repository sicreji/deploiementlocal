#!/bin/bash


# mise à jour générale du system

if [ -n "$(command -v yum)" ]
then # yum - centOS 7-

	yum check-update -y
	yum update -y

else # apt - debian

	apt update -y
	apt upgrade -y

fi

