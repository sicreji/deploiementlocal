#!/bin/bash


# ceci est un commentaire

# read -p "nom du groupe a créer :" groupName
groupadd $1
echo "$1 créé"

