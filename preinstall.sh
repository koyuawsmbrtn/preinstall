#!/bin/bash

#    Copyright (C) 2021-2022 koyu
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

# yt-dlp
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp

# Upgrade system
sudo apt update && sudo apt dist-upgrade -y

# Third-party DEB files
# Visual Studio Code
wget -O /tmp/code.deb -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i /tmp/code.deb
sudo apt install -fy
rm /tmp/code.deb

# AppImage Launcher
wget -O /tmp/appimagelauncher.deb -c https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo dpkg -i /tmp/appimagelauncher.deb
sudo apt install -fy
rm /tmp/appimagelauncher.deb

# TeamViewer
wget -O /tmp/teamviewer.deb -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i /tmp/teamviewer.deb
sudo apt install -fy
rm /tmp/teamviewer.deb

# Software found in repositories
sudo apt install --install-recommends openjdk-8-jre pavucontrol cpu-x synaptic gimp inkscape vlc weechat git gparted curl ubuntu-restricted-extras mlocate transmission-gtk p7zip libreoffice-style-breeze fonts-firacode hugo ffmpeg rclone -y

# Amfora
sudo wget -O /usr/bin/amfora -c "https://github.com/makeworld-the-better-one/amfora/releases/download/v1.9.2/amfora_1.9.2_linux_64-bit"
sudo chmod +x /usr/bin/amfora

# Snaps
# First refresh snapd twice to seed the device
sudo snap refresh
sleep 3
sudo snap refresh
# Now install the actual Snaps
sudo snap install bitwarden spotify telegram-desktop teams-insiders zulip graphmaker bbzcloud p3x-onenote postman

# MS Fonts
mkdir -p ~/.fonts
cd ~/.fonts
wget https://content.koyu.space/fonts.7z
7z e fonts.7z -aoa
rm -f fonts.7z
cat <<EOT > ~/.fonts.conf
<!-- disable embedded bitmaps in fonts to fix Calibri, Cambria, etc. -->
<match target="font">
   <edit mode="assign" name="embeddedbitmap"><bool>false</bool></edit>
</match>
EOT
sudo fc-cache -v -f

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
