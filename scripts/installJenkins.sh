#!/bin/bash


# installation de jenkins


# quel OS ?
if [command -v yum]
then #yum - centOS 

	yum install default-jre
	yum install $package -y

else #apt - debian

	wget -q -O- https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
	sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \/etc/apt/sources.list.d/jenkins.list'
	apt-get install default-jre -y	
	apt-get install jenkins -y
fi

javapath=type -p java
echo "PATH=$path_java:$PATH" >> /etc/bash.bashrc
source /etc/bash.bashrc
systemctl restart jenkins


#PATH shenanigans
