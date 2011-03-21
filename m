From: BERTRAND Joel <joel.bertrand@systella.fr>
Subject: [sparc specific bug ?] Iptables, iproute2 and mark
Date: Mon, 21 Mar 2011 23:30:03 +0100
Message-ID: <4D87D16B.8050005@systella.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

	Hello,

	I have upgraded a sparc box from 2.6.30.9 to 2.6.38 linux kernel 
(sun4v) and iptables 1.4.10. This box has four ethernet interfaces and I 
have written a script to route packets with iptables and iproute2:

eth0 : WAN (default)
eth1 : DMZ
eth2 : LAN
eth3 : WAN2

	Default gateway for LAN is eth0. For DMZ, default gateway is eth3. My 
script contains:

IPTABLES=/sbin/iptables
ROUTE=/sbin/route
IPROUTE2=/bin/ip

...

$ROUTE add default gw 213.215.42.65 dev eth0
$IPROUTE2 rule add from 213.215.42.69 lookup local_traffic priority 100
$IPROUTE2 rule add fwmark 1 table local_traffic priority 101
$IPROUTE2 route add default via 213.215.42.65 dev eth3 table\
	local_traffic
$IPROUTE2 route flush cache

$IPTABLES -t mangle -A PREROUTING -s 192.168.0.0/24 -j MARK --set-mark 1
$IPTABLES -t nat -A POSTROUTING -o eth3 -m mark --mark 1 -j SNAT \
	--to-source 213.215.42.69

echo 0 > /proc/sys/net/ipv4/conf/eth3/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth0/arp_ignore
echo 1 > /proc/sys/net/ipv4/conf/eth3/arp_ignore
echo 1 > /proc/sys/net/ipv4/conf/eth0/arp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth3/arp_filter

	I can post all my script but it is long and without any interest. With 
2.6.30.9 kernel, my script works fine. With 2.6.38, it doesn't. Packets 
from DMZ are not routed by eth3. Any idea ?

	Regards,

	JB
