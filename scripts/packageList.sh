#!/bin/bash


# liste les package installés sur la machine

# quel OS ?
if [ -n "$(command -v yum)" ]
then #yum - centOS 

	yum list installed

else #apt - debian

	apt list --installed

fi
