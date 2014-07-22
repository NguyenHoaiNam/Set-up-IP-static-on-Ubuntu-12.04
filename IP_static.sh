#!/bin/sh
echo "Đây là chương trình cài địa chỉ IP tĩnh cho máy"
echo "Ip tĩnh của máy là 192.168.1.240"
echo "auto lo" > /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo "#card eth0" >> /etc/network/interfaces
echo "auto eth0" >> /etc/network/interfaces
echo "iface eth0 inet dhcp" >> /etc/network/interfaces
echo "address 192.168.1.240" >> /etc/network/interfaces
echo "netmask 255.255.255.0" >> /etc/network/interfaces
echo "dns-nameserver 8.8.8.8" >> /etc/network/interfaces
echo "gateway 192.168.1.1" >> /etc/network/interfaces
ifdown eth0 && ifup eth0
echo "Qua trình cài đặt địa chỉ IP tĩnh cho máy đã xong!!! xem nhé:"
sleep 1
cat /etc/network/interfaces
echo "================="

echo "Ip tinh cua may la:" 
ifconfig eth0 | grep -w 'inet' | awk '{print $2}' | awk -F':' '{print $2}'
echo "Ping thu nhe:"
ping -c 4 google.com
