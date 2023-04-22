#!/bin/sh
#
# XOSX is a lightweght free/open source operating system based on UNIX/LINUX distributions OS. 
########################################################################
#                         Environment Variables                        #
#########################################################################
# Directorys 
CFG=$HOME/.cfg
OHMYWM=$HOME/.config/xosx/ohmywm
DWMBLOCKS=$HOME/.config/xosx/dwmblocks
TERMIX=$HOME/.config/xosx/termix
FUNMACS=$HOME/.emacs.d

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
	printf '%b %s\n' "${YELLOW}Removing old cfg... ($CFG) ${NC}"
	rm -rf "$CFG"
	printf '%b %s\n' "${GREEN}Remove old cfg ${RED}DONE.  ${NC} \n"
fi

# clone dotfiles bare repo
printf '%b %s\n' "${PURPLE}Clonnig Dotfiles... ($CFG) ${NC}"
git clone --bare https://github.com/xmawja/dotfiles.git $HOME/.cfg
printf '%b %s\n' "${GREEN}Clone Dotfiles ${RED}DONE. ${NC} \n"

# add dotfiles alisas 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# remove bash releated files if existing
printf '%b %s\n' "${PURPLE}Removing bash old releated files... ${NC}"
rm $HOME/.bash_history
rm $HOME/.bash_logout
rm $HOME/.bash_profile
rm $HOME/.bashrc
printf '%b %s\n' "${GREEN}Remove bash old releated files ${RED}DONE. ${NC} \n"

# checkout dofiles repo
printf '%b %s\n' "${PURPLE}Checkingout Dotfiles... ($CFG) ${NC}"
config checkout
printf '%b %s\n' "${GREEN}Checkout Dotfiles ${RED}DONE. ${NC} \n"


#######################################################################
#                           Desktop Environment                       #
#######################################################################
# XORG
#### install ohmywm window manager
# delete ohmywm directorty if exist
if [ -d "$OHMYWM" ]; then
	printf '%b %s\n' "${YELLOW}Removing old OhMyWm... ($OHMYWM) ${NC}"
	rm -rf "$OHMYWM"
	printf '%b %s\n' "${GREEN}Remove old OhMyWm ${RED}DONE. ${NC} \n"
fi
# clone ohmywm repo
printf '%b %s\n' "${PURPLE}Cloning ohmywm... ($OHMYWM) ${NC}"
git clone https://github.com/xmawja/ohmywm.git $HOME/.config/xosx/ohmywm
printf '%b %s\n' "${GREEN}Clone ohmywm ${RED}DONE. ${NC} \n"

# chenge directory
cd $HOME/.config/xosx/ohmywm
# installing..
printf '%b %s\n' "${CYAN}Installing ohmywm... ${NC}"
sudo make clean install
doas make clean install
printf '%b %s\n' "${GREEN}Install ohmywm ${RED}DONE. ${NC} \n"

#### install dwmblocks status bar
# delete dwmblocks directorty if exist
if [ -d "$DWMBLOCKS" ]; then
	printf '%b %s\n' "${YELLOW}Removing old dwmblocks... ($DWMBLOCKS) ${NC}"
	rm -rf "$DWMBLOCKS"
	printf '%b %s\n' "${GREEN}Remove old dwmblocks ${RED}DONE. ${NC} \n"
fi

# Clone dwmblock repo
printf '%b %s\n' "${PURPLE}Cloning dwmblocks... ($DWMBLOCKS) ${NC}"
git clone https://github.com/xmawja/dwmblocks.git $HOME/.config/xosx/dwmblocks
printf '%b %s\n' "${GREEN}Clone dwmblocks ${RED}DONE. ${NC} \n"

# chenge directory
cd $HOME/.config/xosx/dwmblocks
# installing ..
printf '%b %s\n' "${CYAN}Installing dwmblocks... ${NC}"
sudo make clean install
doas make celan install 
printf '%b %s\n' "${GREEN}Install dwmblocks ${RED}DONE. ${NC} \n"

#### install termix terminal emolution
# delete termix directorty if exist
if [ -d "$TERMIX" ]; then
	printf '%b %s\n' "${YELLOW}Removing old termix... ($TERMIX) ${NC}" 
	rm -rf "$TERMIX"
	printf '%b %s\n' "${GREEN}Remove old termix ${RED}DONE. ${NC} \n"
fi

# Clone termix repo
printf '%b %s\n' "${PURPLE}Cloning termix... ($TERMIX) ${NC}"
git clone https://github.com/xmawja/termix.git $HOME/.config/xosx/termix
printf '%b %s\n' "${GREEN}Clone termix ${RED}DONE. ${NC} \n"

# Chenge Directory
cd $HOME/.config/xosx/termix
# Installing ..
printf '%b %s\n' "${CYAN}Installing termix... ${NC}"
sudo make clean install
doas make clean install
printf '%b %s\n' "${GREEN}Install termix ${RED}DONE. ${NC} \n"


##################################################################
#                         Applications                           #
##################################################################
#### EMACS
# delete funmacs directorty if exist
if [ -d "$FUNMACS" ]; then
	printf '%b %s\n' "${YELLOW}Removing old funmacs... ($FUNMACS) ${NC}" 
	rm -rf "$FUNMACS"
	printf '%b %s\n' "${GREEN}Remove old funmacs ${RED}DONE. ${NC} \n"
fi

# Clone funmacs repo
printf '%b %s\n' "${PURPLE}Cloning funmacs... ($FUNMACS) ${NC}"
git clone https://github.com/xmawja/funmacs.git $HOME/.emacs.d
printf '%b %s\n' "${GREEN}Clone funmacs ${RED}DONE. ${NC} \n"
