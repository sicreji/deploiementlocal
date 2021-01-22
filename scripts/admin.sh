#!/bin/bash


# script principal qui sera appelé par l'utilisateur


#usage
if [ "$#" -lt 2 ]
then
	echo "mauvaise utilisation de $0"
        echo "Utilisation : 'admin <option>'"
	echo "installOpenstack"
	echo "installGit"
	echo "installJenkins"
	echo "packageInstall"
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
if [ "$1" -eq "help" ]
then
        echo "Utilisation : 'admin <option>'"
	echo "openstack"
	echo "git"
	echo "jenkins"
	echo "packageInstall"
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
if [ "$1" -eq "openstack" ]
then
	./installOpenstack.sh
fi

# installation git
if [ "$1" -eq "git" ]
then
	./installGit.sh
fi

#installation jenkins
if [ "$1" -eq "jenkins" ]
then
	./installJenkins.sh
fi


#installation de package
if [ "$1" -eq "packageInstall" ]
then
	./packageInstall.sh
fi


#MaJ du system
if [ "$1" -eq "sysUpdate" ]
then
	./sysUpdate.sh
fi


#listage des paquets
if [ "$1" -eq "packageList" ]
then
	./packageList.sh
fi


#suppression de package
if [ "$1" -eq "packageDel" ]
then
	./packageDel.sh
fi


#ajout d'un utilisateur
if [ "$1" -eq "userAdd" ]
then
	./userAdd.sh
fi

#ajout d'un groupe
if [ "$1" -eq "groupAdd" ]
then
	./groupAdd.sh
fi

#liste les groupes d'un utilisateur
if [ "$1" -eq "groupList" ]
then
	./groupList.sh
fi

# status d'un service
if [ "$1" -eq "serviceStatus" ]
then
	./serviceStatus.sh
fi

#service restart
if [ "$1" -eq "serviceRestart" ]
then
	./serviceRestart.sh
fi


#service toggle
if [ "$1" -eq "serviceToggle" ]
then
	./serviceToggle.sh
fi




