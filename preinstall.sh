#!/bin/bash

sudo add-apt-repository ppa:lutris-team/lutris -y
sudo add-apt-repository ppa:graphics-drivers/ppa -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key -O - | sudo apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y

sudo apt update && sudo apt dist-upgrade -y

sudo apt install -y wget apt-transport-https
sudo wget -O /usr/share/keyrings/riot-im-archive-keyring.gpg https://packages.riot.im/debian/riot-im-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/riot-im-archive-keyring.gpg] https://packages.riot.im/debian/ default main" | sudo tee /etc/apt/sources.list.d/riot-im.list
sudo apt update

wget -O /tmp/dropbox.deb -c https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb
sudo dpkg -i /tmp/dropbox.deb
sudo apt install -fy
rm /tmp/dropbox.deb
nautilus --quit

wget -O /tmp/code.deb -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i /tmp/code.deb
sudo apt install -fy
rm /tmp/code.deb

wget -O /tmp/mc.deb -c https://launcher.mojang.com/download/Minecraft.deb
sudo dpkg -i /tmp/mc.deb
sudo apt install -fy
rm /tmp/mc.deb

sudo apt install --install-recommends libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libsqlite3-0:i386 lutris libvulkan1 libvulkan1:i386 steam-installer winehq-staging openjdk-8-jre butt pavucontrol cpu-x synaptic gimp inkscape vlc mumble weechat git gnome-tweaks element-desktop folder-color -y

sudo usermod -aG plugdev $USER

flatpak update -y
flatpak install --user -y telegram discord spotify bitwarden lagrange
flatpak update -y

sudo apt autoremove -y
sudo apt clean
