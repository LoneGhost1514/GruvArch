#!/usr/bin/bash

echo "The Installer Is Starting ..."

echo "Performing System Update"
$(sudo pacman -Syu)

echo "Installing General Programs"
$(sudo pacman -S gnome-tweaks brave-browser min firefox cava cmatrix )

echo "Installing Coding Software"
$(sudo pacman -S code git npm nano vim make python qemu-full virt-manager )

echo "Installing Yay"
$(sudo pacman -S --needed base-devel git)
$(cd ~)
$(git clone https://aur.archlinux.org/yay.git)
$(cd yay)
$(makepkg -si)

echo "Installing Additional Software"
$(sudo pacman -S anydesk zed zen)

echo "Performing System Update"
$(sudo pacman -Syu)
