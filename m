From: "Jacob Lear" <jlear@brammo.com>
Subject: Network Communication Issues
Date: Wed, 12 Dec 2007 09:28:44 -0800
Message-ID: <000b01c83ce4$71df9fb0$fe02a8c0@brammo.main>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

 
I'm having some problems with my network. I'm not sure if this is a firewall
problem or a network/hardware problem. Here's the backgrund:

We originally had a single 192.168.2.X subnet and they used a Linux server
(Red Hat EL 4 x64) as their router for the Internet. The router had a NIC
eth0 for the WAN/Internet and eth1 for the LAN (192.168.2.1). I was having
issues with my backups on that server in that the backup server would lose
its connection to the router for a few seconds and then it'd come back. To
remedy this (hopefully) I added a separate network strictly for backups.

All of our servers have a second NIC so I created a second network and added
all of the servers to it, including the router. The subnet is 192.168.1.X. I
used the same subnet mask of 255.255.255.0 and left the gateway entry blank.
All of the servers can communicate with each other just fine, except the
Linux router.

The problem is that communication with the Linux router isn't working
properly. I cannot ping the router from the other servers, but I CAN ping
the other servers from the router; however I receive a message in every ping
reply that says "wrong data byte #XX should be 0xXZ but was 0xXY".

What's even more strange is that I can ping the router's SAN NIC
(192.168.1.1) from my workstation which is on the main subnet just fine, as
well as the other servers on the SAN.

I've done some searching on the net and most people say that the common
cause of something like this is a firewall. The router is running iptables
for its firewall and for NAT. I've added entries to permit all internal
traffic and checked the log (it displays a message in syslog when it rejects
a packet) but it's not rejecting the traffic. None of the other servers are
running a firewall.

Here's the routing table from one of the Windows servers:

IPv4 Route Table
===========================================================================
Interface List
0x1 ........................... MS TCP Loopback interface
0x10003 ...00 13 72 53 09 02 ...... Intel(R) PRO/1000 MT Network Connection
#2
0x10004 ...00 13 72 53 09 01 ...... Intel(R) PRO/1000 MT Network Connection
===========================================================================
===========================================================================
Active Routes:
Network Destination Netmask Gateway Interface Metric
0.0.0.0 0.0.0.0 192.168.2.1 192.168.2.11 10
127.0.0.0 255.0.0.0 127.0.0.1 127.0.0.1 1
192.168.1.0 255.255.255.0 192.168.1.11 192.168.1.11 10
192.168.1.11 255.255.255.255 127.0.0.1 127.0.0.1 10
192.168.1.255 255.255.255.255 192.168.1.11 192.168.1.11 10
192.168.2.0 255.255.255.0 192.168.2.11 192.168.2.11 10
192.168.2.11 255.255.255.255 127.0.0.1 127.0.0.1 10
192.168.2.255 255.255.255.255 192.168.2.11 192.168.2.11 10
224.0.0.0 240.0.0.0 192.168.1.11 192.168.1.11 10
224.0.0.0 240.0.0.0 192.168.2.11 192.168.2.11 10
255.255.255.255 255.255.255.255 192.168.1.11 192.168.1.11 1
255.255.255.255 255.255.255.255 192.168.2.11 192.168.2.11 1
Default Gateway: 192.168.2.1
===========================================================================
Persistent Routes:
None

And here's the routing table from the Linux router:

Kernel IP routing table
Destination Gateway Genmask Flags Metric Ref Use Iface
66.241.66.224 * 255.255.255.240 U 0 0 0 eth0
192.168.2.0 * 255.255.255.0 U 0 0 0 eth1
192.168.1.0 * 255.255.255.0 U 0 0 0 eth2
169.254.0.0 * 255.255.0.0 U 0 0 0 eth2
default 66.241.66.225 0.0.0.0 UG 0 0 0 eth0

And here's the iptables firewall script:

#!/bin/sh
#---------------------------------------------------------------------------
------------
# iptables script
# By: Jacob Lear
#---------------------------------------------------------------------------
------------

