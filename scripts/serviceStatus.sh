#!/bin/bash


# affiche le status d'un service

read -p service "Service à scruter :"
systemctl status $service
