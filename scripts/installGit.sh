#!/bin/bash


# installation de git

# quel OS ?
if [command -v yum]
then #yum
	yum install git-all -y
else #apt
	apt-get install git-all -y
fi

#git configs ?

git config –global core.editor "nano"
