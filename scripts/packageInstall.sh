#!/bin/bash


# installation d'un package en entree

read -p package "Package a installer :"

# quel OS ?
if [command -v yum]
then #yum
	yum install $package -y
else #apt
	apt-get install $package -y
fi




