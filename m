From: sillysausage <sillysausage@privatedemail.net>
Subject: Routing 192.168.1.0/24 to ISP and 192.168.2.0/24 to VPN using
 fwmark+mangle+iproute
Date: Fri, 7 Aug 2015 03:14:26 +0930
Message-ID: <55C39CFA.9050308@privatedemail.net>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm trying to set up VPN routing on my router, so that clients are routed into
a VPN depending on their source IP address. eg 192.168.1.0/24 goes directly
out my WAN port, and 192.168.2.0/24 goes into my VPN, with a few exceptions for
things like SIP and SMTP.

I want it so that all the filtering is done with iptables, and iproute just
acts on the specific fwmarks.

It is an improvement on this solution https://superuser.com/a/888337/426558
which uses rules like:

/sbin/ip rule add from 192.168.2.0/24 table vpn
/sbin/ip rule add to 192.168.2.0/24 table vpn

because that currently requires filtering in iptables and in iproute. It also
lacks flexibility on filtering by port, (required if I wanted to send all
465/587 traffic over the non-VPN table. This method worked okay because my SIP
server has a static IP address, but in the case of smtp.gmail.com I will have
to filter by port as google has a pool of potentially unknown IP addresses.

This wiki article I wrote detailing the whole project and I'd love to hear of
improvements I could make. I'm new to netfilter/iptables and still consider
myself a noob, and as I've documented my efforts for others I want to be as
"correct" as possible.

http://wiki.alpinelinux.org/wiki/Linux_Router_with_VPN_on_a_Raspberry_Pi#VPN_Tunnel_on_specific_subnet
an article which I wrote.

So the better approach seems to be to me that packets marked with 0x1 go
directly out ppp0 and packets marked with 0x2 go through tun0.

I did also post the question here https://superuser.com/questions/950031/
if you have the answer to my problem and want credit on superuser then reply
there as well.

So, what have I tried:

Well first I created two routing tables:

gateway:~# cat /etc/iproute2/rt_tables
1 ISP
2 VPN

Rules that are added when the ppp0 goes up on boot. Note I'm using the pppd
hooks to keep things generic https://ppp.samba.org/pppd.html#sect13

gateway:~# cat /etc/ppp/ip-up
#!/bin/sh
#
# This script is run by pppd when there's a successful ppp connection.
#

# Flush out any old routes when ppp0 goes down
/sbin/ip route flush table ISP

# Copy routes from main
/sbin/ip route show table main | grep -Ev ^default | while read ROUTE ; do ip route add table ISP $ROUTE; done

# Set default route to ppp0
/sbin/ip route add table ISP default via ${IPLOCAL}

Rules that are added when the VPN goes up. OpenVPN also has environmental
variables: https://openvpn.net/index.php/open-source/documentation/manuals/65-openvpn-20x-manpage.html#lbAS

gateway:~# cat /etc/openvpn/route-up.sh
#!/bin/sh
#
# This script is run by OpenVPN when there's a successful VPN connection.
#

# Flush out any old routes when tun0 goes down
/sbin/ip route flush table VPN

# Copy routes from main
/sbin/ip route show table main | grep -Ev ^default | while read ROUTE ; do ip route add table VPN $ROUTE; done

# Set default route to tun0
/sbin/ip route add default via ${route_vpn_gateway} dev ${dev} table VPN

This creates these routing tables:

gateway:~# ip route show table main
default dev ppp0 scope link metric 300
172.16.32.0/20 dev tun0 proto kernel scope link src 172.16.39.64
192.168.0.0/30 dev eth1 proto kernel scope link src 192.168.0.2
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.1
192.168.2.0/24 dev eth0 proto kernel scope link src 192.168.2.1
IPREMOTE dev ppp0 proto kernel scope link src IPLOCAL

gateway:~# ip route show table ISP
default via IPLOCAL dev ppp0
192.168.0.0/30 dev eth1 proto kernel scope link src 192.168.0.2
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.1
192.168.2.0/24 dev eth0 proto kernel scope link src 192.168.2.1
IPREMOTE dev ppp0 proto kernel scope link src IPLOCAL

gateway:~# ip route show table VPN
default via 172.16.32.1 dev tun0
172.16.32.0/20 dev tun0 proto kernel scope link src 172.16.39.64
192.168.0.0/30 dev eth1 proto kernel scope link src 192.168.0.2
192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.1
192.168.2.0/24 dev eth0 proto kernel scope link src 192.168.2.1
IPREMOTE dev ppp0 proto kernel scope link src IPLOCAL

In /etc/network/interfaces I added this under one of the interfaces:

post-up /etc/network/fwmark_rules

gateway:~# cat /etc/network/fwmark_2_0_subnet_rules
#!/bin/sh

/sbin/ip rule add fwmark 0x1 lookup ISP
/sbin/ip rule add fwmark 0x2 lookup VPN

Finally my complete iptables rules. I'm fairly certain the problem is in the
mangle table.

#########################################################################
# Advanced routing rule set
# Uses 192.168.1.0 via ISP
# 192.168.2.0 via VPN
#
# Packets to/from 192.168.1.0/24 are marked with 0x1 and routed to ISP
# Packets to/from 192.168.2.0/24 are marked with 0x2 and routed to VPN
#
#########################################################################

# Set up the nat table
*nat
:PREROUTING ACCEPT
:INPUT ACCEPT
:OUTPUT ACCEPT
:POSTROUTING ACCEPT

# Bittorrent forwarded to Linux Workstation through VPN
-A PREROUTING -i tun0 -p tcp -m tcp --dport 6881:6889 -j DNAT --to-destination 192.168.2.20
-A PREROUTING -i tun0 -p udp -m udp --dport 6881:6889 -j DNAT --to-destination 192.168.2.20

# Masquerade rule for exception, such as VOIP server when on 192.168.2.0/24 address
# -A POSTROUTING -d <IP_OF_HOST/MASK> -o ppp0 -j MASQUERADE

# Allows for network hosts to access the internet via VPN tunnel
-A POSTROUTING -s 192.168.2.0/24 -o tun0 -j MASQUERADE

# Allows for network hosts to access the internet via WAN port
-A POSTROUTING -s 192.168.1.0/24 -o ppp0 -j MASQUERADE

# Commit the nat table
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

# Incoming rule exception from ppp0, such as VOIP server when on 192.168.2.0/24 address
# -A IN_PPP0 -s <IP_OF_HOST/MASK> -j ACCEPT

# Accept incoming tracked PPP0 connections
-A IN_PPP0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Incoming ICMP from VPN, (breaks traceroute through VPN if you don't have this)
-A IN_TUN0 -d 192.168.2.0/24 -p icmp -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Accept incoming tracked connections from 192.168.2.0/24 to VPN
-A IN_TUN0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Commit the filter table
COMMIT

# Commit mangle table
*mangle
:PREROUTING ACCEPT
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
:POSTROUTING ACCEPT

# ------- Section I'm Unsure about -------
# Restore mark for tun0
-A PREROUTING -i tun0 -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff

# Restore mark for ppp0
-A PREROUTING -i ppp0 -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff

# Restore marks for eth0 for both subnets
-A PREROUTING -s 192.68.2.0/24 -i eth0 -m conntrack --ctstate RELATED,ESTABLISHED -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff
-A PREROUTING -s 192.168.1.0/24 -i eth0 -m conntrack --ctstate RELATED,ESTABLISHED -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff

# Mark for VPN
-A POSTROUTING -s 192.168.2.0/24 -j CONNMARK --set-xmark 0x2/0xffffffff

# Mark for ISP
-A POSTROUTING -s 192.168.1.0/24 -j CONNMARK --set-xmark 0x1/0xffffffff

COMMIT
# ------- Section I'm Unsure about -------

