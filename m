From: sillysausage <sillysausage@privatedemail.net>
Subject: Re: Routing 192.168.1.0/24 to ISP and 192.168.2.0/24 to VPN using
 fwmark+mangle+iproute
Date: Tue, 11 Aug 2015 16:53:26 +0930
Message-ID: <55C9A2EE.7010508@privatedemail.net>
References: <55C39CFA.9050308@privatedemail.net>
 <55C4ACB2.7060205@privatedemail.net> <55C7658D.3030404@privatedemail.net>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55C7658D.3030404@privatedemail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

So.

I've been testing this on PPP0 and it seems to work, from a
192.168.1.0/24 address I downloaded a 10MB file.

# iptables -L --line-numbers -n -v -t mangle
Chain PREROUTING (policy ACCEPT 21134 packets, 13M bytes)
num   pkts bytes target     prot opt in     out     source               destination
1    42801   17M CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK restore
2       16  7976 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            mark match 0x2 LOG flags 0 level 7 prefix "fwmark 2: "
3        0     0 ACCEPT     all  --  *      *       192.168.2.0/24       0.0.0.0/0            mark match 0x2
4       19  9113 MARK       all  --  tun0   *       0.0.0.0/0            0.0.0.0/0            MARK set 0x2
5    41491   17M LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            mark match 0x1 LOG flags 0 level 7 prefix "fwmark 1: "
6    21667 3778K ACCEPT     all  --  *      *       192.168.1.0/24       0.0.0.0/0            mark match 0x1
7    19961   13M MARK       all  --  ppp0   *       0.0.0.0/0            0.0.0.0/0            MARK set 0x1
8    21134   13M CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK save

You can see that chain 7 is hitting.

Now I tried this with uploading too, and could see that hit chain 6.

Chain PREROUTING (policy ACCEPT 5642 packets, 351K bytes)
num   pkts bytes target     prot opt in     out     source               destination
1    12595   10M CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK restore
2        7  3822 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            mark match 0x2 LOG flags 0 level 7 prefix "fwmark 2: "
3        0     0 ACCEPT     all  --  *      *       192.168.2.0/24       0.0.0.0/0            mark match 0x2
4        7  3822 MARK       all  --  tun0   *       0.0.0.0/0            0.0.0.0/0            MARK set 0x2
5    11302   10M LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            mark match 0x1 LOG flags 0 level 7 prefix "fwmark 1: "
6     6953   10M ACCEPT     all  --  *      *       192.168.1.0/24       0.0.0.0/0            mark match 0x1
7     4350  267K MARK       all  --  ppp0   *       0.0.0.0/0            0.0.0.0/0            MARK set 0x1
8     5642  351K CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK save


So now I want to look at the VPN. Pinging 8.8.8.8 I see nothing
hitting for chain 2, 3, 4.

