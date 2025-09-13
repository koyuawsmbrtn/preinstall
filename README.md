# Arch Linux Preinstall Scripts

Ansible playbook and scripts for setting up a fresh Arch Linux installation with GNOME desktop environment and essential applications.

## Features

- Automated Arch Linux system configuration
- GNOME desktop environment setup with extensions
- AUR package management using `kewlfft.aur` collection
- Customizable favorites and desktop settings
- Optional Nvidia driver installation
- TV mode setup for media center use

## Configuration Files

### `favorites.txt`
This file contains the GNOME Shell favorites (dock applications) that will be configured. You can easily customize this by editing the file:

- Add one application desktop file per line
- Lines starting with `#` are comments and will be ignored
- Empty lines are ignored
- Desktop files can be found in `/usr/share/applications/` or `~/.local/share/applications/`

Example:
```
# My favorite applications
org.gnome.Nautilus.desktop
firefox.desktop
code.desktop
```

## Prerequisites

1. **Fresh Arch Linux Installation**: This assumes you have a basic Arch Linux system installed
2. **Ansible**: Install Ansible on your system:
   ```bash
   sudo pacman -S ansible
   ```
3. **AUR Helper**: The playbook uses `yay` as the AUR helper (installed automatically)

## Quick Start

1. **Clone or download this repository**:
   ```bash
   git clone <repository-url>
   cd preinstall
   ```

2. **Install Ansible collections**:
   ```bash
   ansible-galaxy collection install -r requirements.yml
   ```

3. **Run the playbook**:
   ```bash
   ansible-playbook arch-ansible.yml
   ```

4. **Follow the prompts** for:
   - Nvidia driver installation
   - TV mode setup

## Customization

### Package Lists
- **`arch`**: Contains AUR packages to install
- **`favorites.txt`**: GNOME Shell favorites configuration
- **`background.jpg`**: Custom background image

### Desktop Settings
The playbook configures:
- Dark theme with Adwaita GTK theme
- Custom background image
- GNOME Shell extensions
- Keyboard shortcuts (including custom Terminal and Mission Center shortcuts)
- Dash to Dock settings

### System Configuration
- Chaotic-AUR repository setup
- NetworkManager and Bluetooth configuration
- CUPS printer support
- Autostart applications
