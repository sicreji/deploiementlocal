#!/bin/bash


# switch ON/OFF d'un service

#read -p "Service à toggle :" service

if [ "$(systemctl is-active $1)" = "active" ] 
then
	systemctl stop $1 && echo "$1 stoppé"
else
	systemctl start $1 && echo "$1 démarré"
fi





