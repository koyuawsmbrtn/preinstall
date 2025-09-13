# Arch Linux Preinstall Scripts

Ansible playbook and scripts for setting up a fresh Arch Linux installation with GNOME desktop environment and essential applications.

## Features

- **Complete GNOME Desktop Setup**: Installs and configures GNOME from scratch
- **AUR Package Management**: Uses `kewlfft.aur` collection for reliable AUR package installation
- **Custom Desktop Configuration**: Background, favorites, extensions, and keyboard shortcuts
- **Optional Features**: Nvidia driver installation and TV mode setup
- **Idempotent**: Safe to run multiple times, won't break existing configurations

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

1. **Clean Arch Linux Installation**: This requires a fresh Arch Linux system installed using:
   - **Recommended**: `archinstall` with the **minimal profile** (includes base, linux, linux-firmware, networkmanager)
   - Alternative: Manual Arch installation with base system only
   - **Do not use** if you have existing desktop environments (GNOME, KDE, XFCE, etc.) or custom configurations

2. **Ansible**: Will be installed automatically by the playbook if not present
3. **AUR Helper**: The playbook uses `yay` as the AUR helper (installed automatically)

## Installation Process

### Step 1: Install Arch Linux
1. **Boot from Arch Linux ISO**
2. **Run archinstall**:
   ```bash
   archinstall
   ```
3. **Select "minimal" profile** (this ensures a clean base system)
4. **Configure your system** (users, disk, network, etc.)
5. **Complete the installation**

### Step 2: Setup Desktop Environment
1. **Clone or download this repository**:
   ```bash
   git clone <repository-url>
   cd preinstall
   ```

2. **Run the playbook** (Ansible will be installed automatically if needed):
   ```bash
   ansible-playbook arch-ansible.yml
   ```

3. **Follow the prompts** for:
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
