#!/bin/bash

echo "koyu's little preinstall script"
echo "Version 1.0"
echo -e

# PPAs

sudo add-apt-repository ppa:mumble/release -y

# Upgrade system

sudo apt update && sudo apt dist-upgrade -y

# Third-party DEB files

wget -O /tmp/discord.deb -c https://discord.com/api/download/development?platform=linux
sudo dpkg -i /tmp/discord.deb
sudo apt install -fy
rm /tmp/discord.deb

wget -O /tmp/dropbox.deb -c https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb
sudo dpkg -i /tmp/dropbox.deb
sudo apt install -fy
rm /tmp/dropbox.deb
nautilus --quit

wget -O /tmp/code.deb -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i /tmp/code.deb
sudo apt install -fy
rm /tmp/code.deb

wget -O /tmp/chrome.deb -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/chrome.deb
sudo apt install -fy
rm /tmp/chrome.deb

wget -O /tmp/teams.deb -c https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders/teams-insiders_1.4.00.26453_amd64.deb
sudo dpkg -i /tmp/teams.deb
sudo apt install -fy
rm /tmp/teams.deb

# Software found in repositories

sudo apt install --install-recommends openjdk-8-jre pavucontrol cpu-x synaptic gimp inkscape vlc mumble weechat git gparted curl ubuntu-restricted-extras -y

# Snaps
# Double-refresh if the device hasn't been seeded yet

sudo snap refresh
sleep 3
sudo snap refresh

# Continue installing snaps

sudo snap install spotify --edge
sudo snap install telegram bitwarden p3x-onenote skype

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
