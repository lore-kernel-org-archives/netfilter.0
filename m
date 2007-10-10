From: =?ISO-8859-1?Q?BERTRAND_Jo=EBl?= <joel.bertrand@systella.fr>
Subject: [iptables/iproute2] Output interface and UDP packets
Date: Wed, 10 Oct 2007 23:17:31 +0200
Message-ID: <470D416B.7060603@systella.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

	Hello,

	I have made a test with a linux box connected by two NIC's on the same 
LAN. This box is a 32 processors UltraSparc server and runs with 
2.6.23-rc9 linux kernel (sparc64/SMP) on a debian/testing distribution.

eth0: 213.215.42.70/24
eth3: 213.215.42.69/24

With the following iptables/iproute2 rules :

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P OUTPUT ACCEPT

route add default gw 213.215.42.65 dev eth0
iproute2 rule add from 213.215.42.69 lookup local_traffic priority 100
iproute2 rule add fwmark 1 table local_traffic priority 101
iproute2 route add default via 213.215.42.65 dev eth3 table local_traffic
iproute2 route flush cache

echo 0 > /proc/sys/net/ipv4/conf/eth3/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth0/arp_ignore
echo 1 > /proc/sys/net/ipv4/conf/eth3/arp_ignore
echo 1 > /proc/sys/net/ipv4/conf/eth0/arp_filter
echo 1 > /proc/sys/net/ipv4/conf/eth3/arp_filter

iptables -t mangle -A INPUT -d 213.215.42.70 -j CONNMARK --set-mark 2
iptables -t mangle -A OUTPUT -m connmark --mark 2 -j RETURN
iptables -t mangle -A OUTPUT -j MARK --set-mark 1

	Whit these command lines, I obtain :

Root gershwin:[~] > route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
213.215.42.64   *               255.255.255.240 U     0      0        0 eth0
213.215.42.64   *               255.255.255.240 U     0      0        0 eth3
default         213.215.42.65   0.0.0.0         UG    0      0        0 eth0
Root gershwin:[~] > Root gershwin:[~] > ip rule show
0:      from all lookup local
100:    from 213.215.42.69 lookup local_traffic
101:    from all fwmark 0x1 lookup local_traffic
32766:  from all lookup main
32767:  from all lookup default
Root gershwin:[~] > Root gershwin:[~] > ip route
213.215.42.64/28 dev eth0  proto kernel  scope link  src 213.215.42.70
213.215.42.64/28 dev eth3  proto kernel  scope link  src 213.215.42.69
default via 213.215.42.65 dev eth0
Root gershwin:[~] > ip route show table local_traffic
default via 213.215.42.65 dev eth3
Root gershwin:[~] >

All locally generated packets are routed via eth3, but with eth0 IP 
address. Problem... Thus, I have added the following line to fix this 
mistake :

iptables -t nat -A POSTROUTING -m mark --mark 1 -j SNAT \
	--to-source 213.215.42.69

Now :

All ICMP (ping) and TCP (ssh for example) are routed via eth3. I can do 
a ssh on external server without any trouble. But UDP packets are sent 
via eth0 (but with eth3 IP address) _and_ received via eth3 :

Packets received by eth3:
23:04:37.159721 IP kimsufi.gegeweb.org.ntp > brahms.systella.net.ntp: 
NTPv4, Server, length 48
23:04:38.159888 IP goelette.net.ntp > brahms.systella.net.ntp: NTPv4, 
Server, length 48
23:04:38.159950 IP ns.oredin.net.ntp > brahms.systella.net.ntp: NTPv4, 
Server, length 48

and send by eth0 (brahms is eth3 address)
23:02:47.940968 IP brahms.systella.net.ntp > ntp.dr-j.eu.ntp: NTPv4, 
Client, length 48
23:03:05.940974 IP brahms.systella.net.ntp > goelette.net.ntp: NTPv4, 
Client, length 48
23:03:06.940979 IP brahms.systella.net.ntp > ns.oredin.net.ntp: NTPv4, 
Client, length 48

	I don't understand why datagrams are not routed by eth3. All 
explanations are welcome ;-)

	Regards,

	JKB
