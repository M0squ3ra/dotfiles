#! /bin/bash
#Pacman
if ! [[ "$EUID" = 0 ]]; then
	sudo true
fi


PS3="Select option: "

select opt in Basico Nvidia Extra Laptop DevOps Java Quit; do
	case $opt in
		Basico)
			echo "Basico"
			sudo pacman -S --noconfirm --needed \
				alacritty \
				adwaita-icon-theme \
				base-devel git \
				blueman bluedevil bluez-utils bluez \
				breeze-icons \
				ctags \
				dunst \
				nemo \
				neofetch \
				neovim \
				network-manager network-manager-applet network-manager-openvpn openvpn \
				nitrogen \
				npt \
				openssh \
				okular \
				polybar \
				pipewire \
				pipewire-pulse \
				powerline powerline-fonts \
				pavucontrol-qt \
				picom \
				ripgrep \
				rofi \
				scrot \
				unzip \
				unrar \
				xclip \
				xorg-xprop \
				xorg-server xorg-apps xorg-xinit i3-wd \
				xss-lock \
				zsh
			;;
		Nvidia)
			echo "Nvidia"
			sudo pacman -S --noconfirm --needed nvidia-settings nvidia-utils nvidia-lts nvidia lib32-virtualgl lib32-nvidia-utils vulkan-icd-loader lib32-vulkan-icd-loader 
			;;
		Extra)
			echo "Extra"
			sudo pacman -S --noconfirm --needed \
				audacity \
				bashtop \
				fuse ntfs-3g \
				gamemode lib32-gamemode \
				go \
				kcharselect \
				kdenlive \
				libreoffice-fresh \
				lutris \
				mixxx \
				openrgb \
				python-pip \
				steam \
				sddm \
				transmission-gtk \
				tor torbrowser-launcher \
				vlc \
				virt-manager qemu-desktop libvirt edk2-ovmf dnsmasq iptables-nft \
				wine \
				xautolock 
			;;
		Laptop)
			echo "Laptop"
			sudo pacman -S --noconfirm --needed sof-firmware
			;;
		DevOps)
			echo "DevOps"
			sudo pacman -S --noconfirm --needed \
				docker \
				docker-compose \
				kubectl \
				minikube \
				helm
			;;
		Java)
			echo "Java"
			sudo pacman -S --noconfirm --needed \
				jdk17-openjdk \
				maven
			;;
		Quit)
			break;;
		*)
			echo "Invalid option $REPLY"
			;;
	esac
done