# Variables
IPTABLES="/sbin/iptables"
INET_IFACE="eth0"
LAN_IFACE="eth1"
SAN_IFACE="eth2"
VPN_SVR="192.168.2.14"
MAIL_SVR="192.168.2.19"
PDM_SVR="192.168.2.11"
BCK_SVR="192.168.1.10"

# Clear the existing rules and chains
$IPTABLES -F
$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -F -t mangle
$IPTABLES -F -t nat
$IPTABLES -X

# INPUT default action set to DROP
$IPTABLES -P INPUT DROP

# FORWARD default action set to ACCEPT
$IPTABLES -P FORWARD ACCEPT

# OUTPUT default action set to ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -t nat -P OUTPUT ACCEPT

# PREROUTING default action set to ACCEPT
$IPTABLES -t nat -P PREROUTING ACCEPT

# POSTROUTING default action set to ACCEPT
$IPTABLES -t nat -P POSTROUTING ACCEPT

# To be able to forward traffic from your LAN
# to the Internet, we need to tell the kernel
# to allow ip forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Here we define a new chain which is going to handle
# packets we don't want to respond to
# limit the amount of logs to 10/min
$IPTABLES -N Firewall
$IPTABLES -A Firewall -m limit --limit 10/minute -j LOG --log-prefix
"Firewall: "
$IPTABLES -A Firewall -j DROP

# log those packets and inform the sender that the packet was rejected
$IPTABLES -N Rejectwall
$IPTABLES -A Rejectwall -m limit --limit 10/minute -j LOG --log-prefix
"Rejectwall: "
$IPTABLES -A Rejectwall -j REJECT
# use the following instead if you want to simulate that the host is not
reachable
# for fun though
#$IPTABLES -A Rejectwall -j REJECT --reject-with icmp-host-unreachable

# here we create a chain to deal with illegitimate packets
# and limit the number of alerts to 10/min
# packets will be drop without informing the sender
$IPTABLES -N Badflags
$IPTABLES -A Badflags -m limit --limit 10/minute -j LOG --log-prefix
"Badflags: "
$IPTABLES -A Badflags -j DROP

#---------------- INPUT chain (packets destined for firewall)
-----------------------

# Allow local loopback traffic
$IPTABLES -A INPUT -i lo -j ACCEPT

# Allow LAN/SAN traffic destined for firewall
$IPTABLES -A INPUT -i $LAN_IFACE -j ACCEPT
$IPTABLES -A INPUT -i $SAN_IFACE -j ACCEPT

# A list of well known combination of Bad TCP flags
# we redirect those to the Badflags chain
# which is going to handle them (log and drop)
$IPTABLES -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j Badflags
$IPTABLES -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j Badflags
$IPTABLES -A INPUT -p tcp --tcp-flags ACK,URG URG -j Badflags
$IPTABLES -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j Badflags
$IPTABLES -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j Badflags
$IPTABLES -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j Badflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL ALL -j Badflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL NONE -j Badflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL FIN,PSH,URG -j Badflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL SYN,FIN,PSH,URG -j Badflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j Badflags

# Block bad people
$IPTABLES -A INPUT -s 66.232.128.103 -j Rejectwall
$IPTABLES -A INPUT -s 62.143.255.133 -j Rejectwall
$IPTABLES -A INPUT -s 58.210.253.101 -j Rejectwall
$IPTABLES -A INPUT -s 60.248.76.6 -j Rejectwall
$IPTABLES -A INPUT -s 65.254.53.96 -j Rejectwall

# Accept certain icmp message, drop the others
# and log them through the Firewall chain
# 0 => echo reply
$IPTABLES -A INPUT -p icmp --icmp-type 0 -j ACCEPT
# 3 => Destination Unreachable
$IPTABLES -A INPUT -p icmp --icmp-type 3 -j ACCEPT
# 11 => Time Exceeded
$IPTABLES -A INPUT -p icmp --icmp-type 11 -j ACCEPT
# 8 => Echo
# avoid ping flood
$IPTABLES -A INPUT -p icmp --icmp-type 8 -m limit --limit 1/second -j ACCEPT
$IPTABLES -A INPUT -p icmp -j Firewall

