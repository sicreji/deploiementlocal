#!/bin/bash


# affiche le status d'un service

#read -p "Service à scruter :" service
systemctl status $1
