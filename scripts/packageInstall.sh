#!/bin/bash


# installation d'un package en entree

read -p "Package a installer :" package
# quel OS ?
if [ -n "$(command -v yum)" ]
then #yum
	yum install $package -y
else #apt
	apt-get install $package -y
fi




