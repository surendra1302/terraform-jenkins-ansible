#!/bin/bash
set -e  # Exit on error

# Update packages
sudo apt update -y

# Install software-properties-common if missing
if ! command -v add-apt-repository &> /dev/null; then
    sudo apt install -y software-properties-common
fi

# Add Ansible PPA and install Ansible
if ! command -v ansible &> /dev/null; then
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
    echo 'Ansible installed successfully'
else
    echo 'Ansible is already installed'
fi

# Ensure the Ansible roles directory exists
sudo mkdir -p /etc/ansible/roles
sudo chown -R $(whoami) /etc/ansible/roles
