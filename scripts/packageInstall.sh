#!/bin/bash


# installation d'un package en param

#read -p "Package a installer :" package


# quel OS ?
if [ -n "$(command -v yum)" ]
then #yum
	yum install $1 -y
else #apt
	apt-get install $1 -y
fi




