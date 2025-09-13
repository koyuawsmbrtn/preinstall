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

echo "koyu's Arch Linux preinstall script"
echo "Version 2.0 - Arch Linux Edition"
echo -e

# Check if running on Arch Linux
if ! command -v pacman &> /dev/null; then
    echo "Error: This script is designed for Arch Linux only."
    echo "Please use the Ansible playbook for automated setup:"
    echo "  ansible-playbook arch-ansible.yml"
    exit 1
fi

# Check if this is a clean installation
if command -v gnome-session &> /dev/null; then
    echo "Warning: GNOME appears to be already installed."
    echo "This script is designed for clean Arch Linux installations using archinstall minimal profile."
    echo "Continue anyway? (y/N)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Exiting. Please use archinstall with minimal profile for best results."
        exit 1
    fi
fi

echo "Detected Arch Linux system. Proceeding with setup..."
echo -e

# Install Ansible if not present
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    sudo pacman -S --noconfirm ansible
fi

# Install AUR collection
echo "Installing Ansible AUR collection..."
ansible-galaxy collection install -r requirements.yml

# Run the main Ansible playbook
echo "Running Arch Linux setup playbook..."
ansible-playbook arch-ansible.yml --ask-become-pass

echo -e
echo "Done!"
echo -e
echo "Post-Install steps:"
echo " - Reboot system"
echo " - Install necessary drivers if needed"
echo " - Authorize and set up applications"
echo " - Customize your desktop further"
echo -e
echo "Thanks for using my script! Have a great day and a cookie 🍪️"