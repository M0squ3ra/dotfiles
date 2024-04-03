#! /bin/bash
# Aur
# Install yay
# git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

packages=(
	"autotiling"
	"brave-bin"
	"dracula-gtk-theme"
	"i3-gaps-rounded-git"
	"i3lock-color"
	"kubecolor"
	"mirage"
	"font-manager-git"
	"rofi-file-browser-extended-git"
	"rofi-greenclip"
	"luv-icon-theme-git"
	"sddm-sugar-dark"
)

if ! [[ "$EUID" = 0 ]]; then
	sudo true
fi


installed=$(pacman -Qm) 
for i in "${packages[@]}"
do
	if ! [[ -z $(echo $installed | grep ${i}) ]] ; then
   		echo "${i} already installed";
	else
		echo "installing $i"
		echo "S" | yay -S "$i" --answeredit All --answerclean All --answerdiff None
	fi;
done
