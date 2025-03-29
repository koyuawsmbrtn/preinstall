#!/bin/bash
sudo pacman -S ansible --noconfirm --needed
ansible-playbook -i inventory --ask-become-pass arch-ansible.yml