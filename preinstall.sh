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

# Google Chrome
wget -O /tmp/chrome.deb -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/chrome.deb
sudo apt install -fy
rm /tmp/chrome.deb

# Lutris
wget -O /tmp/lutris.deb -c https://github.com/lutris/lutris/releases/download/v0.5.11/lutris_0.5.11_all.deb
sudo dpkg -i /tmp/lutris.deb
sudo apt install -fy
rm /tmp/lutris.deb

# Discord
wget -O /tmp/discord.deb -c "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i /tmp/discord.deb
sudo apt install -fy
rm /tmp/discord.deb

# WineHQ
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt update
sudo apt install --install-recommends winehq-staging -y

# AppImage Launcher
wget -O /tmp/appimagelauncher.deb -c https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo dpkg -i /tmp/appimagelauncher.deb
sudo apt install -fy
rm /tmp/appimagelauncher.deb
sudo apt install -y libfuse2

# Software found in repositories
sudo apt install --install-recommends openjdk-8-jre pavucontrol cpu-x synaptic gimp inkscape vlc weechat git gparted curl ubuntu-restricted-extras mlocate transmission-gtk p7zip-full libreoffice-style-breeze fonts-firacode hugo ffmpeg zsh mailcap steam nextcloud-desktop -y

# Amfora
sudo wget -O /usr/bin/amfora -c "https://github.com/makeworld-the-better-one/amfora/releases/download/v1.9.2/amfora_1.9.2_linux_64-bit"
sudo chmod +x /usr/bin/amfora

# Signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update
sudo apt install signal-desktop -y
sudo cp autostart/signal-tray.desktop /usr/share/applications

# Snaps
sudo snap refresh
sleep 3
sudo snap refresh
sudo snap install bitwarden spotify

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

# Autostart
cp -r autostart ~/.config

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
