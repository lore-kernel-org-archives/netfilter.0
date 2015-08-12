From: sillysausage <sillysausage@privatedemail.net>
Subject: Filtering bogon ranges from exiting WAN
Date: Wed, 12 Aug 2015 22:10:45 +0930
Message-ID: <55CB3ECD.2010509@privatedemail.net>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

So I've been working on building my own router using iptables and
iproute2 as a bit of a research project to get to know these things
better.

I've written about it here (mostly so I have something to refer to)
and so others can try it out:

http://wiki.alpinelinux.org/wiki/Linux_Router_with_VPN_on_a_Raspberry_Pi

I realized that I was not filtering bogon ranges, that were exiting
out my router's WAN port. These things are obviously forbidden in
some way on the general internet I wanted to filter them before
that happens.

I'd looked at this guide:

http://blog.ls20.com/securing-your-server-using-ipset-and-dynamic-blocklists/

I'm not using the full fullbogons-ipv4.txt range, but rather the
smaller one which consists of reserved ranges.

https://files.pfsense.org/lists/bogon-bn-nonagg.txt
https://en.wikipedia.org/wiki/Reserved_IP_addresses

The method is to use ipset to load the list, and add it to it's own
filter chain and then block all but the actual ranges that exist on
my network.

First of all I imported the list and can see it was correctly loaded:

# ipset list
Name: bogon-bn-nonagg
Type: hash:net
Revision: 6
Header: family inet hashsize 1024 maxelem 65536
Size in memory: 8976
References: 4
Members:
172.16.0.0/12
192.168.0.0/16
192.0.2.0/24
224.0.0.0/4
240.0.0.0/4
10.0.0.0/8
127.0.0.0/8
198.18.0.0/15
198.51.100.0/24
100.64.0.0/10
192.0.0.0/24
169.254.0.0/16
203.0.113.0/24
0.0.0.0/8


Then created the chain:

# Create Bogon Chain
:IP4BOGONS - [0:0]

# Allow localhost
-A INPUT ! -i lo -j IP4BOGONS


Made the exceptions:

# Except connection between modem and router
-A IP4BOGONS -s 192.168.0.0/30 -j RETURN

# Except hosts on regular link to ISP
-A IP4BOGONS -s 192.168.1.0/24 -j RETURN

# Except hosts on link to VPN
-A IP4BOGONS -s 192.168.2.0/24 -j RETURN

# Except hosts on LAN only subnet
-A IP4BOGONS -s 192.168.3.0/24 -j RETURN

# Except VPN interface
-A IP4BOGONS -s 172.16.32.0/20 -j RETURN

Block all remaining bogons whether in source or destination:

# Block bogons with source matching list
-A IP4BOGONS -m set --match-set bogon-bn-nonagg src -j DROP

# Block bogons with destination matching list
-A IP4BOGONS -m set --match-set bogon-bn-nonagg dst -j DROP

Unfortunately the problem still seems to be if I ping 192.168.5.1
for example it still is routed out to my ISP and filtered by their
router.

My full rules are below for completeness:

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
#-A PREROUTING -s 192.168.3.0/24 -m mark --mark 0x3 -j ACCEPT

# Check packets coming from 192.168.3.0/24 are 0x3
#-A PREROUTING -s 192.168.3.0/24 -j MARK --set-xmark 0x3/0xffffffff

# If packet MARK is 2, then it means there is already a connection mark and the original packet came in on VPN
-A PREROUTING -s 192.168.2.0/24 -m mark --mark 0x2 -j ACCEPT

# Check exception (this is a server which when accessed on a 192.168.2.0/24 address will go out the ISP table) are 0x1
#-A PREROUTING -s 192.168.2.0/24 -d <IP_OF_EXCEPTED_SERVER>/32 -m mark --mark 0x1 -j ACCEPT

# Check packets coming from 192.168.2.0/24 are 0x2
-A PREROUTING -s 192.168.2.0/24 -j MARK --set-xmark 0x2/0xffffffff

# If packet MARK is 1, then it means there is already a connection mark and the original packet came in on ISP
-A PREROUTING -s 192.168.1.0/24 -m mark --mark 0x1 -j ACCEPT

