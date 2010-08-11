From: Hauke Hoffmann <kontakt@hauke-hoffmann.net>
Subject: Some problems with NAT, can't connect fo a few hosts, but the rest works
Date: Thu, 12 Aug 2010 01:50:17 +0200
Message-ID: <201008120150.17545.kontakt@hauke-hoffmann.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have a Linux server (2.6.29.6-grsec) which is connected to the Internet and 
is configured to work as a NAT.

From the local clients, I can surf through the web, as example google.de. 
Thats works.

But there exists a few hosts (eg www.deutsche-finanzagentur.de or 
www.hoelleinshop.com), which the clients can't connect with.
With any Browser Firefox/Chrome on Linux/Windows, I see only the message 
waiting for ...

wget  http://www.deutsche-finanzagentur.de #running on server works fine
wget  http://www.deutsche-finanzagentur.de #on a client didnt' work
wget  http://google.de                                   #on a client works .

And there are problems with ssh, too.
If i login from the server to my university ssh server (ssh.rz.tu-harburg.de), 
it works,
but if i start ssh on a client the connections frezes after reciving a lot of 
output (eg `cat /etc/fstab`).

If you have an idea, please feel free to tell me what Im' doing wrong.

Regards
     Hauke

Attached Data:
 - my routing script ("set.sh")
Outputs:
 - Running wget on a client 



Routing script
===========================================================

#!/bin/bash

# Routing-SCRIPT for roadrunner.local


iptables () { echo $@; /sbin/iptables $@; }

enable () { for file in $@; do echo 1 > $file; done }
disable () { for file in $@; do echo 0 > $file; done }

acceptInput()
{
	iptables -A INPUT -i $1 -s $2  -j ACCEPT
}


# enables an dhcp server
# usage: acceptDHCP <interface> <server-ip>
acceptDHCP()
{
	DHCP_DEVICE=$1
	DHCP_SERVER=$2
	# dhcp-server <-> dhcp-relay
	iptables -A OUTPUT -p udp -s $DHCP_SERVER --sport 67                 --dport 
67 -j ACCEPT
	iptables -A INPUT -i $DHCP_DEVICE -p udp                  --sport 67 -d 
$DHCP_SERVER --dport 67 -j ACCEPT
	
	# dhcp-server <-> dhcp-client
	iptables -A OUTPUT -p udp -s $DHCP_SERVER --sport 67                 --dport 
68 -j ACCEPT
	iptables -A INPUT -i $DHCP_DEVICE -p udp                  --sport 68 -d 
$DHCP_SERVER --dport 67 -j ACCEPT
	
	# bcast dhcp-client -> dhcp-server
	iptables -A INPUT -i $DHCP_DEVICE -p udp -s 0.0.0.0 --sport 68 -d 
255.255.255.255 --dport 67 -j ACCEPT
}

#usage <tcp/udp> <port>
acceptLocal()
{
	iptables -A INPUT -i $iface_local 	-s $net_local -p $1 --dport $2 -j ACCEPT
	iptables -A INPUT -i $iface_vpn		-s $net_vpn -p $1 --dport $2 -j ACCEPT
}

#usage <tcp/udp> <port>
accept()
{
	iptables -A INPUT -p $1 --dport $2 -j ACCEPT
}


enable /proc/sys/net/ipv4/icmp_echo_ignore_all
enable /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
disable /proc/sys/net/ipv4/conf/*/accept_source_route
enable /proc/sys/net/ipv4/conf/*/rp_filter
enable  /proc/sys/net/ipv4/conf/*/accept_redirects
disable /proc/sys/net/ipv4/conf/*/secure_redirects
disable /proc/sys/net/ipv4/conf/*/send_redirects
enable /proc/sys/net/ipv4/conf/*/log_martians
enable /proc/sys/net/ipv4/tcp_syncookies

function createChain {
	name=$1
	echo "Create chain '$name'"
	iptables -F $name 2> /dev/null
	iptables -X $name 2> /dev/null
	iptables --new-chain $name
}

iface_local="br0"
iface_wlan="ath0"
iface_inet="ppp0"
iface_vpn="tun0"

ip_local="192.168.2.30"
ip_wlan="192.168.100.30"
ip_vpn="192.168.3.1"

net_my="192.168.0.0/16"

net_local="192.168.2.0/24"
net_wlan="192.168.100.0/24"
net_vpn="192.168.3.0/24"
net_localhost="127.0.0.1/255.255.255.255"

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP
iptables -F
iptables -X
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t nat -X



echo 1 > /proc/sys/net/ipv4/ip_forward

echo 1 > /proc/sys/net/ipv4/ip_dynaddr


###########################################
#                                         #
# i n p u t                               #
#                                         #
###########################################
iptables -A INPUT -i lo -j ACCEPT

