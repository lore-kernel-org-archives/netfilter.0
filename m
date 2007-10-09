From: =?ISO-8859-1?Q?BERTRAND_Jo=EBl?= <joel.bertrand@systella.fr>
Subject: Two WAN adapters, iproute2 and routing locally generated packets
Date: Tue, 09 Oct 2007 13:21:26 +0200
Message-ID: <470B6436.40009@systella.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

	Hello,

	I'm installing the following network :

clusters (ip from 192.168.1.71 to 192.168.1.78, network serial console
from 182.168.1.171 to 192.168.1.178)
|
|
eth2
Server 1 (eth1)--------- Server 2
| |
| 213.215.42.69 (eth3)
|
213.215.42.70 (eth0) and virtual addresses from 213.215.42.71 to
213.215.42.78

Default route of server 1 must be eth0 (iproute2 does not route virtual
devices).

Default route for Server 2 and locally generated traffic of server 1
must be eth3 (not eth0).

I don't know how route locally generated packets by eth3. All locally
generated packets are marked (mark 1), but not routed. I use following
script :

#!/bin/bash

IPTABLES=/sbin/iptables
ROUTE=/sbin/route
IPROUTE2=/bin/ip
IFUP=/sbin/ifup
IFDOWN=/sbin/ifdown
IFCONFIG=/sbin/ifconfig
FAIL2BAN=/etc/init.d/fail2ban
MDADM=/sbin/mdadm
MOUNT=/bin/mount
UMOUNT=/bin/umount
DEV=/dev/md7

GATEWAY=213.215.42.65

function clean ()
{
         $IPTABLES -F INPUT
         $IPTABLES -F OUTPUT
         $IPTABLES -F FORWARD
         $IPTABLES -t nat -F POSTROUTING
         $IPTABLES -t mangle -F PREROUTING
         $IPTABLES -t mangle -F OUTPUT

         $IPTABLES -P INPUT ACCEPT
         $IPTABLES -P OUTPUT ACCEPT
         $IPTABLES -P FORWARD ACCEPT
         $IPROUTE2 route del default via $GATEWAY dev eth3 table
local_traffic
         $IPROUTE2 route flush cache

         $IPROUTE2 rule del from 213.215.42.69 lookup local_traffic
         $IPROUTE2 rule del fwmark 0x01 table local_traffic

         echo 0 > /proc/sys/net/ipv4/conf/eth0/arp_ignore
         echo 0 > /proc/sys/net/ipv4/conf/eth3/arp_ignore

         $IFDOWN eth0 >& /dev/null
         $IFDOWN eth1 >& /dev/null
         $IFDOWN eth2 >& /dev/null
         $IFDOWN eth3 >& /dev/null
}

