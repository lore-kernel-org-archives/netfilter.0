From: O-Zone <liste@zerozone.it>
Subject: DMZ to DMZ - COMPLETE CONFIGURATION
Date: Thu, 20 May 2004 18:37:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201837.36780.liste@zerozone.it>
Reply-To: liste@zerozone.it
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Description: clearsigned data
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

=46irst thanks to all to try solve my problem. To simplify it, i've cutpast=
ed=20
the full firewall configuration:

#!/bin/sh

#
# 1.1 Internet Configuration.
#

INET_IP=3D"151.8.47.82"
SIENA_IP=3D"151.8.47.83"
DOMINI_IP=3D"151.8.47.84"
LEONARDO_IP=3D"151.8.47.85"
PROXYSAT_IP=3D"151.8.47.86"
ELEKTRA_IP=3D"151.8.47.87"
EXCHANGE_IP=3D"151.8.47.90"
INET_IFACE=3D"eth0"

INET2_IP=3D"81.113.95.245"
SIENA2_IP=3D"81.113.95.250"
DOMINI2_IP=3D"81.113.95.251"
INET2_IFACE=3D"eth1"

#
# 1.2 Local Area Network configuration.
#
# your LAN's IP range and localhost IP. /24 means to only use the first 24
# bits of the 32 bit IP address. the same as netmask 255.255.255.0
#

LAN_IP=3D"10.0.0.1"
LAN2_IP=3D"172.16.0.1"
LAN_IFACE=3D"eth3"

#
# 1.3 DMZ Configuration.
#

DMZ_IP=3D"192.168.0.1"
DMZ_SIENA_IP=3D"192.168.0.2"
DMZ_DOMINI_IP=3D"192.168.0.3"
DMZ_ELEKTRA_IP=3D"192.168.0.7"
DMZ_EXCHANGE_IP=3D"192.168.0.10"
DMZ_PROXYSAT_IP=3D"192.168.0.11"
DMZ_LEONARDO_IP=3D"192.168.0.12"
DMZ_IFACE=3D"eth2"

#
# 1.4 Localhost Configuration.
#

LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"

#
# 1.5 IPTables Configuration.
#

IPTABLES=3D"/usr/sbin/iptables"

echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
echo "1" > /proc/sys/net/ipv4/conf/all/accept_source_route

$IPTABLES -F INPUT=20
$IPTABLES -F OUTPUT=20
$IPTABLES -F FORWARD=20

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP
$IPTABLES -N bad_tcp_packets


$IPTABLES -N allowed
$IPTABLES -N icmp_packets

$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m state=20
=2D --state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG=20
=2D --log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

# IPSEC
$IPTABLES -A INPUT -p udp --dport 500 -j ACCEPT
$IPTABLES -A INPUT -p 50 -j ACCEPT
$IPTABLES -A INPUT -p 51 -j ACCEPT

#
# ICMP rules
#

# Changed rules totally
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

#
# 4.1.4 INPUT chain
#

#
# Bad TCP packets we don't want
#

$IPTABLES -A INPUT -p tcp -j bad_tcp_packets

#
# Packets from the Internet to this box
#

$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets

$IPTABLES -A INPUT -p ICMP -i $INET2_IFACE -j icmp_packets

#
# Packets from LAN, DMZ or LOCALHOST
#

#
# From DMZ Interface to DMZ firewall IP
#

$IPTABLES -A INPUT -p ALL -i $DMZ_IFACE -d $DMZ_IP -j ACCEPT

#
# From LAN Interface to LAN firewall IP
#

$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN2_IP -j ACCEPT

#
# From Localhost interface to Localhost IP's
#

$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN2_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET2_IP -j ACCEPT

#
# Special rule for DHCP requests from LAN, which are not caught properly
# otherwise.
#

$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT

#
# All established and related packets incoming from the internet to the
# firewall
#

$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELATED =
=2Dj=20
ACCEPT
$IPTABLES -A INPUT -p ALL -d $INET2_IP -m state --state ESTABLISHED,RELATED=
 -j=20
ACCEPT

$IPTABLES -A INPUT -p TCP -d $INET_IP -m multiport --dports 22 -j ACCEPT

#
# In Microsoft Networks you will be swamped by broadcasts. These lines
# will prevent them from showing up in the logs.
#


$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
=2D --log-level DEBUG --log-prefix "IPT INPUT packet died: "

$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets

$IPTABLES -A FORWARD -i $DMZ_IFACE -o $INET_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state --state=20
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -o $DMZ_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN_IFACE -m state --state=20
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -i $DMZ_IFACE -o $INET2_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $INET2_IFACE -o $DMZ_IFACE -m state --state=20
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -o $DMZ_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN_IFACE -m state --state=20
ESTABLISHED,RELATED -j ACCEPT

#
# LAN section
#

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#
# Log weird packets that don't match the above.
#

