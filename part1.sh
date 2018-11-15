#!/bin/bash

echo Script has been loaded.
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install dnsmasq hostapd
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd
sudo reboot