function master ()
{
         $IPTABLES -P INPUT DROP
         $IPTABLES -P OUTPUT DROP
         $IPTABLES -P FORWARD DROP

# Default rules

         $IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
         $IPTABLES -A INPUT -m state --state INVALID -j DROP
         $IPTABLES -A INPUT -p icmp -j ACCEPT
         $IPTABLES -A INPUT -i lo -j ACCEPT
         $IPTABLES -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
         $IPTABLES -A OUTPUT -m state --state INVALID -j DROP
         $IPTABLES -A OUTPUT -p icmp -j ACCEPT
         $IPTABLES -A OUTPUT -o lo -j ACCEPT

# Heartbeat link

         $IPTABLES -A INPUT -i eth1 -j ACCEPT
         $IPTABLES -A OUTPUT -o eth1 -j ACCEPT

# Public interface (local traffic)
         $IPTABLES -A INPUT -i eth3 -p tcp -m tcp --dport ssh -j ACCEPT
         $IPTABLES -A INPUT -i eth3 -p tcp -m tcp --dport domain -j ACCEPT
         $IPTABLES -A INPUT -i eth3 -p udp -m udp --dport domain -j ACCEPT
         $IPTABLES -A INPUT -i eth3 -p tcp -m tcp --dport mysql -j ACCEPT

         $IPTABLES -A OUTPUT -o eth3 -p tcp -m tcp --dport ftp -j ACCEPT
         $IPTABLES -A OUTPUT -o eth3 -p tcp -m tcp --dport www -j ACCEPT
         $IPTABLES -A OUTPUT -o eth3 -p tcp -m tcp --dport domain -j ACCEPT
         $IPTABLES -A OUTPUT -o eth3 -p udp -m udp --dport domain -j ACCEPT
         $IPTABLES -A OUTPUT -o eth3 -p udp -m udp --dport ntp -j ACCEPT

# Local network

         $IPTABLES -A OUTPUT -o eth2 -p tcp -m tcp --dport ssh -j ACCEPT

# Gateway for slave host

         $IPTABLES -A FORWARD -i eth1 -o eth3 -p tcp -m tcp --dport ftp
-j ACCEPT
         $IPTABLES -A FORWARD -i eth1 -o eth3 -p tcp -m tcp --dport www
-j ACCEPT
         $IPTABLES -A FORWARD -i eth1 -o eth3 -p udp -m udp --dport ntp
-j ACCEPT
         $IPTABLES -A FORWARD -i eth1 -o eth3 -p tcp -m tcp --dport domain \
                 -j ACCEPT
         $IPTABLES -A FORWARD -i eth1 -o eth3 -p udp -m udp --dport domain \
         $IPTABLES -A FORWARD -i eth1 -o eth3 -p icmp -j ACCEPT

         $IPTABLES -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
         $IPTABLES -A FORWARD -m state --state INVALID -j DROP
         $IPTABLES -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth3 -j
MASQUERADE

# Mount network interfaces

         $IFUP eth0 >& /dev/null
         $IFUP eth1 >& /dev/null
         $IFUP eth2 >& /dev/null
         $IFUP eth3 >& /dev/null

# eth0 : default route. All routed traffics use eth3 with iproute2.

         $ROUTE del default dev eth1
         $ROUTE add default gw $GATEWAY dev eth0

# Start servers routing tables

#       $IPROUTE2 rule add from 213.215.42.69 lookup local_traffic
priority 100
         $IPROUTE2 rule add from 213.215.42.69 lookup local_traffic
priority 100
         $IPROUTE2 rule add fwmark 1 table local_traffic priority 101

         $IPROUTE2 route add default via $GATEWAY dev eth3 table
local_traffic
         $IPROUTE2 route flush cache

         echo 0 > /proc/sys/net/ipv4/conf/eth3/rp_filter
         echo 1 > /proc/sys/net/ipv4/conf/eth0/arp_ignore
         echo 1 > /proc/sys/net/ipv4/conf/eth3/arp_ignore
         echo 1 > /proc/sys/net/ipv4/conf/eth0/arp_filter
         echo 1 > /proc/sys/net/ipv4/conf/eth3/arp_filter

# Local traffic routes

         $IPTABLES -t mangle -A PREROUTING -s 192.168.0.0/24 -j MARK
--set-mark 1
         $IPTABLES -t mangle -A OUTPUT -d 192.168.0.0/24 -j RETURN
         $IPTABLES -t mangle -A OUTPUT -d 192.168.1.0/24 -j RETURN
         $IPTABLES -t mangle -A OUTPUT -s 213.215.42.70 -j RETURN
         $IPTABLES -t mangle -A OUTPUT -j MARK --set-mark 1
         $IPTABLES -A INPUT -m tcp -p tcp --dport 22 -j ACCEPT

# Virtual interfaces

#       $IFCONFIG eth0:1 213.215.42.71 netmask 255.255.255.240 up
# Public interface (routed traffic)

         for i in ftp www
         do
                 $IPTABLES -A FORWARD -i eth2 -o eth0 -p tcp -m tcp \
                         --dport $i -j ACCEPT
         done
}

function slave ()
{
         $IFUP eth1 >& /dev/null

# eth1 : default route. WAN is accessible by master host.
}
case "$1" in
         master)
                 clean
                 master
         ;;

         slave)
                 clean
                 slave
         ;;

         *)
                 echo "Usage: network {master|slave}"
         ;;
esac

exit 0

	Any idea ?

	Regards,

	JKB

