#!/bin/bash

# Update the system
echo "Updating system packages..."
sudo apt update -y

# Install Apache2
echo "Installing Apache2..."
sudo apt install apache2 -y

# Enable Apache to start on boot
echo "Enabling Apache2 to start on boot..."
sudo systemctl enable apache2

# Start Apache service
echo "Starting Apache2 service..."
sudo systemctl start apache2

# Check Apache status
echo "Checking Apache2 status..."
sudo systemctl status apache2

# Allow HTTP and HTTPS traffic through the firewall
echo "Allowing HTTP and HTTPS traffic through the firewall..."
sudo ufw allow in "Apache Full"

# Output Apache version to verify installation
echo "Apache2 installation completed. Version:"
apache2 -v
