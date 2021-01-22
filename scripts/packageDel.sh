#!/bin/bash


# supprimer un paquet en param

# quel OS ?
if [ -n "$(command -v yum)" ]
then #yum
	yum remove $1 -y
else #apt
	apt remove $1 -y
fi
