#!/bin/bash

set -e

echo "=== First Boot Setup ==="
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_FILE="$BASE_DIR/config.env"

# Load config
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Config file missing! Exiting."
    exit 1
fi

# Check hostname
if [ -z "$HOSTNAME" ]; then
    read -p "Enter hostname: " HOSTNAME
fi

# Check username
if [ -z "$USERNAME" ]; then
    read -p "Enter username: " USERNAME
fi

echo "Setting hostname..."
hostnamectl set-hostname "$HOSTNAME"

echo "Generating machine-id..."
systemd-machine-id-setup

echo "Generating SSH keys..."
ssh-keygen -A
systemctl restart ssh

echo "Creating user..."
adduser "$USERNAME"
usermod -aG sudo "$USERNAME"

echo "Removing config file..."
rm -f "$CONFIG_FILE"

echo "Removing this script..."
rm -f /usr/local/sbin/firstboot.sh

echo "First boot setup complete."
