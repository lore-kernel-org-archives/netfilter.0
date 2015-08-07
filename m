From: sillysausage <sillysausage@privatedemail.net>
Subject: Re: Routing 192.168.1.0/24 to ISP and 192.168.2.0/24 to VPN using
 fwmark+mangle+iproute
Date: Fri, 7 Aug 2015 22:33:46 +0930
Message-ID: <55C4ACB2.7060205@privatedemail.net>
References: <55C39CFA.9050308@privatedemail.net>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55C39CFA.9050308@privatedemail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

So I came across this guide

    http://nerdboys.com/2006/05/05/conning-the-mark-multiwan-connections-using-iptables-mark-connmark-and-iproute2/
    http://nerdboys.com/2006/05/08/multiwan-connections-addendum/

it was intended for a multiwan setup. The problem I found when using it was
that 192.168.1.0/24 seemed to route but 192.168.2.0/24 did not.

I'm not sure if this means that my packets were somehow slipping through the
main table unmarked or actually working ie going through ISP.

These are the iptables rules I tried this time (note mangle table):

#########################################################################
# Advanced routing rule set
# Uses 192.168.1.0 via ISP
#      192.168.2.0 via VPN
#
# Packets to/from 192.168.1.0/24 are marked with 0x1 and routed to ISP
# Packets to/from 192.168.2.0/24 are marked with 0x2 and routed to VPN
#
# http://nerdboys.com/2006/05/05/conning-the-mark-multiwan-connections-using-iptables-mark-connmark-and-iproute2/
# http://nerdboys.com/2006/05/08/multiwan-connections-addendum/
#########################################################################

# Set up the mangle table
*mangle
:PREROUTING ACCEPT
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
:POSTROUTING ACCEPT

# Restore CONNMARK to the MARK (If one doesn't exist then no mark is set
-A PREROUTING -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff

# If packet MARK is 2, then it means there is already a connection mark and the original packet came in on VPN
-A PREROUTING -m mark --mark 0x2 -j ACCEPT

# Else MARK packet as 2
#-A PREROUTING -i tun0 -j MARK --set-xmark 0x2/0xffffffff
-A PREROUTING -i tun0 -m conntrack --ctstate NEW -m mark --mark 0x0 -j MARK --set-xmark 0x2/0xffffffff

# If packet MARK is 1, then it means there is already a connection mark and the original packet came in on ISP
-A PREROUTING -m mark --mark 0x1 -j ACCEPT

# Else MARK packet as 1
#-A PREROUTING -i ppp0 -j MARK --set-xmark 0x1/0xffffffff
-A PREROUTING -i ppp0 -m conntrack --ctstate NEW -m mark --mark 0x0 -j MARK --set-xmark 0x1/0xffffffff

# Save MARK to CONNMARK
-A PREROUTING -j CONNMARK --save-mark --nfmask 0xffffffff --ctmask 0xffffffff

COMMIT

# Set up the filter table
*filter
:INPUT DROP
:FORWARD DROP
:OUTPUT ACCEPT

# Create rule chain per input interface for forwarding packets
:FWD_ETH0 - [0:0]
:FWD_ETH1 - [0:0]
:FWD_PPP0 - [0:0]
:FWD_TUN0 - [0:0]

# Create rule chain per input interface for input packets (for host itself)
:IN_ETH0 - [0:0]
:IN_ETH1 - [0:0]
:IN_PPP0 - [0:0]
:IN_TUN0 - [0:0]

# Pass input packet to corresponded rule chain
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth0 -j IN_ETH0
-A INPUT -i eth1 -j IN_ETH1
-A INPUT -i ppp0 -j IN_PPP0
-A INPUT -i tun0 -j IN_TUN0

# TCP flag checks - block invalid flags
-A INPUT -m conntrack --ctstate INVALID -j DROP

# Log packets that are dropped in INPUT chain (useful for debugging)
-A INPUT -j LOG --log-prefix "iptables/filter/INPUT end"

# Pass forwarded packet to corresponded rule chain
-A FORWARD -i eth0 -j FWD_ETH0
-A FORWARD -i eth1 -j FWD_ETH1
-A FORWARD -i ppp0 -j FWD_PPP0
-A FORWARD -i tun0 -j FWD_TUN0

# Log packets that are dropped in FORWARD chain (useful for debugging)
-A FORWARD -j LOG --log-prefix "iptables/filter/FORWARD end"

