#!/bin/bash

set -e

echo "=== Preparing VM for Template Conversion ==="

echo "Clearing machine-id..."
truncate -s 0 /etc/machine-id
rm -f /var/lib/dbus/machine-id

echo "Removing SSH host keys..."
rm -f /etc/ssh/ssh_host_*

echo "Clearing logs..."
rm -rf /var/log/*

echo "Clearing bash history..."
history -c
rm -f /root/.bash_history
rm -f /home/*/.bash_history
chmod +x firstboot.sh
echo "Template preparation complete."
echo "Shutdown VM and convert to template."
