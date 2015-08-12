From: sillysausage <sillysausage@privatedemail.net>
Subject: Creating a LAN only null routed network (no access to internet)
Date: Wed, 12 Aug 2015 22:42:13 +0930
Message-ID: <55CB462D.6040203@privatedemail.net>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've been working on building my own router using iptables and
iproute2 as a bit of a research project to get to know these things
better.

I've written about it here (mostly so I have something to refer to)
and so others can try it out:

http://wiki.alpinelinux.org/wiki/Linux_Router_with_VPN_on_a_Raspberry_Pi

So far I've set it up so that the 192.168.1.0/24 range is directly
routed out onto the internet and fwmarked with 0x1, while the
192.168.2.0/24 range is fwmarked with 0x2 and sent out the VPN.

This is working great now :)

The intent is to create a 3rd subnet 192.168.3.0/24 which both
192.168.1.0/24 and 192.168.2.0/24 can access hosts on like printers
WiFi access points and IP Phones, things that do not need to ever
have a route out onto the Internet as they only need other resources
on the LAN.

So after adding the third routing table to /etc/iproute2/rt_tables
eg: 3 LAN

I'm a bit stuck as to what the default route should be for the LAN
table.

In the past I've used something like:

  /sbin/ip route add table <table> default via ${IPLOCAL}

However this table shouldn't be routed to ppp0 or tun0's IP.

It won't have a MASQUERADE rule in IPTables either.

Likewise the from rule I've used in the past has usually been
something like:

  /sbin/ip rule add from ${IPLOCAL} table <table>

--------------------------------------------------------------------

So I decided to have a go at it and see what I could get:

I decided to create some routes to it.

gateway:~# ip route add 192.168.1.0/24 dev eth0 table LAN
gateway:~# ip route add 192.168.2.0/24 dev eth0 table LAN
gateway:~# ip route add 192.168.3.0/24 dev eth0 table LAN

gateway:# ip route ls table main
default dev ppp0  scope link  metric 300
172.16.32.0/20 dev tun0  proto kernel  scope link  src 172.16.39.64
192.168.0.0/30 dev eth1  proto kernel  scope link  src 192.168.0.2
192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.1
192.168.2.0/24 dev eth0  proto kernel  scope link  src 192.168.2.1
192.168.3.0/24 dev eth0  proto kernel  scope link  src 192.168.3.1
${IPREMOTE} dev ppp0  proto kernel  scope link  src ${IPLOCAL}

gateway:# ip route ls table ISP
default via ${IPLOCAL} dev ppp0  metric 100
192.168.1.0/24 dev eth0  scope link  metric 100
192.168.2.0/24 dev eth0  scope link  metric 200

gateway:# ip route ls table VPN
default via 172.16.39.64 dev tun0  metric 200
192.168.2.0/24 dev eth0  scope link  metric 200

gateway:# ip route ls table LAN
192.168.1.0/24 dev eth0  scope link
192.168.2.0/24 dev eth0  scope link
192.168.3.0/24 dev eth0  scope link

Rule I added to deal with the LAN table:

/sbin/ip rule add fwmark 3 table LAN prio 250

gateway:# ip rule
0:  from all lookup local
100:  from all fwmark 0x1 lookup ISP
100:  from ${IPLOCAL} lookup ISP
200:  from all fwmark 0x2 lookup VPN
200:  from 172.16.39.64 lookup VPN
250:  from all fwmark 0x3 lookup LAN
300:  from all fwmark 0x2 prohibit
32766:  from all lookup main
32767:  from all lookup default

The rules for 0x3 are certainly being tripped when a packet comes
from or two one of the other ranges and 192.168.3.0/24

