#!/bin/bash

#    Copyright (C) 2021 koyu
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program. If not, see <https://www.gnu.org/licenses/>.

echo "koyu's little preinstall script"
echo "Version 1.0"
echo -e

###################################################
###################################################
###     This script is made to be modular.      ###
###                                             ###
### Just delete the sections you don't need and ###
###             make it your own.               ###
###################################################
###################################################

# Dependencies
sudo apt install -y wget apt-transport-https curl

# Third-party repositories
sudo add-apt-repository ppa:mumble/release -y
sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list

# Upgrade system
sudo apt update && sudo apt dist-upgrade -y

# Third-party DEB files
# Dropbox
wget -O /tmp/dropbox.deb -c https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb
sudo dpkg -i /tmp/dropbox.deb
sudo apt install -fy
rm /tmp/dropbox.deb
nautilus --quit

# Visual Studio Code
wget -O /tmp/code.deb -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i /tmp/code.deb
sudo apt install -fy
rm /tmp/code.deb

# Mullvad
wget -O /tmp/mullvad.deb -c https://mullvad.net/download/app/deb/latest/
sudo dpkg -i /tmp/mullvad.deb
sudo apt install -fy
rm /tmp/mullvad.deb

# Element
sudo apt install -y element-desktop

# Enable dark mode on Chrome
chmod +x chrome-enable-dark-mode.sh
./chrome-enable-dark-mode.sh

# Software found in repositories
sudo apt install --install-recommends openjdk-8-jre pavucontrol cpu-x synaptic gimp inkscape vlc mumble weechat git gparted curl ubuntu-restricted-extras -y

# Amfora
sudo wget -O /usr/bin/amfora -c "https://github.com/makeworld-the-better-one/amfora/releases/download/v1.9.2/amfora_1.9.2_linux_64-bit"
sudo chmod +x /usr/bin/amfora

# Snaps
# Double-refresh if the device hasn't been seeded yet
sudo snap refresh
sleep 3
sudo snap refresh

# Continue installing snaps
# Using Spotify Edge to fix album covers in notification bar
sudo snap install spotify --edge

# Install all the other snaps
sudo snap install telegram-desktop bitwarden joplin-desktop skype teams-insiders discord mattermost-desktop

# MS Fonts
mkdir -p ~/.fonts
wget -qO- http://plasmasturm.org/dl/vistafonts-installer | bash

# Cleanup
sudo apt clean
sudo apt autoremove -y

# Printing post-install steps
echo -e
echo "Done!"
echo -e
echo "Post-Install steps:"
echo " - Reboot system"
echo " - Activate Livepatch if not done already"
echo " - Install necessary drivers like OpenRazer+Polychromatic or latest Nvidia (if you need them)"
echo " - Install game launchers like Lutris or Steam and compatibility layers for games like Wine if needed"
echo " - Reboot system again if you installed drivers"
echo " - Authorize and set up applications"
echo -e
echo "To install Nvidia drivers refer to this manual: https://github.com/lutris/docs/blob/master/InstallingDrivers.md#nvidia"
echo -e
echo "Thanks for using my script! Have a great day and a cookie 🍪️"
