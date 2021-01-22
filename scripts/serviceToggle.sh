#!/bin/bash


# switch ON/OFF d'un service

read -p service "Service à toggle :"

if [systemctl is-active $service ] 
then
	systemctl stop $service
else
	systemctl start $service
fi





