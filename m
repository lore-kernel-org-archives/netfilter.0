From: Paul Baxter <ppabaxte@bigpond.net.au>
Subject: Newbie question about iptables an gateway boxes
Date: Sat, 02 Aug 2003 08:03:36 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2AE3B8.1090008@bigpond.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi I have a small net at home with linux box as gateway hopefully. I can 
ping the net from my windows box and get email...,but web pages don't 
open, the DNS numbers are correct in /etc/resolv.conf and it will 
resolve when I  "ping  -c 5 www.atomicmpc.com.au ".
I am thinking it is todo with my iptables script...here it is;   Thanks 
for all help Paul

#!/bin/sh
#
# Atomic IPTables firewall script v1.0
#
# Simple but effective firewall for use
# in home/small office installations.
#
# Ashton Mills
# Written for the Atomic Uber Linux box guide,
# Issue 21, Oct 2002.
#
# Props to Con Tassios and Technion for their sample scripts.

# Environment variables, change these values accordingly

    EXT_IF="ppp0"
    INT_IF="eth0"
    INT_NET="192.168.1.0/24"

    ANY="0.0.0.0/0"

    IPTABLES="/sbin/iptables"
    MODPROBE="/sbin/modprobe"

#
# You shouldn't need to touch anything below here
#

# Load appropriate iptables modules, others will be loaded dynamically 
on demand

    $MODPROBE ip_tables
    $MODPROBE iptable_filter
    $MODPROBE ip_nat_ftp
    $MODPROBE ip_conntrack
    $MODPROBE ip_conntrack_ftp

# Set proc values for TCP/IP. In order:
#
# Disable IP spoofing attacks
# Ignore broadcast pings
# Block source routing
# Kill redirects
# Set acceptable local port range
# Allow dynamic IP addresses
# Enable forwarding (gateway)

    echo "2" > /proc/sys/net/ipv4/conf/all/rp_filter
    echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
    echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
    echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
    echo "32768 61000" > /proc/sys/net/ipv4/ip_local_port_range
    echo "1" > /proc/sys/net/ipv4/ip_dynaddr
    echo "1" > /proc/sys/net/ipv4/ip_forward

# Flush everything

    $IPTABLES -F INPUT
    $IPTABLES -F OUTPUT
    $IPTABLES -F FORWARD
    $IPTABLES -t nat -F
   
#
## --- DEFAULT POLICY --- ##
#

# Drop everything on INPUT and FORWARD chains, accept OUTPUT

    $IPTABLES -P INPUT DROP
    $IPTABLES -P FORWARD DROP
    $IPTABLES -P OUTPUT ACCEPT

#
## --- INPUT CHAIN --- ##
#

# Allow Telstra hearbeat -- BPA users uncomment this

#    $IPTABLES -A INPUT -p udp --sport 5050 -j ACCEPT
#    $IPTABLES -A INPUT -p udp --sport 5051 -j ACCEPT

# Allow bootp port -- Optus users need this apparently
   
    $IPTABLES -A INPUT -p udp -d 255.255.255.255 --dport 68 -j ACCEPT

# Accept all connections on local and internal interfaces

    $IPTABLES -A INPUT -i lo -j ACCEPT
    $IPTABLES -A INPUT -i $INT_IF -j ACCEPT

# Stateful inspection -- Allow packets in from connections already 
established

    $IPTABLES -A INPUT -i $EXT_IF -m state --state ESTABLISHED,RELATED 
-j ACCEPT

# Drop packets from invalid sources (reserved networks and localhost)

    $IPTABLES -A INPUT -i $EXT_IF -s 10.0.0.0/8 -j DROP
    $IPTABLES -A INPUT -i $EXT_IF -s 172.16.0.0/12 -j DROP
    $IPTABLES -A INPUT -i $EXT_IF -s 192.168.0.0/16 -j DROP
    $IPTABLES -A INPUT -i $EXT_IF -s 169.254.0.0/16 -j DROP
    $IPTABLES -A INPUT -d 127.0.0.0/8 -j DROP
   
# Don't log igmp, ident, web or ssl. More noise we don't need to log.

    $IPTABLES -A INPUT -p igmp -j DROP
    $IPTABLES -A INPUT -p tcp --dport 113 -j DROP
    $IPTABLES -A INPUT -p tcp --dport 80 -j DROP
    $IPTABLES -A INPUT -p tcp --dport 443 -j DROP

# Log everything else

    $IPTABLES -A INPUT -i $EXT_IF -j LOG --log-prefix "|iptables -- "

#
## --- FORWARD CHAIN --- ##
#

# Stateful inspection -- Allow packets in from connections already 
established

    $IPTABLES -A FORWARD -i $EXT_IF -o $INT_IF -s $ANY -d $INT_NET -m 
state --state ESTABLISHED,RELATED -j ACCEPT

# Allow all traffic out

    $IPTABLES -A FORWARD -i $INT_IF -d $ANY -j ACCEPT

#
## --- OUTPUT CHAIN --- ##
#

# Follows policy

#
## --- NAT --- ##
#

# Enable masquerade

    $IPTABLES -A POSTROUTING -t nat -o $EXT_IF -j MASQUERADE

#
## -- Transparent proxy to Squid --- ##
#

    $IPTABLES -t nat -A PREROUTING -i $INT_IF -p tcp --dport 80 -j 
REDIRECT --to-port 3128


