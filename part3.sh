sudo iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
echo Done, now edit rc.local with: iptables-restore < /etc/iptables.ipv4.nat