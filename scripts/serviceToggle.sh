#!/bin/bash


# switch ON/OFF d'un service

read -p "Service à toggle :" service

if [ "$(systemctl is-active $service)" = "active" ] 
then
	systemctl stop $service && echo "$service stoppé"
else
	systemctl start $service && echo "$service démarré"
fi





