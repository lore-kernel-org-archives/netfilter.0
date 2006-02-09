From: Mark-Walter@t-online.de
Subject: Re: iptables rule chain question
Date: Thu, 9 Feb 2006 19:42:00 +0100
Message-ID: <20060209184200.GB4875@server.homelinux.net>
References: <20060209131739.GA4441@server.homelinux.net>
	<43EB4EE4.7010004@prosyst.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <43EB4EE4.7010004@prosyst.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> >Does it mean iptables DROP every TCP connection in the case syn,rst,ack is 
> >not set and the connection is not established.
 
> Yes and no. Yes, it will drop the rest of the tcp packets going
> through this chain ONLY. And no, because this is a user defined
> chain. Since it is a user defined, then one of the native chains
> filter INPUT, filter OUTPUT, etc. should have an exisiting rule,
> which sends SOME packets through it.

Ok, I understand.

> Somewhere in your script you have a rule like this, but not
> necessary exactly the same:
 
> iptables -A INPUT -p tcp -s <one_ip> -d <second_ip> -j allowed
 
No, I'am not using and INPUT with a source and destination adress to be
allowed. 

See attached my firewall script ...

Here's my network topology:

I've two debian pc's behind a dsl-modem (router which is doing NAT and
has 192.168.178.1).
The name of the debian router maybe cat and has as a input device
192.168.178.89 and as a output device 192.168.0.1. The second PC is also
debian but it's in the LAN behind the debian router and has the ip
192.168.0.99. So both of them have the gateway 192.168.178.1.

Everything is working so far ...

Do I need your recommended INPUT with source and destination to have a
secure debian router for my LAN ?

-- 
Best Regards,

Mark

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="FIREWALL.txt"

#!/bin/sh


echo 1 > /proc/sys/net/ipv4/ip_dynaddr

echo 1 > /proc/sys/net/ipv4/ip_forward

echo 1 > /proc/sys/net/ipv4/tcp_syncookies

 iptables -F # flush aller chains (Tabelle filter)
 iptables -X # delete all userdefined chains
 iptables -t nat -F # flush aller chains (Tabelle nat)


#
# We're using masquerade
#
 iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
 iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmt
 iptables -A FORWARD -s 192.168.0.1 -j DROP

#
# Create chain which blocks new connections, except if coming from inside.
#
 iptables -N block
 iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT
 iptables -A block -m state --state NEW -i ! eth0 -j ACCEPT
 iptables -A block -j DROP

## Jump to that chain from INPUT and FORWARD chains.
 iptables -A INPUT -j block
 iptables -A FORWARD -j block

#
#Syn-flood protection:
#
 iptables -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT

#
#Furtive port scanner:
#
 iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT

#
#Ping of death:
#
 iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT

#
#An example of this powerful match extension would be:
#
 iptables -A FORWARD -i eth0 -m state ! --state NEW -j DROP

#
# Disallow NEW and INVALID incoming or forwarded packets from eth0.
#
 iptables -A INPUT -i eth0 -m state --state NEW,INVALID -j DROP
 iptables -A FORWARD -i eth0 -m state --state NEW,INVALID -j DROP

#
# connection tracking 
#
 iptables -N no-conns-from-eth0
 iptables -A no-conns-from-eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
 iptables -A no-conns-from-eth0 -m state --state NEW -i ! eth0 -j ACCEPT
 iptables -A no-conns-from-eth0 -i eth0 -m limit -j LOG --log-prefix "Bad packet from eth0:"
 iptables -A no-conns-from-eth0 -i ! eth0 -m limit -j LOG --log-prefix "Bad packet not from eth0:"
 iptables -A no-conns-from-eth0 -j DROP

 iptables -A INPUT -j no-conns-from-eth0
 iptables -A FORWARD -j no-conns-from-eth0

#
# 1.1 Internet Configuration.
#

INET_IP="x.x.x.x"
INET_IFACE="eth0"
INET_BROADCAST="x.x.x.255"


#
# 1.2 Local Area Network configuration.
#
# your LAN's IP range and localhost IP. /24 means to only use the first 24
# bits of the 32 bit IP address. the same as netmask 255.255.255.0
#

LAN_IP="192.168.0.1"
LAN_IP_RANGE="192.168.0.0/16"
LAN_IFACE="eth1"

#
# 1.4 Localhost Configuration.
#

LO_IFACE="lo"
LO_IP="127.0.0.1"

#
# 1.5 IPTables Configuration.
#

IPTABLES="/sbin/iptables"

#
# 3.1 Required proc configuration
#

#echo "1" > /proc/sys/net/ipv4/ip_forward

#echo 1 > /proc/sys/net/ipv4/ip_dynaddr

#
# 3.2 Non-Required proc configuration
#

echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo "1" > /proc/sys/net/ipv4/conf/all/proxy_arp

#
# Disable source routed packets
#
for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
    echo 0 > $f
    done

# Disable ICMP Redirect Acceptance
for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
    echo 0 > $f
    done 

# Don<B9>t send Redirect Messages
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do
    echo 0 > $f
    done

# Log packets with impossible addresses.
for f in /proc/sys/net/ipv4/conf/*/log_martians; do
    echo 1 > $f
done

#
# 4.1.1 Set policies
#

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

#
# Create chain for bad tcp packets
#

$IPTABLES -N bad_tcp_packets

#
# Create separate chains for ICMP, TCP and UDP to traverse
#

$IPTABLES -N allowed
$IPTABLES -N tcp_packets
$IPTABLES -N udp_packets
$IPTABLES -N icmp_packets

#
# 4.1.3 Create content in userspecified chains
#

#
# This enables Masquerade
#
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmt

iptables -A FORWARD -s 192.168.0.1 -j DROP

#
# bad_tcp_packets chain
#

$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK \
-m state --state NEW -j REJECT --reject-with tcp-reset 
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG \
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

#
# allowed chain
#

$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

#
# TCP rules
#

$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 110 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 25 -j allowed
#
# UDP ports
#

$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 53 -j ACCEPT
#$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 123 -j ACCEPT
#$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 2074 -j ACCEPT
#$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 4000 -j ACCEPT

#
# ICMP rules
#

$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

#
# 4.1.4 INPUT chain
#

#
# Bad TCP packets we don't want.
#

$IPTABLES -A INPUT -p tcp -j bad_tcp_packets

#
# Rules for special networks not part of the Internet
#

$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT

#
# Special rule for DHCP requests from LAN, which are not caught properly
# otherwise.
#

$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT

#
# Rules for incoming packets from the internet.
#

$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELATED \
-j ACCEPT
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udp_packets
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets

#
# Log weird packets that don't match the above.
#

$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT INPUT packet died: "

#
# 4.1.5 FORWARD chain
#

#
# Bad TCP packets we don't want
#

$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets

#
# Accept the packets we actually want to forward
#

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#
# Log weird packets that don't match the above.
#

$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "

#
# 4.1.6 OUTPUT chain
#

#
# Bad TCP packets we don't want.
#

$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

#
# Special OUTPUT rules to decide which IP's to allow.
#

$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT

#
# Log weird packets that don't match the above.
#

$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "

#
# Enable simple IP Forwarding and Network Address Translation
#

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP







--tThc/1wpZn/ma/RB--

