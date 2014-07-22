### Set-up-IP-static-on-Ubuntu-12.04
================================
Đây là file dùng để cài đặt địa chỉ IP tĩnh cho máy ubuntu 12.02 với địa chỉ 
* IP tĩnh là 192.168.1.240
* Gateway 192.168.1.254
* dns-nameserver 8.8.8.8
* Và cài cho cổng eth0

> *Note:* đây là file mang tính chất demo về bash shell nên độ tự động hóa và giao tiếp vơi người dùng không cao

**Giả sử:** Giải mạng nhà bạn là `172.16.1.0` và có gateway `172.16.1.1` thì sẽ chỉnh sửa lại file như này

```
#!/bin/sh
echo "Đây là chương trình cài địa chỉ IP tĩnh cho máy"
echo "Ip tĩnh của máy là 172.16.1.240"
echo "auto lo" > /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo "#card eth0" >> /etc/network/interfaces
echo "auto eth0" >> /etc/network/interfaces
echo "iface eth0 inet dhcp" >> /etc/network/interfaces
echo "address 172.16.1.240" >> /etc/network/interfaces
echo "netmask 255.255.255.0" >> /etc/network/interfaces
echo "dns-nameserver 8.8.8.8" >> /etc/network/interfaces
echo "gateway 172.16.1.1" >> /etc/network/interfaces
ifdown eth0 && ifup eth0
echo "Qua trình cài đặt địa chỉ IP tĩnh cho máy đã xong!!! xem nhé:"
sleep 1
cat /etc/network/interfaces
echo "================="

echo "Ip tinh cua may la:" 
ifconfig eth0 | grep -w 'inet' | awk '{print $2}' | awk -F':' '{print $2}'
echo "Ping thu nhe:"
ping -c 4 google.com
```

#### Xong các việc về file chúng ta sẽ chạy nó bằng cách:

```root@example#sh [ten file vừa tạo]```
