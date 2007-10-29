From: Tarak Ranjan <tarak.ranjan@liqwidkrystal.com>
Subject: Gateway with Iptables
Date: Mon, 29 Oct 2007 10:29:14 +0530
Message-ID: <472568A2.3040002@liqwidkrystal.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

Hi List,
i have a proxy server, when i enable the proxy my mail clients are not=20
able to send/receive mail. here is my iptables. please help me with the=
=20
necessary changes.

#######################################################################=
######

# Internet Interface
INET_IFACE=3D"eth1"
INET_ADDRESS=3D"x.x.x.x"
# Local Interface Information
LOCAL_IFACE=3D"eth0"
LOCAL_IP=3D"192.168.1.3"
LOCAL_NET=3D"192.168.1.0/24"
LOCAL_BCAST=3D"192.168.1.255"
# Localhost Interface
LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"
#SQUID
SQUID_SERVER=3D=93192.168.1.3?
SQUID_PORT=3D"8080"
echo "SSH Blocking.........."
$IPT -A INPUT -p tcp -s 192.168.1.210 -d 0/0 --dport 22 -j ACCEPT
$IPT -A INPUT -p tcp -s 192.168.1.123 -d 0/0 --dport 22 -j ACCEPT
$IPT -A INPUT -p tcp -s 192.168.1.37 -d 0/0 --dport 22 -j ACCEPT
$IPT -A FORWARD -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.123=20
-d 0/0 --dport 22 -j ACCEPT
$IPT -A FORWARD -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.37 -=
d=20
0/0 --dport 22 -j ACCEPT
#$IPT -A FORWARD -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.37=20
-d 0/0 --dport 22 -j ACCEPT
$IPT -A FORWARD -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.210=20
-d 0/0 --dport 22 -j ACCEPT
$IPT -A FORWARD -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.0/24=
=20
-d 0/0 --dport 22 -j DROP
#$IPT -A OUTPUT -i $LOCAL_IFACE -o $INET_IFACE -p tcp -s 192.168.1.38 -=
d=20
0/0 --dport 22 -j ACCEP

$IPT -A FORWARD -p tcp -s 0/0 -d x.x.x.y/32 --destination-port 25 --syn=
=20
-j ACCEPT
#$IPT -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT --to=20
192.168.1.100:25
#$IPT -A FORWARD -p tcp -d 192.168.1.100 --dport 25 -j ACCEPT
$IPT -A INPUT -p tcp -s 0/0 --dport 22 -j DROP
$IPT -A INPUT -p tcp -s 0/0 --dport 3306 -j DROP
#$IPT -A FORWARD -p tcp -d 0/0 -s 0/0 --dport 80 -j DROP
$IPT -A INPUT -p tcp -s 0/0 --dport 111 -j DROP
$IPT -A INPUT -p tcp -s 0/0 --dport 199 -j DROP
$IPT -A INPUT -p tcp -s 0/0 --dport 443 -j ACCEPT
#
# This chain is used with a private network to prevent forwarding for
# requests on specific protocols. Applied to the FORWARD rule from
# the internal network. Ends with an ACCEPT

# Block IRC
$IPT -A tcp_outbound -p TCP -s 0/0 --destination-port 194 -j REJECT

# Block Outbound Telnet
$IPT -A tcp_outbound -p TCP -s 0/0 --destination-port 23 -j REJECT

# Block SSH
$IPT -A tcp_outbound -p TCP -s 0/0 --destination-port 22 -j REJECT

# Block Usenet Access
$IPT -A tcp_outbound -p TCP -s 0/0 --destination-port 119 -j REJECT


# No match, so ACCEPT
$IPT -A tcp_outbound -p TCP -s 0/0 -j ACCEPT

# Allow all on localhost interface
$IPT -A INPUT -p ALL -i $LO_IFACE -j ACCEPT

# Drop bad packets
$IPT -A INPUT -p ALL -j bad_packets
$IPT -A INPUT -p ALL -d 224.0.0.1 -j DROP
# The rule to# Rules for the private network (accessing gateway system=20
itself)
$IPT -A INPUT -p ALL -i $LOCAL_IFACE -s $LOCAL_NET -j ACCEPT
$IPT -A INPUT -p ALL -i $LOCAL_IFACE -d $LOCAL_BCAST -j ACCEPT


# Inbound Internet Packet Rules

# Accept Established Connections
$IPT -A INPUT -p ALL -i $INET_IFACE -m state --state ESTABLISHED,RELATE=
D \
-j ACCEPT

# broadcast protocols.
$IPT -A INPUT -m pkttype --pkt-type broadcast -j DROP

# Log packets that still don't match
$IPT -A INPUT -j LOG --log-prefix "fp=3DINPUT:99 a=3DDROP "
# Used if forwarding for a private network

# Drop bad packets
$IPT -A FORWARD -p ALL -j bad_packets

# Accept TCP packets we want to forward from internal sources
$IPT -A FORWARD -p tcp -i $LOCAL_IFACE -j tcp_outbound

# Accept UDP packets we want to forward from internal sources
$IPT -A FORWARD -p udp -i $LOCAL_IFACE -j udp_outbound

# If not blocked, accept any other packets from the internal interface
$IPT -A FORWARD -p ALL -i $LOCAL_IFACE -j ACCEPT

# Deal with responses from the internet
$IPT -A FORWARD -i $INET_IFACE -m state --state ESTABLISHED,RELATED \
-j ACCEPT

# Log packets that still don't match
$IPT -A FORWARD -j LOG --log-prefix "fp=3DFORWARD:99 a=3DDROP "
#######################################################################=
#####
#Redirect all 80 port request to 8080 SQUID PROXY Added By TARAK
# DNAT port 80 request comming from LAN systems to squid 3128=20
($SQUID_PORT) aka transparent proxy

#$IPT -t nat -A PREROUTING -p tcp -i eth1 --dport 80 -j REDIRECT=20
--to-ports $SQUID_PORT
#$IPT -t nat -A POSTROUTING -o eth1 -s $LOCAL_NET -j MASQUERADE
#$IPT -A FORWARD -s $LOCAL_NET -d $SQUID_SERVER -i eth1 -o eth0 -p tcp=20
--dport $SQUID_PORT -j ACCEPT
$IPT -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT=20
--to-port $SQUID_PORT
#######################################################################=
########
$IPT -A OUTPUT -m state -p icmp --state INVALID -j DROP
$IPT -A OUTPUT -p ALL -s $LOCAL_IP -j ACCEPT
$IPT -A OUTPUT -p ALL -o $LOCAL_IFACE -j ACCEPT

# To internet
$IPT -A OUTPUT -p ALL -o $INET_IFACE -j ACCEPT

# Log packets that still don't match
$IPT -A OUTPUT -j LOG --log-prefix "fp=3DOUTPUT:99 a=3DDROP "


--=20
Thanks & Regards,

Tarak Ranjan
___________________________
IS-Team
Liqwid Krystal

T:   +91 80  2509 1790 Ext. 107
E@:  tarak.ranjan@liqwidkrystal.com
IM:  reachtarak@hotmail.com

Online Learning|Certification|Learning Solutions: http://www.liqwidkrys=
tal.com=20




