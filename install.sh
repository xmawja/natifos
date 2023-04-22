#!/bin/sh
#
# XOSX is a lightweght free/open source operating system based on UNIX/LINUX distributions OS. 
########################################################################
#                         Environment Variables                        #
#########################################################################
# Colors output
BLACK="\033[1;90m"
RED="\033[1;91m"
GREEN="\033[1;92m"
YELLOW="\033[1;93m"
BLUE="\033[1;94m"
PURPLE="\033[1;95m"
CYAN="\033[1;96m"
WHITE="\033[1;97"
# No Color
NC="\033[0m"


#######################################################################
#                         install and setup                            #  
########################################################################
#### WARNING ...
# this script may delete some of your files 
# please take a break and read it whisly.
#
# yes or no prompte
printf '%b %s\n' "${RED}WARNING:${NC} ${YELLOW}This Script May Delete Some of your Files Please Take a Break and read it whisly! ${NC}" 

while true; do
	read -p "$(echo -e $YELLOW"Do You Want To Continue ? [Yes/No] "$NC)" yn
	case $yn in
		[Yy]* ) printf '%b %s\n' "${BLUE}Installing.... ${NC}"; break;;
		[Nn]* ) exit;;
		* ) printf '%b %s\n' "${RED}Please answer yes or no. ${NC}";;
	esac
done
