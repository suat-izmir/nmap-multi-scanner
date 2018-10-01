#!/bin/bash

# Date : 1/10/2018
# Author : Suat IZMIR
# v1.1
# Description: Automated multiple Nmap Scanner. 
# Walkthrough: 
# 1 - put target ips on 'scope.txt' file
# 2 - the script create target-{target ip/hostname} which contains
# basic nmap scan (nmap IP) of open ports and complete nmap.



if [ -s scope.txt ]
then

	for ip in $(cat scope.txt);
	do mkdir 'target-'$ip;
	cd 'target-'$ip;
	echo '[+] Start simple scan of' $ip' beggins';
	nmap $ip | grep open > 'nmap-base'$ip'.txt';
	echo '[+] Start complete scan of' $ip' beggins';
	nmap -A -p- $ip --open > 'nmap-complete'$ip'.txt';
	grep open 'nmap-complete'$ip'.txt' > 'nmap-services.txt';
	cd '../';
	echo '[+] The scan of' $ip 'is complete';
        done
	


else
        echo 'Please add target IP/host into scope.txt file';
fi