# Allow SMTP traffic
$IPTABLES -A INPUT -p tcp --dport 25 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 25 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 465 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 465 -j ACCEPT

# Allow POP3/POP3S traffic
$IPTABLES -A INPUT -p tcp --dport 110 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 110 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 995 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 995 -j ACCEPT

# Allow DNS traffic
$IPTABLES -A INPUT -p udp --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT

# Allow SSH and Webmin traffic to firewall host
$IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 22 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 10001 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 10001 -j ACCEPT

# Accept related and established connections
$IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Drop netbios from the outside, no log, just drop
$IPTABLES -A INPUT -p udp --sport 137 --dport 137 -j DROP

# Finally, anything which was not allowed yet
# is going to go through our Rejectwall rule
$IPTABLES -A INPUT -j Rejectwall

#--------------- FORWARD chain (packets routing through)
---------------------------

# Allow LAN/SAN traffic through
$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $SAN_IFACE -j ACCEPT

# Allow WAN traffic through that was initiated by LAN hosts
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow VPN protocols and ports through
$IPTABLES -A FORWARD -i $LAN_IFACE -p tcp --sport 1723 --dport 1024: -s
$VPN_SVR -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -p 47 -s $VPN_SVR -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -p tcp --dport 1723 -d $VPN_SVR -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -p 47 -d $VPN_SVR -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -i $LAN_IFACE -s $VPN_SVR -p udp --sport 1723 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -d $VPN_SVR -p udp --dport 1723 -j
ACCEPT

$IPTABLES -A FORWARD -i $LAN_IFACE -s $VPN_SVR -p tcp --sport 42 -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -s $VPN_SVR -p udp --sport 42 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -d $VPN_SVR -p tcp --dport 42 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -d $VPN_SVR -p udp --dport 42 -j ACCEPT

# Allow Intranet Access traffic through
$IPTABLES -A FORWARD -d $PDM_SVR -p tcp --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -d $PDM_SVR -p tcp --dport 443 -j ACCEPT

# Allow certain protocols and ports through to specific hosts
# Allow eMule to Jake's PC
$IPTABLES -A FORWARD -d 192.168.2.254 -p tcp --dport 58079 -j ACCEPT
$IPTABLES -A FORWARD -d 192.168.2.254 -p udp --dport 48264 -j ACCEPT

# Do not allow new or invalid connections to reach your internal network
$IPTABLES -A FORWARD -i $INET_IFACE -m state --state NEW,INVALID -j DROP

# Final entry in FORWARD chain
$IPTABLES -A FORWARD -i $INET_IFACE -j LOG

#----------------------- NAT PREROUTING chain
-----------------------------------------

# Anti-Spoofing entries
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 10.0.0.0/8 -j DROP
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 172.16.0.0/12 -j DROP
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 192.168.0.0/16 -j DROP
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 127.0.0.0/8 -j DROP
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 224.0.0.0/4 -j DROP

# VPN
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p 47 -j DNAT --to-destination
$VPN_SVR
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 1723 -j DNAT
--to-destination $VPN_SVR

# Intranet Web Access
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 80 -j DNAT --to
$PDM_SVR:80
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 443 -j DNAT
--to $PDM_SVR:443

# eMule to Jake's PC
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 58079 -j DNAT
--to 192.168.2.254:58079
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p udp --dport 48264 -j DNAT
--to 192.168.2.254:48264

#------------------------ NAT POSTROUTING chain
----------------------------------------

# VPN
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -p tcp --sport 1723 -s
$VPN_SVR -d ! 192.168.0.0/16 -j SNAT --to-source $VPN_SVR

# Masquerade outgoing packets
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j MASQUERADE

If anyone has any ideas or suggestions, I'd greatly appreciate some help.
I'm pretty much at a loss at this point. All I can think of is that maybe
there's something wrong with the NIC... but that doesn't really make sense
since I can ping it just fine from this workstation.

Thanks in advance,

Jacob.