$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG=20
=2D --log-level DEBUG --log-prefix "IPT FORWARD packet died: "

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
$IPTABLES -A OUTPUT -p ALL -s $LAN2_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET2_IP -j ACCEPT

#
# Log weird packets that don't match the above.
#

$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG=20
=2D --log-level DEBUG --log-prefix "IPT OUTPUT packet died: "

######
# 4.2 nat table
#

$IPTABLES -t nat -F

########################### PORT FORWARDING DA ESTERNO AD INTRANET
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $LAN_IFACE -d 10.0.0.50 --dpo=
rt=20
1494 -j allowed # CITRIX ICA
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d 151.8.47.82 --dport=
=20
1494 -j DNAT --to-destination 10.0.0.50

########################### SERVIZI DOMINI.TDSIENA.IT=20
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP -=
m=20
multiport --dports 25,110 -j allowed # SOLO SIENA
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DOMINI_IP =
=2Dm=20
multiport --dports 20,21,53,80 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DOMINI_IP =
=2Dm=20
multiport --dports 53 -j ACCEPT

$IPTABLES -A FORWARD -p TCP -i $INET2_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP =
=2Dm=20
multiport --dports 25,110 -j allowed # SOLO SIENA
$IPTABLES -A FORWARD -p TCP -i $INET2_IFACE -o $DMZ_IFACE -d $DMZ_DOMINI_IP=
 -m=20
multiport --dports 20,21,53,80 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET2_IFACE -o $DMZ_IFACE -d $DMZ_DOMINI_IP=
 -m=20
multiport --dports 53 -j ACCEPT

$IPTABLES -A FORWARD -p TCP -i $LAN_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP -m=
=20
multiport --dports 25,110 -j allowed # SOLO SIENA
$IPTABLES -A FORWARD -p TCP -i $LAN_IFACE -o $DMZ_IFACE -d $DMZ_DOMINI_IP -=
m=20
multiport --dports 20,21,53,80 -j allowed
$IPTABLES -A FORWARD -p UDP -i $LAN_IFACE -o $DMZ_IFACE -d $DMZ_DOMINI_IP -=
m=20
multiport --dports 53 -j ACCEPT

$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DOMINI_IP=
 -j=20
icmp_packets

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DOMINI_IP -m=20
multiport --dports 20,21,80 -j DNAT --to-destination $DMZ_DOMINI_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DOMINI_IP -m=20
multiport --dport 25,110 -j DNAT --to-destination $DMZ_SIENA_IP

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET2_IFACE -d $DOMINI_IP -m=20
multiport --dports 20,21,80 -j DNAT --to-destination $DMZ_DOMINI_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET2_IFACE -d $DOMINI_IP -m=20
multiport --dport 25,110 -j DNAT --to-destination $DMZ_SIENA_IP

$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN_IFACE -d $DOMINI_IP -m multip=
ort=20
=2D --dports 20,21,80 -j DNAT --to-destination $DMZ_DOMINI_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN_IFACE -d $DOMINI_IP -m multip=
ort=20
=2D --dport 25,110 -j DNAT --to-destination $DMZ_SIENA_IP


########################### SERVIZI SIENA.TDSIENA.IT=20
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP -=
m=20
multiport --dports 25,53,110 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP -=
m=20
multiport --dports 53 -j allowed

$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP =
=2Dj=20
icmp_packets

$IPTABLES -A FORWARD -p TCP -i $INET2_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP =
=2Dm=20
multiport --dports 25,53,110 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET2_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP =
=2Dm=20
multiport --dports 53 -j allowed

$IPTABLES -A FORWARD -p ICMP -i $INET2_IFACE -o $DMZ_IFACE -d $DMZ_SIENA_IP=
 -j=20
icmp_packets

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SIENA_IP -m multip=
ort=20
=2D --dports 25,53,80,110 -j DNAT --to-destination $DMZ_SIENA_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $SIENA_IP -m multip=
ort=20
=2D --dports 53 -j DNAT --to-destination $DMZ_SIENA_IP

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET2_IFACE -d $SIENA_IP -m=20
multiport --dports 25,53,80,110 -j DNAT --to-destination $DMZ_SIENA_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET2_IFACE -d $SIENA_IP -m=20
multiport --dports 53 -j DNAT --to-destination $DMZ_SIENA_IP

$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN_IFACE -d $SIENA_IP -m multipo=
rt=20
=2D --dports 25,53,80,110 -j DNAT --to-destination $DMZ_SIENA_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN_IFACE -d $SIENA_IP -m multipo=
rt=20
=2D --dports 53 -j DNAT --to-destination $DMZ_SIENA_IP

########################### SERVIZI EXCHANGE.TDSIENA.IT=20
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_EXCHANGE_I=
P=20
=2D -m multiport --dports 80,110,143,389,443,691,3268 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_EXCHANGE_I=
P=20
=2D -m multiport --dports 135,389 -j allowed

