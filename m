From: =?windows-1251?B?3/Du8evg4iDC6O3t6Pb86ujp?= <yaroslav65@ukr.net>
Subject: Two WAN interfaces. Route traffic based on --uid-owner
Date: Thu, 19 Feb 2009 06:24:57 +0200
Message-ID: <567612571.20090219062457@ukr.net>
Reply-To: =?windows-1251?B?3/Du8evg4iDC6O3t6Pb86ujp?= <yaroslav65@ukr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello. Please help me. I have one linux box with two WAN's, both
PPPoE: ppp0 and ppp1. My goal is to route particular user's traffic
through ppp1. Here are the relevant rules:

#! With this rule we mark traffic
iptables -t mangle -A OUTPUT -m owner --uid-owner myuser -j MARK --set-mark 1

#!user-generated traffic goes to ppp1 (table b)
ip rule add fwmark 1 pref 100 table b

#!Cloning remaining routes to our new table
ip route show table main | grep -Ev ^default | grep -v "$IP_GATEWAY_B" | while read ROUTE; do ip route add table b $ROUTE; done

#!Adding default route to table "b"
ip route add default dev ppp1 table b

At first it seemed fine, but there are some problems. When i've tried
to patch up the firewall i discovered that rule
iptables -A INPUT -i ppp1 -s 0.0.0.0/0 -d IP_OF_ppp1 -m state --state ESTABLISHED,RELATED -j ACCEPT
(when we have following catch-all rule)
iptables -A INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -j REJECT
does not suffice and this traffic gets blocked.

However, when i've changed IP_OF_ppp1 to IP_OF_ppp0 in the above rule everything
"worked" with the exception that ppp1-traffic is somehow dependant on
ppp0 interface (when ppp0 goes down, so do ppp1-connections). I think
it's not the way.
I don't know how and when these packets get IP of ppp0. I give up.
I've read lartc.org etc. and can't figure this out. I've tried to mark
outgoing connection with CONNMARK and DNAT coming back (as packet in INPUT chain
seems to have different IP) packets to
IP_OF_ppp1, but to no avail:

iptables -t mangle -A OUTPUT -m mark --mark 1 -j CONNMARK --save-mark
iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t nat -A PREROUTING -j DNAT --to-destination IP_OF_ppp1

My full iptables/iproute2 script adding below. Thanks.











#!/bin/sh
IP_OF_ppp0="`ifconfig ppp0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`"
IP_OF_ppp1="`ifconfig ppp1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`"
IP_GATEWAY_ppp0="`ifconfig ppp0 | grep 'inet addr:' | cut -d: -f3 | awk '{ print $1}'`"
IP_GATEWAY_ppp1="`ifconfig ppp1 | grep 'inet addr:' | cut -d: -f3 | awk '{ print $1}'`"
UNIVERSE="0.0.0.0/0"

echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

#! Clearing any existing rules and setting default policy to DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -F -t mangle
iptables -F -t nat
iptables -F -t filter
#! Delete all User-specified chains
iptables -X
#! Reset all IPTABLES counters
iptables -Z -t mangle
iptables -Z -t nat
iptables -Z -t filter

##############See http://lartc.org/howto/lartc.rpdb.multiple-links.html
ip route add $IP_GATEWAY_ppp0 dev ppp0 src $IP_OF_ppp0 table u
ip route add default via $IP_GATEWAY_ppp0 table u
ip route add $IP_GATEWAY_ppp1 dev ppp1 src $IP_OF_ppp1 table b
ip route add default via $IP_GATEWAY_ppp1 table b
ip rule add from $IP_OF_ppp0 pref 100 table u
ip rule add from $IP_OF_ppp1 pref 101 table b
##############End http://lartc.org/howto/lartc.rpdb.multiple-links.html

#! With this rule we mark traffic
iptables -t mangle -A OUTPUT -m owner --uid-owner myuser -j MARK --set-mark 1

#!user-generated traffic goes to ppp1 (table b)
ip rule add fwmark 1 pref 99 table b

#!Cloning remaining routes to our new table
ip route show table main | grep -Ev ^default | grep -v "$IP_GATEWAY_B" | while read ROUTE; do ip route add table b $ROUTE; done

#!Adding default route to table "b"
ip route add default dev ppp1 table b

#! --------------- START OF INPUT RULES ---------------- #
#! loopback interfaces are valid
iptables -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
#! If you would like your machine to "ping" from the Internet, enable these next lines
iptables -A INPUT -i ppp0 -p ICMP -s $UNIVERSE -d $IP_OF_ppp0 -j ACCEPT
iptables -A INPUT -i ppp1 -p ICMP -s $UNIVERSE -d $IP_OF_ppp1 -j ACCEPT
#! Allow any related traffic coming back to the MASQ server in
iptables -A INPUT             -s $UNIVERSE -d $IP_OF_ppp0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i ppp1 -s $UNIVERSE -d $IP_OF_ppp1 -m state --state ESTABLISHED,RELATED -j ACCEPT
#! Catch all rule, all other incoming is denied
iptables -A INPUT -s $UNIVERSE -d $UNIVERSE -j REJECT
#! --------------- END OF INPUT RULES ----------------

#! --------------- START OF OUTPUT RULES ---------------- #
#! Workaround bug in netfilter
iptables -A OUTPUT -m state -p icmp --state INVALID -j DROP
#! loopback interface is valid.
iptables -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
#! anything else outgoing on remote interface is valid
iptables -A OUTPUT -o ppp0 -s $IP_OF_ppp0 -d $UNIVERSE -j ACCEPT
iptables -A OUTPUT -o ppp1 -s $IP_OF_ppp1 -d $UNIVERSE -j ACCEPT
#! Catch all rule, all other outgoing is denied
iptables -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j REJECT
#! --------------- END OF OUTPUT RULES ----------------

#! --------------- START OF NAT RULES ---------------- #
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to $IP_OF_ppp0
iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to $IP_OF_ppp1
#! --------------- END OF NAT RULES ---------------- #


