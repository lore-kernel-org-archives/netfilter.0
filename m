From: "Oskar Andreasson" <blueflux@koffein.net>
Subject: Fw: iptables - if you can find the time, I am stuck
Date: Fri, 14 Jun 2002 10:58:03 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <009a01c21381$97f2dce0$6501a8c0@multisofteducation.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0098_01C21392.5B693650"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org, maltec@tiscali.dk

This is a multi-part message in MIME format.

------=_NextPart_000_0098_01C21392.5B693650
Content-Type: text/plain;
	charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Sorry to say, but I am simply too swamped to even read through this.=20

CC maltec@tiscali.dk since he is not on the list.

Have a nice day,

Oskar Andreasson
http://iptables-tutorial.haringstad.com
http://people.unix-fu.org/andreasson/
mailto: blueflux@koffein.net

----- Original Message -----=20
From: <maltec@tiscali.dk>
To: <blueflux@koffein.net>
Sent: Wednesday, June 12, 2002 5:55 PM
Subject: iptables - if you can find the time, I am stuck


Oskar,

I appreciated your iptables tutorial, but I am probably too dense
to glean the right amount of knowledge from it.
My setup:
router external ip 213.237.89.99
internal address (gateway) 192.168.1.1
My machine (RH Advanced Server) 192.168.1.2, netmask 255.255.255.0

I wish to allow ports 80, 8888, 8080, ssh, dcc
from outside, but almost anything coming IN from 192.168.1.2-10

Likewise, I wish to allow almost anything going OUT to the Internet.

I have but one ethernet card, eth0 and am running ADSL through a Cisco =
677
router.

My previous firewall, SuSE 8.0) worked like a charm, but I decided to =
try
Red Hat Linux Advanced Server, which uses ipchains as a default. I =
dropped
that and now want to use iptables, but the following iptables script =
prevents
me from accessing the Internet from my machine!

I'd appreciate any assistance you can provide, even rejection if you do
not have the time or inclination. I am busy myself ;-)

I attach my script, which deviates very little from your example.

Best Regards,

Malte Christensen
Med venlig hilsen
Best Regards,
Mit freundlichen/herzlichen Gruesse

N. Malte Christensen

http://www.maltec.linux.dk



------=_NextPart_000_0098_01C21392.5B693650
Content-Type: application/octet-stream;
	name="iptables_malte.dat"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="iptables_malte.dat"