$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_EXCHANGE_=
IP=20
=2D -j icmp_packets

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $EXCHANGE_IP -m=20
multiport --dports 80,110,135,143,389,443,691,3268 -j DNAT --to-destination=
=20
$DMZ_EXCHANGE_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $EXCHANGE_IP -m=20
multiport --dports 135,389 -j DNAT --to-destination $DMZ_EXCHANGE_IP

########################### SERVIZI PROXYSAT.TDSIENA.IT=20
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_PROXYSAT_I=
P=20
=2D --dport 80 -j allowed
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_PROXYSAT_=
IP=20
=2D -j icmp_packets

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $PROXYSAT_IP --dpor=
t=20
80 -j DNAT --to-destination $DMZ_PROXYSAT_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN_IFACE -d $PROXYSAT_IP --dport=
 80=20
=2D -j DNAT --to-destination $DMZ_PROXYSAT_IP

########################### SERVIZI LEONARDO
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_LEONARDO_I=
P=20
=2D -m multiport --dports 80,3389 -j allowed
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_LEONARDO_I=
P=20
=2D --dport 4000:10000 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_LEONARDO_I=
P=20
=2D --dport 4000:10000 -j allowed

$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_LEONARDO_=
IP=20
=2D -j icmp_packets

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $LEONARDO_IP -m=20
multiport --dports 80,3389 -j DNAT --to-destination $DMZ_LEONARDO_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $LEONARDO_IP --dpor=
t=20
4000:10000 -j DNAT --to-destination $DMZ_LEONARDO_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $LEONARDO_IP --dpor=
t=20
4000:10000 -j DNAT --to-destination $DMZ_LEONARDO_IP

$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN_IFACE -d $LEONARDO_IP -m=20
multiport --dports 80,3389 -j DNAT --to-destination $DMZ_LEONARDO_IP

########################### SERVIZI ELEKTRA
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_ELEKTRA_IP=
 -m=20
multiport --dports 20,21,22,25,80,110 -j allowed
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $ELEKTRA_IP -m=20
multiport --dports 20,21,22,25,80,110 -j DNAT --to-destination=20
$DMZ_ELEKTRA_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN_IFACE -d $ELEKTRA_IP -m=20
multiport --dports 20,21,22,25,80,110 -j DNAT --to-destination=20
$DMZ_ELEKTRA_IP

$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_ELEKTRA_I=
P=20
=2D -j icmp_packets

# Squid Trasparent Proxy
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN_IFACE -s 10.0.0.0/24 --dport =
80=20
=2D -j REDIRECT --to-port 8080
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN_IFACE -s 172.16.0.0/24 --dpor=
t=20
80 -j REDIRECT --to-port 8080

#
# POSTROUTING chain
#

$IPTABLES -t nat -A POSTROUTING -s 10.0.0.0/24 -j MASQUERADE
$IPTABLES -t nat -A POSTROUTING -s 172.16.0.0/24 -j MASQUERADE

$IPTABLES -t nat -A POSTROUTING -o $INET2_IFACE -s 192.168.0.0/24 -d=20
81.113.95.242 -j MASQUERADE

$IPTABLES -t nat -A POSTROUTING -s 192.168.0.0/24 -d 192.168.0.0/24 -p tcp =
=2Dj=20
SNAT --to 192.168.0.1

$IPTABLES -t nat -A POSTROUTING -s $DMZ_SIENA_IP -o $INET_IFACE -j SNAT=20
=2D --to-source $SIENA_IP
$IPTABLES -t nat -A POSTROUTING -s $DMZ_DOMINI_IP -o $INET_IFACE -j SNAT=20
=2D --to-source $DOMINI_IP
$IPTABLES -t nat -A POSTROUTING -s $DMZ_EXCHANGE_IP -o $INET_IFACE -j SNAT=
=20
=2D --to-source $EXCHANGE_IP
$IPTABLES -t nat -A POSTROUTING -s $DMZ_ELEKTRA_IP -o $INET_IFACE -j SNAT=20
=2D --to-source $ELEKTRA_IP
$IPTABLES -t nat -A POSTROUTING -s $DMZ_LEONARDO_IP -o $INET_IFACE -j SNAT=
=20
=2D --to-source $LEONARDO_IP
$IPTABLES -t nat -A POSTROUTING -s $DMZ_PROXYSAT_IP -o $INET_IFACE -j SNAT=
=20
=2D --to-source $PROXYSAT_IP

There's the full IP...i hope that anyone try to hack me ;-)

Oz

=2D --=20
Mulder: I know what I saw, Scully. and I saw you about to do
	the wild thing with some stranger!

	"The X-Files: Genderbender"
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArN7OYuBSFbgkEysRAvDOAKCXTRreZTgXJU04HoY17Ty2zbsBqgCgm7iv
AmsqRbGcm2wc5e3l985xilA=3D
=3DDCpW
=2D----END PGP SIGNATURE-----


