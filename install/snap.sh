#! /bin/bash
# Snap
# Install snap
# git clone https://aur.archlinux.org/snapd.git && cd snapd %% makepkg -si
# systemctl enable --now snapd.socket

packages=(
	"calibre"
	"discord"
	"postman"
	"shortwave"
	"uno-calculator"
)


if ! [[ "$EUID" = 0 ]]; then
	sudo true
fi

installed=$(ls -l /snap/bin) 
for i in "${packages[@]}"
do
	if ! [[ -z $(echo $installed | grep ${i}) ]] ; then
   		echo "${i} already installed";
	else
		echo "installing $i"
		sudo snap install $i
	fi;
done
