#!/bin/bash


# liste les groupes d'un utilisateur

read -p "Nom de l'utilisateur:" userName
echo "Liste des groupes de $userName :"
groups $userName
