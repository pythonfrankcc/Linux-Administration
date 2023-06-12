#Networking and Configuration Files
#iproute2 tools: thesea are tools intended to do away with old net tools and include the IP and SS commands

#Syntax of the IP command
ip [options] object command
#object can be addr(IPV4 or IPV6 addresses), link(Network Device), route(Routing Table Entry)
#command can be add, delete or show or list

[root@OCS ~]# ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
 inet 127.0.0.1/8 scope host lo
 valid_lft forever preferred_lft forever
Interface Management
115
 inet6 ::1/128 scope host
 valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
 link/ether 08:00:27:b0:dd:dc brd ff:ff:ff:ff:ff:ff
 inet 192.168.1.26/24 brd 192.168.1.255 scope global dynamic
enp0s3
 valid_lft 2384sec preferred_lft 2384sec
 inet 192.168.1.24/16 brd 192.168.255.255 scope global enp0s3
 valid_lft forever preferred_lft forever
 inet6 fe80::a00:27ff:feb0:dddc/64 scope link
 valid_lft forever preferred_lft forever


#the ip command was intended to do away with ipconfig, arp and route utilities

#ss command is used to display socket information. Think of a socket as an existing network connection between two systems.
#syntax is ss [options]
[root@OCS ~]# ss | wc -l
[root@OCS ~]# ss | head
Netid State Recv-Q Send-Q Local Address:Port Peer Address:Port
u_str ESTAB 0 0 /var/run/dovecot/anvil 23454966 * 23454965
u_str ESTAB 0 0 /var/run/dovecot/anvil 23887673 * 23887672
u_str ESTAB 0 0 /run/systemd/journal/stdout 13569 * 13568
u_str ESTAB 0 0 * 13893 * 13894
u_str ESTAB 0 0 * 13854 * 13855
u_str ESTAB 0 0 * 13850 * 13849
u_str ESTAB 0 0 * 68924 * 68925
u_str ESTAB 0 0 * 17996 * 17997
u_str ESTAB 0 0 /var/run/dovecot/config 9163531 * 9163871

#the Networking Manager is a software that is used to manage network devices in linux with the primary configuration tool being nmcli
#nmcli is designed to detect and configure netwoek connections


[root@OCS ~]# ls /etc/sysconfig/network-scripts/
ifcfg-eth0 ifdown-Team ifup-plusb
ifcfg-lo ifdown-TeamPort ifup-post
ifdown ifdown-tunnel ifup-ppp
ifdown-bnep ifup ifup-routes
ifdown-eth ifup-aliases ifup-sit
ifdown-ippp ifup-bnep ifup-Team
ifdown-ipv6 ifup-eth ifup-TeamPort
ifdown-isdn ifup-ippp ifup-tunnel
ifdown-post ifup-ipv6 ifup-wireless
ifdown-ppp ifup-ipx init.ipv6-global
ifdown-routes ifup-isdn network-functions
ifdown-sit ifup-plip network-functions-ipv6
#you can probably guess what a configuration file is used for based on its name. For example, the ifup-wireless file is used to configure wireless networks


#The file most commonly edited is ifcfg-interface, where interface is the name of the network interface. For example, ifcfg-eth0 is used to configure the eth0 device, as shown here:
[root@OCS ~]# more /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
BOOTPROTO=static
ONBOOT=yes #this means that it activates during boot
IPADDR=192.168.0.100
NETMASK=255.255.255.0
GATEWAY=192.168.0.1

#NSSWITCH refers to the Name Service Switch, which is a tool for determining where the system will look for name resolution

#The NSS configuration file, /etc/nsswitch.conf, is used by applications to determine the sources from which to obtain name-service information and in what order.
[root@onesourcesource ~]#grep hosts /etc/nsswitch.conf
#hosts: db files nisplus nis dns
hosts: files dns

#In this example, files dns means “look at the local /etc/hosts file first and then look at the DNS server if the required translation isn’t in the local file.”

#/etc/resolv.conf file contains a list of the DNS servers for the system
[root@OCS ~]# cat /etc/resolv.conf
search sample999.com
nameserver 192.168.1

#If you are using a utility such as NetworkManager to configure your network settings or if you are using a DHCP client, then this file is normally populated by those utilities. For servers, this 
#file is typically manually defined.

#There can be up to 3 nameservers in this file


#the systemd utility can be used to enable and disable network functionality. 

#resolvectl command can perform DNS lookups
[root@OCS ~]# resolvectl query google.com
google.com: 142.250.189.238


#Bind-utils is a software package that provides many of the commonly used commands for performing DNS queries which include dig, nslookup and host



#After a connection is established with an SSH server, the SSH client stores the server’s unique fingerprint key in the user’s .ssh/known_hosts file, as shown here:
[root@OCS ~]# cat .ssh/known_hosts
|1|trm4BuvRf0HzJ6wusHssj6HcJKg=|EruYJY709DXorogeN5Hdcf6jTCo=
 ecdsa-sha2-nistp256AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzd
 HAyNTYAAABBBG3/rARemyZrhIuirJtfpfPjUVnph9S1w2NPfEWec/f59V7nA
 ztn5rbcGynNYOdnozdGNNizYAiZ2VEhJ3Y3JcE=


#Users can customize how commands like ssh, scp, and sftp work by creating the ~/.ssh/config file. 


#curl command allows for noninteractive data transfer from a large number of protocols
#Although the curl command supports more protocols than the wget command, the wget command can perform recursive downloads and can recover from failed download attempts, so it is advantageous in 
#certain situations

#wget command is designed to be a noninteractive tool for downloading files from remote systems via HTTP, HTTPS, or FTP