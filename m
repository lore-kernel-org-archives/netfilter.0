From: "John Lister" <john.lister@kickstone.com>
Subject: Help configuring "load balancing" firewall router using netfilter
Date: Mon, 3 Aug 2009 19:51:08 +0100
Message-ID: <8589B6F11C664288A76D6FA9C308CAE4@squarepi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi, i'm trying to create a firewall/router that will randomly route 
outgoing/forwarded connections on different interfaces, at the same time i'd 
like each connection to be given a random ip address (from a distinct 
range). I'm using the following script below to setup my box and it seems to 
work fine some of the time, but every so often it seems to break and 
connections are sent out of the box, but no responses seem to come back in. 
I wondered if anyone had any ideas on what i've done wrong...

Also note i've used the "random" statistic mode instead of "nth",  as when i 
originally tried "nth", i'm sure it didn't work as expected, in that once it 
had gone through each value it stuck at the end instead of looping.. Also 
there seems to be no way with "nth" to specify different counters any more.

Thanks


==================================
#!/bin/sh -x


# reset everything
ip route flush table 101
ip route flush table 102
ip route flush table main
ip rule del fwmark 1 table 101
ip rule del fwmark 2 table 102
ip route add 192.168.1.0/24 dev eth0
ip route add x.x.180.0/22 dev eth1
ip route add x.x.30.96.32/29 dev eth4

ip addr del x.x.183.72/22 dev eth1
ip addr del x.x.183.73/22 dev eth1
ip addr del x.x.183.74/22 dev eth1
ip addr del x.x.183.75/22 dev eth1

ip addr del x.x.96.35/29 dev eth4
ip addr del x.x.96.36/29 dev eth4
ip addr del x.x.96.37/29 dev eth4
ip addr del x.x.96.38/29 dev eth4

iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -t mangle -X MATCH1
iptables -t mangle -X MATCH2
iptables -t nat -X SNAT1
iptables -t nat -X SNAT2


# create virtual devices
ip addr add x.x.183.72/22 dev eth1
ip addr add x.x.183.73/22 dev eth1
ip addr add x.x.183.74/22 dev eth1
ip addr add x.x.183.75/22 dev eth1

ip addr add x.x.96.35/29 dev eth4
ip addr add x.x.96.36/29 dev eth4
ip addr add x.x.96.37/29 dev eth4
ip addr add x.x.96.38/29 dev eth4

# setup routing
ip route add x.x.180.0/22 dev eth1 table 101
ip route add 192.168.1.0/24 dev eth0 table 101
ip route add default via x.x.180.1 dev eth1 table 101

ip route add x.x.96.32/29 dev eth4 table 102
ip route add 192.168.1.0/24 dev eth0 table 102
ip route add default via x.x.96.33 dev eth4 table 102

# now route based on the mark
ip rule add fwmark 1 table 101
ip rule add fwmark 2 table 102

# mark the packets
iptables -t mangle -N MATCH1
iptables -t mangle -N MATCH2
iptables -t mangle -A MATCH1 -j MARK --set-mark  1
iptables -t mangle -A MATCH1 -j CONNMARK --save-mark
iptables -t mangle -A MATCH2 -j MARK --set-mark  2
iptables -t mangle -A MATCH2 -j CONNMARK --save-mark

# based on 50/50 split
iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -m mark --mark 0 -m state --state NEW -m 
statistic --mode random --probability 0.5 -j MATCH1
iptables -t mangle -A PREROUTING -m mark --mark 0 -m state --state NEW  -j 
MATCH2

# snat the packets on if eth1
iptables -t nat -N SNAT1
iptables -t nat -A SNAT1 -m statistic --mode random --probability 0.20 -j 
SNAT --to-source x.x.181.60
iptables -t nat -A SNAT1 -m statistic --mode random --probability 0.25 -j 
SNAT --to-source x.x.183.72
iptables -t nat -A SNAT1 -m statistic --mode random --probability 0.33 -j 
SNAT --to-source x.x.183.73
iptables -t nat -A SNAT1 -m statistic --mode random --probability 0.50 -j 
SNAT --to-source x.x.183.74
iptables -t nat -A SNAT1                                               -j 
SNAT --to-source x.x.183.75

# snat the packets on if eth4
iptables -t nat -N SNAT2
iptables -t nat -A SNAT2 -m statistic --mode random --probability 0.20 -j 
SNAT --to-source x.x.96.34
iptables -t nat -A SNAT2 -m statistic --mode random --probability 0.25 -j 
SNAT --to-source x.x.96.35
iptables -t nat -A SNAT2 -m statistic --mode random --probability 0.33 -j 
SNAT --to-source x.x.96.36
iptables -t nat -A SNAT2 -m statistic --mode random --probability 0.50 -j 
SNAT --to-source x.x.96.37
iptables -t nat -A SNAT2                                               -j 
SNAT --to-source x.x.96.38

# snat based on destination if
iptables -t nat -A POSTROUTING -o eth1 -j SNAT1
iptables -t nat -A POSTROUTING -o eth4 -j SNAT2

# configure forwarding
echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 1 > /proc/sys/net/ipv4/ip_forward
ip route flush cache

===============================================


--

Got needs? Get Goblin'! - http://www.pricegoblin.co.uk/ 