# Check packets coming from 192.168.1.0/24 are 0x1
-A PREROUTING -s 192.168.1.0/24 -j MARK --set-xmark 0x1/0xffffffff

# Mark exception (this is a server which when accessed on a 192.168.2.0/24 address will go out the ISP table) as 0x1
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

# Create Bogon Chain
:IP4BOGONS - [0:0]

# Allow localhost
-A INPUT ! -i lo -j IP4BOGONS

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
-A FWD_ETH1 -s 192.168.0.0/30 -d 192.168.1.0/24 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A FWD_ETH1 -s 192.168.0.0/30 -d 192.168.2.0/24 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

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

# Allow excepted server to be INPUT to eth0 from LAN
#-A IN_ETH0 -s 192.168.2.0/24 -d <IP_OF_EXCEPTED_SERVER>/32 -o ppp0 -j ACCEPT

# SSH To Modem from Router
-A IN_ETH1 -s 192.168.0.0/30 -d 192.168.0.0/30 -p tcp -m tcp --sport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Accept incoming tracked PPP0 connection
-A IN_PPP0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Accept incoming tracked TUN0 connection
-A IN_TUN0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Except connection between modem and router
-A IP4BOGONS -s 192.168.0.0/30 -j RETURN

# Except hosts on regular link to ISP
-A IP4BOGONS -s 192.168.1.0/24 -j RETURN

# Except hosts on link to VPN
-A IP4BOGONS -s 192.168.2.0/24 -j RETURN

# Except hosts on LAN only subnet
-A IP4BOGONS -s 192.168.3.0/24 -j RETURN

# Except VPN interface
-A IP4BOGONS -s 172.16.32.0/20 -j RETURN

# Block bogons with source matching list
-A IP4BOGONS -m set --match-set bogon-bn-nonagg src -j DROP

# Block bogons with destination matching list
-A IP4BOGONS -m set --match-set bogon-bn-nonagg dst -j DROP

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


The the exception chains are certainly working as indicated by the
counters. However it seems chain 8-9 (the two DROP chains) don't
seem to work at all.

If I put the exceptions below those two match-sets then it certainly
denies me access to the router as expected, so I know ipset is
working.

I tried using ACCEPT instead of RETURN but that didn't help me
either.

# iptables --line-numbers -nv -L INPUT; iptables -nv -L IP4BOGONS
Chain INPUT (policy DROP 1 packets, 40 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1     3456  953K IP4BOGONS  all  --  !lo    *       0.0.0.0/0            0.0.0.0/0
2      123 21379 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
3        0     0 IN_ETH0    all  --  eth0   *       0.0.0.0/0            0.0.0.0/0
4        0     0 IN_ETH1    all  --  eth1   *       0.0.0.0/0            0.0.0.0/0
5      959  750K IN_PPP0    all  --  ppp0   *       0.0.0.0/0            0.0.0.0/0
6        0     0 IN_TUN0    all  --  tun0   *       0.0.0.0/0            0.0.0.0/0
7        1    40 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            LOG flags 0 level 4 prefix "DROPPED INPUT: "
8        0     0 DROP       all  --  eth0   *       0.0.0.0/0            0.0.0.0/0            match-set bogon-bn-nonagg src
9        0     0 DROP       all  --  eth0   *       0.0.0.0/0            0.0.0.0/0            match-set bogon-bn-nonagg dst
Chain IP4BOGONS (1 references)
 pkts bytes target     prot opt in     out     source               destination
   44  5933 ACCEPT     all  --  *      *       192.168.0.0/30       0.0.0.0/0
   61  8733 ACCEPT     all  --  *      *       192.168.1.0/24       0.0.0.0/0
 2336  159K ACCEPT     all  --  *      *       192.168.2.0/24       0.0.0.0/0
    0     0 ACCEPT     all  --  *      *       192.168.3.0/24       0.0.0.0/0
   62 29160 ACCEPT     all  --  *      *       172.16.32.0/20       0.0.0.0/0

-------------------------------------------------------------------------------

