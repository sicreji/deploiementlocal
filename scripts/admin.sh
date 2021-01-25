#!/bin/bash


# script principal qui sera appelé par l'utilisateur


#usage
if [ "$#" -lt 1 ]
then
	echo "mauvaise utilisation de $0"
        echo "Utilisation : './admin <option> (<p1>, <p2>, ... )'"
	echo "openstack"
	echo "git"
	echo "jenkins"
	echo "package"
	echo "sysUpdate"
	echo "packageList"
	echo "packageDel"
	echo "userAdd"
	echo "groupAdd"
	echo "groupList"
	echo "serviceStatus"
	echo "serviceRestart"
	echo "serviceToggle"
	exit 0
fi

# --help
if [ "$1" = "help" ]
then
        echo "Utilisation : './admin <option> (<p1>, <p2>, ... )'"
	echo "openstack"
	echo "git"
	echo "jenkins"
	echo "package"
	echo "sysUpdate"
	echo "packageList"
	echo "packageDel"
	echo "userAdd"
	echo "groupAdd"
	echo "groupList"
	echo "serviceStatus"
	echo "serviceRestart"
	echo "serviceToggle"
        exit 0
fi


# installation openstack
if [ "$1" = "openstack" ]
then
	sudo ./installOpenstack.sh	#meh
fi

# installation git
if [ "$1" = "git" ]
then
	./installGit.sh
fi

#installation jenkins
if [ "$1" = "jenkins" ]
then
	./installJenkins.sh
fi


#installation de package
if [ "$1" = "package" ]
then
	if [ "$#" -eq 2 ]
	then
		./packageInstall.sh $2
	else
		echo "Argument manquant pour la commande package."
	fi
fi


#MaJ du system
if [ "$1" = "sysUpdate" ]
then
	./sysUpdate.sh
fi


#listage des paquets
if [ "$1" = "packageList" ]
then
	./packageList.sh
fi


#suppression de package
if [ "$1" = "packageDel" ]
then
	if [ "$#" -eq 2 ]
	then
		./packageDel.sh $2
	else
		echo "Argument manquant pour la commande packageDel."
	fi
fi


#ajout d'un utilisateur
if [ "$1" = "userAdd" ]
then
	if [ "$#" -eq 2 ]
	then
		./userAdd.sh $2
	else
		echo "Argument manquant pour la commande userAdd."
	fi
fi

#ajout d'un groupe
if [ "$1" = "groupAdd" ]
then
	if [ "$#" -eq 2 ]
	then
		./groupAdd.sh $2
	else
		echo "Argument manquant pour la commande groupAdd."
	fi
fi

#liste les groupes d'un utilisateur
if [ "$1" = "groupList" ]
then
	if [ "$#" -eq 2 ]
	then
		./groupList.sh $2
	else
		echo "Argument manquant pour la commande groupList."
	fi
fi

# status d'un service
if [ "$1" = "serviceStatus" ]
then
	if [ "$#" -eq 2 ]
	then
		./serviceStatus.sh $2
	else
		echo "Argument manquant pour la commande serviceStatus."
	fi
fi

#service restart
if [ "$1" = "serviceRestart" ]
then
	if [ "$#" -eq 2 ]
	then
		./serviceRestart.sh $2
	else
		echo "Argument manquant pour la commande serviceRestart."
	fi
fi


#service toggle
if [ "$1" = "serviceToggle" ]
then
	if [ "$#" -eq 2 ]
	then
		./serviceToggle.sh $2
	else
		echo "Argument manquant pour la commande serviceToggle."
	fi
fi