=0A=
#!/bin/sh=0A=
#=0A=
# rc.firewall - Initial SIMPLE IP Firewall test script for 2.4.x=0A=
#=0A=
# Author: Oskar Andreasson &lt;blueflux@koffein.net&gt;=0A=
# (c) of BoingWorld.com, use at your own risk, do whatever you please =
with=0A=
# it as long as you don't distribute this without due credits to=0A=
# BoingWorld.com=0A=
#=0A=
=0A=
###########=0A=
# Configuration options, these will speed you up getting this script to=0A=
# work with your own setup.=0A=
=0A=
#=0A=
# your LAN's IP range and localhost IP. /24 means to only use the first =
24 =0A=
# bits of the 32 bit IP adress. the same as netmask 255.255.255.0=0A=
#=0A=
# INET_IP is used by me to allow myself to do anything to myself, might=0A=
# be a security risc but sometimes I want this. If you don't have a =
static=0A=
# IP, I suggest not using this option at all for now but it's stil=0A=
# enabled per default and will add some really nifty security bugs for =
all=0A=
# those who skips reading the documentation=3D)=0A=
=0A=
LAN_IP=3D"192.168.1.2"=0A=
LAN_IP_RANGE=3D"192.168.1.0/24"=0A=
LAN_BCAST_ADRESS=3D"192.168.1.255"=0A=
LAN_IFACE=3D"eth0"=0A=
=0A=
LO_IFACE=3D"lo"=0A=
LO_IP=3D"127.0.0.1"=0A=
=0A=
INET_IP=3D"213.237.89.99"=0A=
INET_IFACE=3D"eth0"=0A=
=0A=
IPTABLES=3D"/sbin/iptables"=0A=
=0A=
#########=0A=
# Load all required IPTables modules=0A=
#=0A=
/sbin/depmod -a=0A=
=0A=
#=0A=
# Adds some iptables targets like LOG and MASQUARADE.=0A=
#=0A=
#/sbin/modprobe ipt_LOG=0A=
#/sbin/modprobe ipt_MASQUERADE=0A=
/sbin/modprobe ip_tables=0A=
/sbin/modprobe ip_conntrack=0A=
/sbin/modprobe iptable_filter=0A=
/sbin/modprobe iptable_mangle=0A=
/sbin/modprobe iptable_nat=0A=
/sbin/modprobe ipt_LOG=0A=
/sbin/modprobe ipt_limit=0A=
/sbin/modprobe ipt_state=0A=
=0A=
#########=0A=
#=0A=
# Enable ip_forward, this is critical since it is turned off as default =
in =0A=
# Linux.=0A=
#=0A=
echo "1" > /proc/sys/net/ipv4/ip_forward=0A=
=0A=
#=0A=
# Dynamic IP users:=0A=
#=0A=
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr=0A=
=0A=
#########=0A=
#=0A=
# Enable simple IP Forwarding and Network Address Translation=0A=
#=0A=
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source =
$INET_IP=0A=
=0A=
#=0A=
# Bad TCP packets we don't want=0A=
#=0A=
$IPTABLES -A FORWARD -p tcp ! --syn -m state --state NEW -j LOG =
--log-prefix "IPT FORWARD New not syn:"=0A=
$IPTABLES -A FORWARD -p tcp ! --syn -m state --state NEW -j DROP=0A=
=0A=
#=0A=
# Accept the packets we actually want to forward=0A=
#=0A=
$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT=0A=
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT =0A=
$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG =
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "=0A=
=0A=
#########=0A=
#=0A=
# Set default policies for the INPUT, FORWARD and OUTPUT chains=0A=
#=0A=
$IPTABLES -P INPUT DROP=0A=
$IPTABLES -P OUTPUT DROP=0A=
$IPTABLES -P FORWARD DROP=0A=
=0A=
#=0A=
# Create chain for bad tcp packets=0A=
# =0A=
$IPTABLES -N bad_tcp_packets=0A=
=0A=
#########=0A=
#=0A=
# Create separate chains for ICMP, TCP and UDP to traverse=0A=
#=0A=
$IPTABLES -N icmp_packets=0A=
$IPTABLES -N tcp_packets=0A=
$IPTABLES -N udpincoming_packets=0A=
=0A=
#=0A=
# bad_tcp_packets chain=0A=
# $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j =
LOG --log-prefix "New not syn:"=0A=
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP=0A=
=0A=
#=0A=
# The allowed chain for TCP connections=0A=
#=0A=
$IPTABLES -N allowed=0A=
$IPTABLES -A allowed -p TCP --syn -j ACCEPT=0A=
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j =
ACCEPT=0A=
$IPTABLES -A allowed -p TCP -j DROP=0A=
=0A=
#=0A=
# ICMP rules=0A=
#=0A=
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 0 -j ACCEPT=0A=
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j ACCEPT=0A=
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 5 -j ACCEPT=0A=
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT=0A=
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT=0A=
=0A=
#=0A=
# TCP rules=0A=
#=0A=
$IPTABLES -A tcp_packets -p TCP -s 0/0 -j LOG --log-prefix "IPT =
tcp_packets :"=0A=
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed=0A=
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 25 -j allowed=0A=
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed=0A=
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed=0A=
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 1810 -j allowed=0A=
=0A=
#=0A=
# UDP ports=0A=
#=0A=
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 25 -j ACCEPT=0A=
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 53 -j ACCEPT=0A=
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 123 -j =
ACCEPT=0A=
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 2074 -j =
ACCEPT=0A=
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 4000 -j =
ACCEPT=0A=
=0A=
#########=0A=
#=0A=
# PREROUTING chain.=0A=
#=0A=
# Do some checks for obviously spoofed IP's =0A=
#=0A=
#$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 192.168.1.0/16 -j DROP=0A=
#$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 10.0.0.0/8 -j DROP=0A=
#$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 172.16.0.0/12 -j DROP=0A=
=0A=
#########=0A=
#=0A=
# INPUT chain=0A=
#=0A=
# Take care of bad TCP packets that we don't want=0A=
#=0A=
$IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j LOG =
--log-prefix "IPT INPUT New not syn:"=0A=
$IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j DROP=0A=
=0A=
#=0A=
# Rules for incoming packets from the internet=0A=
#=0A=
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets=0A=
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets=0A=
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udpincoming_packets=0A=
=0A=
#=0A=
# Rules for special networks not part of the Internet=0A=
#=0A=
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_BCAST_ADRESS -j ACCEPT=0A=
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -d $LO_IP -j ACCEPT=0A=
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -d $LAN_IP -j ACCEPT=0A=
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_IP -j ACCEPT=0A=
$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state =
ESTABLISHED,RELATED -j ACCEPT=0A=
$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG =
--log-level DEBUG --log-prefix "IPT INPUT packet died: "=0A=
=0A=
#=0A=
# OUTPUT chain=0A=
#=0A=
$IPTABLES -A OUTPUT -p tcp ! --syn -m state --state NEW -j LOG =
--log-prefix "IPT OUTPUT New not syn:"=0A=
$IPTABLES -A OUTPUT -p tcp ! --syn -m state --state NEW -j DROP=0A=
=0A=
$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT=0A=
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT=0A=
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j LOG --log-prefix "IPT OUTPUT =
$INET_IP: "=0A=
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT=0A=
$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG =
--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "=0A=
=0A=

------=_NextPart_000_0098_01C21392.5B693650--


