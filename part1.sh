#!/bin/bash
sudo su
echo Script has been loaded, running updates.
sudo apt-get update
echo Running upgrades.
sudo apt-get upgrade -y
echo Downloading files, afterwards stopping services to reboot.
sudo apt-get install dnsmasq hostapd -y
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd
sudo reboot