# Forward traffic to LAN
-A FWD_ETH0 -s 192.168.1.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Forward traffic to VPN
-A FWD_ETH0 -s 192.168.2.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Forward SSH packets from network to modem
-A FWD_ETH1 -s 192.168.0.0/30 -d 192.168.1.0/24 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A FWD_ETH1 -s 192.168.0.0/30 -d 192.168.2.0/24 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Forward traffic to ppp0 WAN port
-A FWD_PPP0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Forward ICMP from VPN, (breaks traceroute through VPN if you don't have this)
-A FWD_TUN0 -d 192.168.2.0/24 -p icmp -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Forward traffic to tun0 VPN port
-A FWD_TUN0 -d 192.168.2.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# SSH to Router
-A IN_ETH0 -s 192.168.1.0/24 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# DNS to Router
-A IN_ETH0 -s 192.168.1.0/24 -p udp -m udp --dport 53 -m conntrack --ctstate NEW -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -p udp -m udp --dport 53 -m conntrack --ctstate NEW -j ACCEPT

# FreeRadius Client
-A IN_ETH0 -s 192.168.1.0/24 -p tcp -m tcp --dport 1812 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.1.0/24 -p udp -m udp --dport 1812 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Ubiquiti UAP Device Discovery Broadcast
-A IN_ETH0 -s 192.168.1.0/24 -p udp -m udp --dport 10001 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# NTP
-A IN_ETH0 -s 192.168.1.0/24 -p udp -m udp --dport 123 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -p udp -m udp --dport 123 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Accept traffic to router on both subnets
-A IN_ETH0 -s 192.168.1.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Prevent leakages from 192.168.2.0/24 hosts when VPN goes down for some reason
-A IN_ETH0 -s 192.168.2.0/24 -o ppp0 -j REJECT --reject-with icmp-port-unreachable

# SSH To Modem from Router
-A IN_ETH1 -s 192.168.0.0/30 -d 192.168.0.0/30 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Accept incoming tracked PPP0 connections
-A IN_PPP0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Incoming ICMP from VPN, (breaks traceroute through VPN if you don't have this)
-A IN_TUN0 -d 192.168.2.0/24 -p icmp -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Accept incoming tracked connections from 192.168.2.0/24 to VPN
-A IN_TUN0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
COMMIT

*nat
:PREROUTING ACCEPT
:INPUT ACCEPT
:OUTPUT ACCEPT
:POSTROUTING ACCEPT

# Bittorrent forwarded to Linux Workstation through VPN
-A PREROUTING -i tun0 -p tcp -m tcp --dport 6881:6889 -j DNAT --to-destination 192.168.2.20
-A PREROUTING -i tun0 -p udp -m udp --dport 6881:6889 -j DNAT --to-destination 192.168.2.20

# Allows for network hosts to access the internet via VPN tunnel
-A POSTROUTING -s 192.168.2.0/24 -o tun0 -j MASQUERADE

# Allows for network hosts to access the internet via WAN port
-A POSTROUTING -s 192.168.1.0/24 -o ppp0 -j MASQUERADE
COMMIT


#########################################################################

My routing tables:

gateway:~# cat /etc/iproute2/rt_tables
#
# reserved values
#
255 local
254 main
253 default
0 unspec
#
# local
#
#1  inr.ruhep
1 ISP
2 VPN

#########################################################################

Script I used to setup the default routes for the ISP table

gateway:~# cat /etc/ppp/ip-up
#!/bin/sh
#
# This script is run by pppd when there's a successful ppp connection.
#

/sbin/ip route flush table ISP
/sbin/ip route add 192.168.1.0/24 dev eth0 table ISP
/sbin/ip rule add from ${IPLOCAL} table ISP
/sbin/ip route add table ISP default via ${IPLOCAL}

#########################################################################

Script I used to setup the default routes for the VPN table

gateway:~# cat /etc/openvpn/route-up-fwmark.sh
#!/bin/sh
#
# This script is run by OpenVPN when there's a successful VPN connection.
#

/sbin/ip route flush table VPN
/sbin/ip route add 192.168.2.0/24 dev eth0 table VPN
/sbin/ip rule add from ${route_vpn_gateway} table VPN
/sbin/ip route add default via ${route_vpn_gateway} dev ${dev} table VPN

#########################################################################

How the main table looks:

gateway:~# ip route sh table main
default dev ppp0  scope link  metric 300
172.16.32.0/20 dev tun0  proto kernel  scope link  src 172.16.39.64
192.168.0.0/30 dev eth1  proto kernel  scope link  src 192.168.0.2
192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.1
192.168.2.0/24 dev eth0  proto kernel  scope link  src 192.168.2.1
203.16.215.199 dev ppp0  proto kernel  scope link  src 14.2.28.78

#########################################################################

How the ISP table looks:

gateway:~# ip route sh table ISP
default via 14.2.28.78 dev ppp0
192.168.1.0/24 dev eth0  scope link

#########################################################################

How the VPN table looks:

gateway:~# ip route sh table VPN
default via 172.16.32.1 dev tun0
192.168.2.0/24 dev eth0  scope link

#########################################################################

fwmark rules run on boot:

gateway:~# cat /etc/network/fwmark_2_0_subnet_rules
#!/bin/sh

/sbin/ip rule add fwmark 1 table ISP prio 1
/sbin/ip rule add fwmark 2 table VPN prio 2

#########################################################################

How they look in the rule policy:

gateway:~# ip rule
0:  from all lookup local
0:  from 14.2.28.78 lookup ISP
0:  from 172.16.32.1 lookup VPN
1:  from all fwmark 0x1 lookup ISP
2:  from all fwmark 0x2 lookup VPN
32766:  from all lookup main
32767:  from all lookup default

#########################################################################

And my interfaces:

gateway:~# ip addr

### Loopback
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet 127.0.0.2/8 scope host secondary lo:1
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever

### Connection to LAN
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether b8:27:eb:63:46:b5 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.1/24 scope global eth0
       valid_lft forever preferred_lft forever
    inet 192.168.2.1/24 scope global eth0:2
       valid_lft forever preferred_lft forever
    inet6 fe80::ba27:ebff:fe63:46b5/64 scope link
       valid_lft forever preferred_lft forever

### Connection to Modem
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 80:49:71:12:38:79 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.2/30 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::8249:71ff:fe12:3879/64 scope link
       valid_lft forever preferred_lft forever

### Connection to ISP
4: ppp0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1492 qdisc pfifo_fast state UNKNOWN group default qlen 3
    link/ppp
    inet 14.2.28.78 peer 203.16.215.199/32 scope global ppp0
       valid_lft forever preferred_lft forever

### Connection to VPN
5: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UNKNOWN group default qlen 100
    link/none
    inet 172.16.39.64/20 brd 172.16.47.255 scope global tun0
       valid_lft forever preferred_lft forever

#########################################################################

In this page:

    http://nerdboys.com/2006/05/08/multiwan-connections-addendum/

> Turn rp_filter OFF

> It appears that rp_filter causes problems with NAT and connection marking.
> From what I could tell, packets tend to 'lose' their mark and thus get
> routed out the wrong interface without this turned off. However, it should
> be noted that if you turn this off, you need to take care of the
> anti-spoofing functionality it provides in your firewall script.

I turned rp_filter to 2, instead of 1. The guide did recommend 0 as one of the
comments said:

> David van Vyfeyken @ November 14th, 2013 at 2:33 am
> I wanted to point out that setting the rp_filter to 2 instead of 0 also
> works for me. setting it to 2 is much better as it still does source
> validation but on all the interfaces instead of only the one that the traffic
> came in. This only works on newer kernels though.

My kernel is 3.18.12-0-rpi2 the latest kernel included in Alpine Linux 3.2.2.

gateway:~# cat /etc/sysctl.conf
net.ipv4.ip_forward = 1
net.ipv4.conf.default.rp_filter = 2
kernel.panic = 120

#### ipv4 networking and equivalent ipv6 parameters ####

## TCP SYN cookie protection (default)
## helps protect against SYN flood attacks
## only kicks in when net.ipv4.tcp_max_syn_backlog is reached
net.ipv4.tcp_syncookies = 1

## protect against tcp time-wait assassination hazards
## drop RST packets for sockets in the time-wait state
## (not widely supported outside of linux, but conforms to RFC)
net.ipv4.tcp_rfc1337 = 1

## sets the kernels reverse path filtering mechanism to value 1(on)
## will do source validation of the packet's recieved from all the interfaces on the machine
## protects from attackers that are using ip spoofing methods to do harm
net.ipv4.conf.all.rp_filter = 2
net.ipv6.conf.all.rp_filter = 1

## tcp timestamps
## + protect against wrapping sequence numbers (at gigabit speeds)
## + round trip time calculation implemented in TCP
## - causes extra overhead and allows uptime detection by scanners like nmap
## enable @ gigabit speeds
net.ipv4.tcp_timestamps = 0
#net.ipv4.tcp_timestamps = 1

## log martian packets
net.ipv4.conf.all.log_martians = 0  # Disabled to prevent spam in messages

## ignore echo broadcast requests to prevent being part of smurf attacks (default)
net.ipv4.icmp_echo_ignore_broadcasts = 1

## ignore bogus icmp errors (default)
net.ipv4.icmp_ignore_bogus_error_responses = 1

## send redirects (not a router, disable it)
net.ipv4.conf.all.send_redirects = 0

## ICMP routing redirects (only secure)
#net.ipv4.conf.all.secure_redirects = 1 (default)
net/ipv4/conf/default/accept_redirects=0
net/ipv4/conf/all/accept_redirects=0
net/ipv6/conf/default/accept_redirects=0
net/ipv6/conf/all/accept_redirects=0

# Disable ipv6
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1

#########################################################################

