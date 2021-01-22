#!/bin/bash


# liste les groupes d'un utilisateur

read -p "Nom de l'utilisateur:" userName
echo "Liste de ses groupes :"
groups $userName
