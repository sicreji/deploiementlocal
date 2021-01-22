#!/bin/bash


# liste les groupes d'un utilisateur

read -p userName "Nom de l'utilisateur:"
echo "Liste de ses groupes :"
groups $userName