acceptDHCP $iface_local $ip_local
acceptDHCP $iface_wlan	$ip_wlan

createChain input_trusted   	
createChain input_internet  	
createChain input_wlan      	

iptables -A INPUT -i $iface_local	-s $net_local	-j input_trusted
iptables -A INPUT -i $iface_vpn		-s $net_vpn	-j input_trusted

iptables -A INPUT -i $iface_inet	-s ! $net_my	-j input_internet
iptables -A INPUT -i $iface_wlan	-s $net_wlan	-j input_wlan


iptables -A input_trusted	-j ACCEPT

# Accept dns
iptables -A input_wlan		-p tcp --dport 53	-j ACCEPT
iptables -A input_wlan		-p udp --dport 53	-j ACCEPT

iptables -A input_wlan		-j input_internet

# accppet http
#iptables -A input_internet	-p tcp --dport 80	-j ACCEPT

# accppet https
#iptables -A input_internet	-p tcp --dport 443	-j ACCEPT

# accept ssh
iptables -A input_internet	-p tcp --dport 22	-j ACCEPT 

# openvpn
iptables -A input_internet	-p udp --dport 1194	-j ACCEPT

#iptables -A FORWARD -i br0 -j ACCEPT


###########################################
#                                         #
# f o r w a r d                           #
#                                         #
###########################################
createChain forward_trusted
createChain forward_internet
createChain forward_wlan

iptables -A FORWARD -i $iface_local	-s $net_local	-j forward_trusted
iptables -A FORWARD -i $iface_vpn	-s $net_vpn	-j forward_trusted

iptables -A FORWARD -i $iface_inet	-s ! $net_my	-j forward_internet
iptables -A FORWARD -i $iface_wlan	-s $net_wlan	-j forward_wlan


iptables -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A forward_trusted -j ACCEPT



# NAT for Internet
iptables -A FORWARD	-i $iface_local	-s $net_local	-o $iface_inet 	-d ! 
$net_my						-j ACCEPT
iptables -A FORWARD	-i $iface_inet	-s ! $net_my 	-o $iface_local	-d 
$net_local	-m state --state RELATED,ESTABLISHED	-j ACCEPT

# NAT for VPN
iptables -A FORWARD	-i $iface_vpn			-o $iface_inet 								-j ACCEPT
iptables -A FORWARD	-i $iface_inet	 		-o $iface_vpn		-m state --state 
RELATED,ESTABLISHED		-j ACCEPT

# NAT for VPN
iptables -A FORWARD	-i $iface_vpn			-o $iface_local 	-j ACCEPT
iptables -A FORWARD	-i $iface_local	 		-o $iface_vpn		-j ACCEPT
	

iptables -t nat -A POSTROUTING -o $iface_inet -j MASQUERADE


===========================================================

Running wget on a client (same results on any client)
===========================================================
hauke@storm:~$ wget --debug http://www.deutsche-finanzagentur.de
DEBUG output created by Wget 1.11.4 on linux-gnu.

--2010-08-12 00:52:33--  http://www.deutsche-finanzagentur.de/
Resolving www.deutsche-finanzagentur.de... 217.111.111.198, 213.70.97.8
Caching www.deutsche-finanzagentur.de => 217.111.111.198 213.70.97.8
Connecting to www.deutsche-finanzagentur.de|217.111.111.198|:80... connected.
Created socket 3.
Releasing 0x0000000000646e40 (new refcount 1).

---request begin---
GET / HTTP/1.0
User-Agent: Wget/1.11.4
Accept: */*
Host: www.deutsche-finanzagentur.de
Connection: Keep-Alive

---request end---
HTTP request sent, awaiting response...
---response begin---
HTTP/1.1 302 Found
Date: Wed, 11 Aug 2010 22:52:32 GMT
Server: Apache
Location: http://www.deutsche-finanzagentur.de/de/startseite/
Content-Length: 235
Keep-Alive: timeout=15, max=100
Connection: Keep-Alive


---response end---
302 Found
Registered socket 3 for persistent reuse.
Location: http://www.deutsche-finanzagentur.de/de/startseite/ [following]
Skipping 235 bytes of body: [...] done.
--2010-08-12 00:52:33--  http://www.deutsche-finanzagentur.de/de/startseite/
Reusing existing connection to www.deutsche-finanzagentur.de:80.
Reusing fd 3.

---request begin---
GET /de/startseite/ HTTP/1.0
User-Agent: Wget/1.11.4
Accept: */*
Host: www.deutsche-finanzagentur.de
Connection: Keep-Alive

---request end---
HTTP request sent, awaiting response...  ######### <<< It hangs here!
===========================================================


