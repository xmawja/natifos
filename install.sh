#!/bin/sh
#
# XOSX is a lightweght free/open source operating system based on UNIX/LINUX distributions OS. 
########################################################################
#                         Environment Variables                        #
#########################################################################
# Directorys 
CFG=$HOME/.cfg

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

#### DOTFILES
# delete old cfg file if exist
if [ -d "$CFG" ]; then
	printf '%b %s\n' "${YELLOW}Removing cfg... ($CFG) ${NC}"
	rm -rf "$CFG"
	printf '%b %s\n' "${GREEN}Removing cfg ${RED}DONE.  ${NC} \n"
fi

# clone dotfiles bare repo
printf '%b %s\n' "${PURPLE}Clonnig Dotfiles... ($CFG) ${NC}"
git clone --bare https://github.com/xmawja/dotfiles.git $HOME/.cfg
printf '%b %s\n' "${GREEN}Cloning Dotfiles ${RED}DONE. ${NC} \n"

# add dotfiles alisas 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# remove bash releated files if existing
printf '%b %s\n' "${PURPLE}Removing bash old releated files... ${NC}"
rm $HOME/.bash_history
rm $HOME/.bash_logout
rm $HOME/.bash_profile
rm $HOME/.bashrc
printf '%b %s\n' "${GREEN}Removing bash old releated files ${RED}DONE. ${NC} \n"

# checkout dofiles repo
printf '%b %s\n' "${PURPLE}Checkingout Dotfiles... ($CFG) ${NC}"
config checkout
printf '%b %s\n' "${GREEN}Checkout Dotfiles ${RED}DONE. ${NC} \n"