#!/bin/bash
sudo pacman -S ansible --noconfirm --needed
ansible-galaxy collection install -r requirements.yml
ansible-playbook -i inventory --ask-become-pass arch-ansible.yml