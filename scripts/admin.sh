#!/bin/bash


# script principal qui sera appelé par l'utilisateur


#usage
if [ "$#" -lt 1 ]
then
	echo "mauvaise utilisation de $0"
        echo "Utilisation : './admin <option>'"
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
        echo "Utilisation : './admin <option>'"
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
	sudo ./installOpenstack.sh
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
	./packageInstall.sh
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
	./packageDel.sh
fi


#ajout d'un utilisateur
if [ "$1" = "userAdd" ]
then
	./userAdd.sh
fi

#ajout d'un groupe
if [ "$1" = "groupAdd" ]
then
	./groupAdd.sh
fi

#liste les groupes d'un utilisateur
if [ "$1" = "groupList" ]
then
	./groupList.sh
fi

# status d'un service
if [ "$1" = "serviceStatus" ]
then
	./serviceStatus.sh
fi

#service restart
if [ "$1" = "serviceRestart" ]
then
	./serviceRestart.sh
fi


#service toggle
if [ "$1" = "serviceToggle" ]
then
	./serviceToggle.sh
fi