# iptables -L --line-numbers -n -v -t mangle
Chain PREROUTING (policy ACCEPT 2130 packets, 2140K bytes)
num   pkts bytes target     prot opt in     out     source               destination
1     3304 2222K CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK restore
2        9   692 ACCEPT     all  --  *      *       192.168.3.0/24       0.0.0.0/0            mark match 0x3
3        7   492 MARK       all  --  *      *       192.168.3.0/24       0.0.0.0/0            MARK set 0x3
4     1118 74778 ACCEPT     all  --  *      *       192.168.2.0/24       0.0.0.0/0            mark match 0x2
5       36  2215 MARK       all  --  *      *       192.168.2.0/24       0.0.0.0/0            MARK set 0x2
6       47  6520 ACCEPT     all  --  *      *       192.168.1.0/24       0.0.0.0/0            mark match 0x1
7       18  2167 MARK       all  --  *      *       192.168.1.0/24       0.0.0.0/0            MARK set 0x1
8     2130 2140K CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK save


My rules are as follows, I marked the packets and made sure to allow
forwarding of the 192.168.3.0/24 range.

#########################################################################
# Advanced routing rule set
# Uses 192.168.1.0 via ISP
#      192.168.2.0 via VPN
#      192.168.3.0 via LAN
#
# Packets to/from 192.168.1.0/24 are marked with 0x1 and routed to ISP
# Packets to/from 192.168.2.0/24 are marked with 0x2 and routed to VPN
# Packets to/from 192.168.3.0/24 are marked with 0x3 and routed to LAN
#
#########################################################################

#
# Mangle Table
# This is the place where our markings happen, whether they be 0x1 or 0x2
#
*mangle

# Set default policies for table
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]

# Restore CONNMARK to the MARK (If one doesn't exist then no mark is set)
-A PREROUTING -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff

# If packet MARK is 3, then it means there is already a connection mark
-A PREROUTING -s 192.168.3.0/24 -m mark --mark 0x3 -j ACCEPT

# Check packets coming from 192.168.3.0/24 are 0x3
-A PREROUTING -s 192.168.3.0/24 -j MARK --set-xmark 0x3/0xffffffff

# If packet MARK is 2, then it means there is already a connection mark and the original packet came in on VPN
-A PREROUTING -s 192.168.2.0/24 -m mark --mark 0x2 -j ACCEPT

# Check exception (this is a server which when accessed on a 192.168.2.0/24 address will go out the ISP table)
are 0x1
#-A PREROUTING -s 192.168.2.0/24 -d <IP_OF_EXCEPTED_SERVER>/32 -m mark --mark 0x1 -j ACCEPT

# Check packets coming from 192.168.2.0/24 are 0x2
-A PREROUTING -s 192.168.2.0/24 -j MARK --set-xmark 0x2/0xffffffff

# If packet MARK is 1, then it means there is already a connection mark and the original packet came in on ISP
-A PREROUTING -s 192.168.1.0/24 -m mark --mark 0x1 -j ACCEPT

# Check packets coming from 192.168.1.0/24 are 0x1
-A PREROUTING -s 192.168.1.0/24 -j MARK --set-xmark 0x1/0xffffffff

# Mark exception (this is a server which when accessed on a 192.168.2.0/24 address
# will go out the ISP table) as 0x1
#-A PREROUTING -s 192.168.2.0/24 -d <IP_OF_EXCEPTED_SERVER>/32 -j MARK --set-xmark 0x1/0xffffffff

# Save MARK to CONNMARK (remember iproute can't see CONNMARKs)
-A PREROUTING -j CONNMARK --save-mark --nfmask 0xffffffff --ctmask 0xffffffff
COMMIT

#
# Filter Table
# This is where we decide to ACCEPT, DROP or REJECT things
#
*filter

# Set default policies for table
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]

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

# Pass input packet to corresponding rule chain
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth0 -j IN_ETH0
-A INPUT -i eth1 -j IN_ETH1
-A INPUT -i ppp0 -j IN_PPP0
-A INPUT -i tun0 -j IN_TUN0

# Log packets that are dropped in INPUT chain
-A INPUT -j LOG --log-prefix "DROPPED INPUT: "

