#!/bin/bash


# redémarrage d'un service

read -p "Service à relancer :" service
systemctl restart $service && echo "$service relancé"


# systemctl restart $2

