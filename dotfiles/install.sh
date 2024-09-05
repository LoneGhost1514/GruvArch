#!/usr/bin/bash

echo "The Installer Is Starting ..."

echo"Setting Up Wallpapers"

$(cd ..)
$(cp -R Wallpapers/ /usr/share/backgrounds/gnome)

echo"Successfully copied wallpapers"

echo "Performing System Update"
$(sudo pacman -Syu)

read -p "Select from the following conditions
1.Full Install
2.Minimal Install
3.Coding Workspace
Enter Your Choice : "  number

# Check the input and print the corresponding message
if [ "$number" -eq 1 ]; then
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

elif [ "$number" -eq 2 ]; then
    echo "Setting Up minimal installation"
    $(sudo pacman -S brave-broser firefox nano code)
elif [ "$number" -eq 3 ]; then
   echo "Setting Up Coding Workspace"
   $(sudo pacman -S code git nano vim make qemu-full virt-manager npm firefox)
else
    echo "You have entered a wrong choice"
    echo "Restart The Script to continue"
    exit 1
fi

echo "Performing System Update"
$(sudo pacman -Syu)

echo "The Programs have been successfully installed"
