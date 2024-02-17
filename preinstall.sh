#!/bin/bash

#    Copyright (C) 2021-2023 koyu
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

# Amfora
sudo wget -O /usr/bin/amfora -c "https://github.com/makeworld-the-better-one/amfora/releases/download/v1.9.2/amfora_1.9.2_linux_64-bit"
sudo chmod +x /usr/bin/amfora

# Upgrade system
sudo apt update && sudo apt dist-upgrade -y

# Third-party DEB files
# Visual Studio Code
wget -O /tmp/code.deb -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i /tmp/code.deb
sudo apt install -fy
rm /tmp/code.deb

# WineHQ
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo rm /etc/apt/sources.list.d/winehq*
codename=$(lsb_release -sc)
distro=$(lsb_release -si | awk '{print tolower($0)}')
sudo wget -nc -P /etc/apt/sources.list.d/ "https://dl.winehq.org/wine-builds/${distro}/dists/${codename}/winehq-${codename}.sources"
sudo apt -y update
sudo apt install --install-recommends wine-staging -y

# Software found in repositories
sudo apt install --install-recommends openjdk-17-jre pavucontrol cpu-x synaptic gimp inkscape vlc weechat git gparted curl mlocate transmission-gtk p7zip-full libreoffice-style-breeze fonts-firacode hugo ffmpeg zsh mailcap gajim libarchive-tools -y

# Notion
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
sudo apt update
sudo apt install notion-app -y

# koyu.space Repo
echo "deb [trusted=yes] https://repo.koyu.space/apt/ /" | sudo tee /etc/apt/sources.list.d/koyu.space.list
sudo apt update

# Mullvad
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
sudo apt install mullvad-vpn -y

# koyu.space Repo Software
sudo apt install rpi-imager discord -y

# Snaps or Flatpaks
if ! command -v snap &> /dev/null
then
  if ! command -v flatpak &> /dev/null
  then
    echo "Flatpak not installed. Installing..."
    sudo apt install flatpak -y
  fi
  flatpak update -y
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  flatpak update -y
  flatpak install bitwarden spotify -y
else
  sudo snap refresh
  sleep 3
  sudo snap refresh
  sudo snap install bitwarden spotify
fi

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
