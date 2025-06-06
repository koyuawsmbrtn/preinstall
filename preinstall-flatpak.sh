#!/bin/bash

#    Copyright (C) 2021-2025 koyu
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

# Flatpak setup
if ! command -v flatpak &> /dev/null
then
    echo "Flatpak not installed. Installing..."
    sudo apt install flatpak -y
fi
flatpak update -y
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak update -y

# Install applications via Flatpak
flatpak install --system flathub \
  com.bitwarden.desktop \
  com.spotify.Client \
  org.telegram.desktop \
  md.obsidian.Obsidian \
  io.github.equicord.equibop \
  org.gimp.GIMP \
  org.inkscape.Inkscape \
  org.videolan.VLC \
  org.libreoffice.LibreOffice \
  com.github.tchx84.Flatseal \
  it.mijorus.gearlever \
  org.localsend.localsend_app \
  de.schmidhuberj.DieBahn \
  org.signal.Signal \
  org.nickvision.tubeconverter \
  io.github.thetumultuousunicornofdarkness.cpu-x \
  app.zen_browser.zen \
  com.valvesoftware.Steam \
  com.heroicgameslauncher.hgl \
  io.gitlab.adhami3310.Impression \
  de.haeckerfelix.Fragments -y

# Printing post-install steps
echo -e
echo "Done!"
echo -e
echo "Post-Install steps:"
echo " - Reboot system"
echo " - Install game launchers like Lutris or Steam and compatibility layers for games like Wine if needed"
echo " - Reboot system again if you installed drivers"
echo -e
echo "Thanks for using my script! Have a great day and a cookie 🍪️"
