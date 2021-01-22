#!/bin/bash


# redémarrage d'un service

read -p service "Service à relancer :"
systemctl restart $service

# systemctl restart $2