# iptables -L --line-numbers -n -v -t mangle
Chain PREROUTING (policy ACCEPT 619 packets, 37603 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1      632 38676 CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK restore
2        0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            mark match 0x2 LOG flags 0 level 7 prefix "fwmark 2: "
3        0     0 ACCEPT     all  --  *      *       192.168.2.0/24       0.0.0.0/0            mark match 0x2
4        0     0 MARK       all  --  tun0   *       0.0.0.0/0            0.0.0.0/0            MARK set 0x2
5       13  1073 ACCEPT     all  --  *      *       192.168.1.0/24       0.0.0.0/0            mark match 0x1
6       18  2042 MARK       all  --  ppp0   *       0.0.0.0/0            0.0.0.0/0            MARK set 0x1
7      619 37603 CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK save

Nothing in the logs either....

If I ping something ON the VPN such as their DNS server 172.16.32.1

# iptables -L --line-numbers -n -v -t mangle
Chain PREROUTING (policy ACCEPT 850 packets, 55577 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1      882 58116 CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK restore
2        9   756 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            mark match 0x2 LOG flags 0 level 7 prefix "fwmark 2: "
3        5   420 ACCEPT     all  --  *      *       192.168.2.0/24       0.0.0.0/0            mark match 0x2
4        5   420 MARK       all  --  tun0   *       0.0.0.0/0            0.0.0.0/0            MARK set 0x2
5       27  2119 ACCEPT     all  --  *      *       192.168.1.0/24       0.0.0.0/0            mark match 0x1
6       49  5895 MARK       all  --  ppp0   *       0.0.0.0/0            0.0.0.0/0            MARK set 0x1
7      850 55577 CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK save

I see that it does hit the rules. So this makes me think the mangle
rules are correct?

I can see it in the logs too

Aug 11 06:21:16 gateway kern.debug kernel:
   [ 5503.361100] fwmark 2: IN=tun0 OUT= MAC= SRC=172.16.32.1 DST=route_vpn_gateway
   LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=18989 PROTO=ICMP TYPE=0 CODE=0 ID=24842
   SEQ=230 MARK=0x2

Aug 11 06:21:17 gateway kern.debug kernel:
   [ 5503.941894] fwmark 2: IN=eth0 OUT=
   SRC=192.168.2.20 DST=172.16.32.1 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=51575
   DF PROTO=ICMP TYPE=8 CODE=0 ID=2

It would also indicate the forwarding is working too. Ie forwarding
from 192.168.2.20 > 192.168.2.1 > route_vpn_gateway > 172.16.32.1

# ip rule
0:  from all lookup local
1:  from IPLOCAL_EXTERNAL_IP lookup ISP
1:  from all fwmark 0x1 lookup ISP
2:  from route_vpn_gateway lookup VPN
2:  from all fwmark 0x2 lookup VPN
32766:  from all lookup main
32767:  from all lookup defaul

# ip route sh table main
default dev ppp0  scope link  metric 300
172.16.32.0/20 dev tun0  proto kernel  scope link  src route_vpn_gateway
192.168.0.0/30 dev eth1  proto kernel  scope link  src 192.168.0.2
192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.1
192.168.2.0/24 dev eth0  proto kernel  scope link  src 192.168.2.1
203.16.215.199 dev ppp0  proto kernel  scope link  src IPLOCAL_EXTERNAL_IP

# ip route sh table ISP
default via IPLOCAL_EXTERNAL_IP dev ppp0  metric 1
192.168.1.0/24 dev eth0  scope link  metric 1

# ip route sh table VPN
default via route_vpn_gateway dev tun0  metric 2
192.168.2.0/24 dev eth0  scope link  metric 2

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
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]

# Restore CONNMARK to the MARK (If one doesn't exist then no mark is set
-A PREROUTING -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff

# If packet MARK is 2, then it means there is already a connection mark and the original packet came in on VPN
-A PREROUTING -m mark --mark 0x2 -j LOG --log-prefix "fwmark 2: " --log-level 7
-A PREROUTING -s 192.168.2.0/24 -m mark --mark 0x2 -j ACCEPT

# Else MARK packet as 2
-A PREROUTING -i tun0 -j MARK --set-xmark 0x2/0xffffffff

# Optimized rule mentioned in http://nerdboys.com/2006/05/08/multiwan-connections-addendum/
# didn't seem to work with that
#-A PREROUTING -i tun0 -m conntrack --ctstate NEW -m mark --mark 0x0 -j MARK --set-xmark 0x2/0xffffffff

# If packet MARK is 1, then it means there is already a connection mark and the original packet came in on ISP
-A PREROUTING -s 192.168.1.0/24 -m mark --mark 0x1 -j ACCEPT

# Else MARK packet as 1
-A PREROUTING -i ppp0 -j MARK --set-xmark 0x1/0xffffffff

# Optimized rule mentioned in http://nerdboys.com/2006/05/08/multiwan-connections-addendum/
# didn't seem to work with that
#-A PREROUTING -i ppp0 -m conntrack --ctstate NEW -m mark --mark 0x0 -j MARK --set-xmark 0x1/0xffffffff

# Save MARK to CONNMARK
-A PREROUTING -j CONNMARK --save-mark --nfmask 0xffffffff --ctmask 0xffffffff
COMMIT

# Set up the filter table
*filter
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

# Accept traffic to router on both subnets
-A IN_ETH0 -s 192.168.1.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
-A IN_ETH0 -s 192.168.2.0/24 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

# Prevent leakages from 192.168.2.0/24 hosts when VPN goes down for some reason
-A IN_ETH0 -s 192.168.2.0/24 -o ppp0 -j REJECT --reject-with icmp-port-unreachable

# Accept incoming tracked PPP0 connections
-A IN_PPP0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Incoming ICMP from VPN, (breaks traceroute through VPN if you don't have this)
-A IN_TUN0 -d 192.168.2.0/24 -p icmp -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Accept incoming tracked connections from 192.168.2.0/24 to VPN
-A IN_TUN0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
COMMIT

*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]

# Allows for network hosts to access the internet via VPN tunnel
-A POSTROUTING -s 192.168.2.0/24 -o tun0 -j MASQUERADE

# Allows for network hosts to access the internet via WAN port
-A POSTROUTING -s 192.168.1.0/24 -o ppp0 -j MASQUERADE
COMMIT

So my question is.

If 192.168.2.20 > 192.168.2.1 > route_vpn_gateway > 172.16.32.1

works why doesn't:

192.168.2.20 > 192.168.2.1 > route_vpn_gateway > 8.8.8.8

