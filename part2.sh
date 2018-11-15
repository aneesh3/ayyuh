cat <<EOT >> /etc/dhcpcd.conf
interface wlan0
    static ip_address=192.168.4.1/24
    nohook wpa_supplicant
EOT
sudo service dhcpcd restart
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig  
touch /etc/dnsmasq.conf
cat <<EOT>> /etc/dnsmasq.conf
interface=wlan0
  dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h
EOT
touch /etc/hostapd/hostapd.conf
cat <<EOT>> /etc/hostapd/hostapd.conf
interface=wlan0
driver=nl80211
ssid=NameOfNetwork
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=AardvarkBadgerHedgehog
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
EOT
mv /etc/defaults/hostapd /etc/defaults/hostapd.orig
touch /etc/defaults/hostapd
cat <<EOT> /etc/defaults/hostapd
DAEMON_CONF="/etc/hostapd/hostapd.conf"
DAEMON_OPTS="/etc/hostapd/hostapd.conf"
EOT
sudo systemctl start hostapd
sudo systemctl start dnsmasq
echo Done, now edit the sysctl file.