# Track forwarded packets
-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Pass forwarded packet to corresponding rule chain
-A FORWARD -i eth0 -j FWD_ETH0
-A FORWARD -i eth1 -j FWD_ETH1
-A FORWARD -i ppp0 -j FWD_PPP0
-A FORWARD -i tun0 -j FWD_TUN0

# Log packets that are dropped in FORWARD chain
-A FORWARD -j LOG --log-prefix "DROPPED FORWARD: "

# Forward traffic to ISP
-A FWD_ETH0 -s 192.168.1.0/24 -j ACCEPT

# Forward traffic to VPN
-A FWD_ETH0 -s 192.168.2.0/24 -j ACCEPT

# Forward traffic to LAN
-A FWD_ETH0 -s 192.168.3.0/24 -j ACCEPT

# Allow excepted server to be FORWARD to ppp0
#-A FWD_ETH0 -s 192.168.2.0/24 -d <IP_OF_EXCEPTED_SERVER>/32 -o ppp0 -j ACCEPT

# Forward SSH packets from network to modem
-A FWD_ETH1 -s 192.168.0.0/30 -d 192.168.1.0/24 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED
-j ACCEPT
-A FWD_ETH1 -s 192.168.0.0/30 -d 192.168.2.0/24 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED
-j ACCEPT

# SSH to Router
-A IN_ETH0 -s 192.168.1.0/24 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# DNS to Router
-A IN_ETH0 -s 192.168.1.0/24 -p udp -m udp --dport 53 -m conntrack --ctstate NEW -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -p udp -m udp --dport 53 -m conntrack --ctstate NEW -j ACCEPT

# FreeRadius Client (eg a UniFi AP)
-A IN_ETH0 -s 192.168.1.0/24 -p tcp -m tcp --dport 1812 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.1.0/24 -p udp -m udp --dport 1812 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Ubiquiti UAP Device Discovery Broadcast
-A IN_ETH0 -s 192.168.1.0/24 -p udp -m udp --dport 10001 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# NTP to Router
-A IN_ETH0 -s 192.168.1.0/24 -p udp -m udp --dport 123 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -p udp -m udp --dport 123 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Accept traffic to router on both subnets
-A IN_ETH0 -s 192.168.1.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.3.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Allow excepted server to be INPUT to eth0 from LAN
#-A IN_ETH0 -s 192.168.2.0/24 -d <IP_OF_EXCEPTED_SERVER>/32 -o ppp0 -j ACCEPT

# SSH To Modem from Router
-A IN_ETH1 -s 192.168.0.0/30 -d 192.168.0.0/30 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED
-j ACCEPT

# Accept incoming tracked PPP0 connection
-A IN_PPP0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Accept incoming tracked TUN0 connection
-A IN_TUN0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
COMMIT

#
# NAT Table
# This is where translation of packets happens and "forwarding" of ports
# to specific hosts.
#
*nat

# Set default policies for table
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]

# Port forwarding for Bittorrent
-A PREROUTING -i tun0 -p tcp -m tcp --dport 6881:6889 -j DNAT --to-destination 192.168.2.20
-A PREROUTING -i tun0 -p udp -m udp --dport 6881:6889 -j DNAT --to-destination 192.168.2.20

# Allows hosts of the network to use the VPN tunnel
-A POSTROUTING -o tun0 -j MASQUERADE

# Allows hosts of the network to use the PPP tunnel
-A POSTROUTING -o ppp0 -j MASQUERADE
COMMIT

When I tried to ping from:

  IP: 192.168.3.25
  Default gateway: 192.168.3.1

  to:

  IP: 192.168.2.20
  Default gateway: 192.168.2.1

  These are the same interface on the router eg
  eth0:  192.168.1.1
  eth0:2 192.168.2.1
  eth0:3 192.168.3.1

  I got this message:

  From 192.168.3.1: icmp_seq=2 Redirect Host(New nexthop: 192.168.2.20).

I don't think the problem is with iptables, I think I am missing
something from my routing policy database. I am wondering if someone
can tell me/give me a hint what that might be.

