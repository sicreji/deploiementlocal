#!/bin/bash


# redémarrage d'un service

#read -p "Service à relancer :" service
systemctl restart $1 && echo "$1 relancé"

