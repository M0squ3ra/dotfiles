#! /bin/bash
#Pacman
if ! [[ "$EUID" = 0 ]]; then
	sudo true
fi
sudo pacman -S --noconfirm --needed \
alacritty \
adwaita-icon-theme \
audacity \
base-devel git \
bashtop \
blueman bluedevil bluez-utils bluez \
breeze-icons \
docker docker-compose \
dunst \
fuse ntfs-3g \
gamemode \
go \
kdenlive \
libreoffice-fresh \
lutris \
mixxx \
nvidia-settings nvidia-utils nvidia-lts nvidia lib32-virtualgl lib32-nvidia-utils vulkan-icd-loader lib32-vulkan-icd-loader \
nemo \
nitrogen \
openssh \
okular \
postman \
polybar \
pipewire \
pipewire-pulse \
powerline powerline-fonts \
pavucontrol-qt \
picom \
python-pip \
rofi \
steam \
ssh-keygen \
scrot \
sddm \
transmission-gtk \
tor torbrowser-launcher \
unzip \
unrar \
vlc \
virt-manager qemu-desktop libvirt edk2-ovmf dnsmasq iptables-nft \
wine \
xclip \
xprop \
zsh 

