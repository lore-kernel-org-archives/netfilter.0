From: "Tim Roberts" <techlists@dsslink.net>
Subject: Bridging Firewall
Date: Wed, 5 Feb 2003 17:01:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c2cd62$2c9e82f0$8c7aad41@everity.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01C2CD38.43A4C650"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0009_01C2CD38.43A4C650
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, I successfully configured (I think) a bridging firewall using Script =
provided in David Whitmarsh's how too at =
http://www.sparkle-cc.co.uk/firewall/firewall.html I have a few =
questions as I am trying VERY hard to never have to see a Windows =
XXAnything disc again.

1.) I do not see anything other than IPTables starting up and =
learning.......in /var/log/messages. I have unremarked kernal* to point =
to /var/log/messages. I think the only logging being done is if a DOS =
occurrs. Based on his script, how do I enable more or any logging that =
will show me a little or alot of something? :)

2.) I have 2 NIC's both public (which is why I choose to bridge) In this =
script, I enabled the option to allow remote access from my LAN. However =
I cannot even ping.....from inside the LAN ,the specified address in the =
script to the firewall.

3.) The firewall cannot ping outside the LAN (which I could care less) =
but Im getting messages when the script runs that the machine cannot =
lookup or resolve FQDN's specified to be blocked.=20



Any help is greatly appreciated. Below is the script after I modified =
it.  I am using REDHat 8.0 with IPTables Bridg Util Patch.

Tim Roberts
techlists@dsslink.net
#!/bin/sh
#
# rc.firewall - Initial SIMPLE IP Firewall test script for 2.4.x
#
# Author: David Whitmarsh
# (c) 2001, 2002 Sparkle Computer Co ltd.
# based on rc.firewall by Oskar Andreasson <blueflux@koffein.net>
# parts (c) of BoingWorld.com, use at your own risk,
# do whatever you please with
# it as long as you don't distribute this without due credits to
# BoingWorld.com and Sparkle Computer Co Ltd
#

###########
# Configuration options, these will speed you up getting this script to
# work with your own setup.

#
# your LAN's IP range and localhost IP. /24 means to only use the first =
24=20
# bits of the 32 bit IP adress. the same as netmask 255.255.255.0
#
# BR_IP is used to access the firewall accross the network
# For maxium security don't set one up - but then you must do
# everything directly on the firewall.

BR_IP=3D65.173.10.254
BR_IFACE=3Dbr0

LAN_BCAST_ADDRESS=3D65.173.13.255
INTERNAL_ADDRESS_RANGE=3D65.173.120.0/22

INET_IFACE=3D"eth1"
LAN_IFACE=3D"eth0"

LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"

IPTABLES=3D"/sbin/iptables"

#########
# Load all required IPTables modules
#

#
# Needed to initially load modules
#
/sbin/depmod -a

#
# Adds some iptables targets like LOG, REJECT
#
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_REJECT

#
# Support for connection tracking of FTP and IRC.
#
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_conntrack_irc

#
# Take down the interfaces before setting up the bridge
#

ifdown $INET_IFACE
ifdown $LAN_IFACE
ifconfig $INET_IFACE 0.0.0.0
ifconfig $LAN_IFACE 0.0.0.0

# Clean up for a restart

$IPTABLES -F=20
$IPTABLES -X
#
# Set default policies for the INPUT, FORWARD and OUTPUT chains
#

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP

# Our interfaces don't have IP addresses so we have to start with the =
mangle
# PREROUTING table

$IPTABLES -t mangle -P PREROUTING DROP

# Now we are pretty secure, let's start the bridge
# This will create a new interface

brctl addbr $BR_IFACE

# and add the interfaces to it
brctl addif $BR_IFACE $INET_IFACE
brctl addif $BR_IFACE $LAN_IFACE

# make us visible to the network again (optional)
if [ "$BR_IP" !=3D "" ] ; then
    ifconfig $BR_IFACE $BR_IP
else
# otherwise we must at least bring the interface up for the bridge to =
work.
    ifconfig $BR_IFACE up
fi

# Block obvious spoofs

$IPTABLES -t mangle -A PREROUTING -s 192.168.0.0/16 -j DROP
$IPTABLES -t mangle -A PREROUTING -s 10.0.0.0/8 -j DROP
$IPTABLES -t mangle -A PREROUTING -s 172.16.0.0/12 -j DROP

# Accept internal packets on the internal i/f
$IPTABLES -t mangle -A PREROUTING -i $LAN_IFACE -s =
$INTERNAL_ADDRESS_RANGE -j ACCEPT

# Accept external packets on the external i/f

$IPTABLES -t mangle -A PREROUTING -i $INET_IFACE ! -s =
$INTERNAL_ADDRESS_RANGE -j ACCEPT

#
# Accept the packets we actually want to forward
#

$IPTABLES -A FORWARD -p ALL -s $INTERNAL_ADDRESS_RANGE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT=20
$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG =
--log-level 7 --log-prefix "IPT FORWARD packet died: "

#
# Create separate chains for ICMP, TCP and UDP to traverse
#

$IPTABLES -N icmp_packets
#
# ICMP rules
#

$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 0 -j ACCEPT	# echo =
reply
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j ACCEPT	# dest =
unreachable
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 5 -j ACCEPT	# =
redirect
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT	# time =
exceeded
$IPTABLES -A FORWARD -p ICMP -j icmp_packets

#
# UDP ports
#
$IPTABLES -N udpincoming_packets

$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 53 -j =
ACCEPT	# DNS
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 123 -j =
ACCEPT	# ntp
#$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 2074 -j =
ACCEPT	# speakfreely
#$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 4000 -j =
ACCEPT	#icq

$IPTABLES -A FORWARD -p UDP -j udpincoming_packets

#

$IPTABLES -N tcp_packets

#
# The allowed chain for TCP connections
#

$IPTABLES -N allowed
$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j =
ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

# TCP rules
#

#
# Bad TCP packets we don't want
#

$IPTABLES -A tcp_packets -p tcp ! --syn -m state --state NEW -j LOG =
--log-prefix "New not syn:"
$IPTABLES -A tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

$IPTABLES -A tcp_packets -p TCP -s 0/0 -d springfield.sparkle-cc.co.uk =
--dport 80 -j allowed # smtp
$IPTABLES -A tcp_packets -p TCP -s 0/0 -d lisa.sparkle-cc.co.uk --dport =
6346 -j allowed # gnutella
$IPTABLES -A tcp_packets -p TCP -s 0/0 -d springfield.sparkle-cc.co.uk =
--dport 25 -j allowed # smtp

$IPTABLES -A FORWARD -p TCP -j tcp_packets

#
# Input to the firewall itself. Leave these out if you don't want the =
firewall
# to be visible on the network at all.
# Note that the PREROUTING restrictions above mean that only packets =
form inside
# the firewall can fulfill the source condition. So the firewall machine =
should not be
# visible to the internet.
#

$IPTABLES -A INPUT -p ALL -i $BR_IFACE -s $INTERNAL_ADDRESS_RANGE -d =
$LAN_BCAST_ADDRESS -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $BR_IFACE -s $INTERNAL_ADDRESS_RANGE -d =
$BR_IP -j ACCEPT

# But you *will* need this

$IPTABLES -A INPUT -p ALL -i $LO_IFACE -d $LO_IP -j ACCEPT

$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG =
--log-level 7 --log-prefix "IPT INPUT packet died: "

#
# OUTPUT chain
#

$IPTABLES -A OUTPUT -p tcp ! --syn -m state --state NEW -j LOG =
--log-prefix "New not syn:"
$IPTABLES -A OUTPUT -p tcp ! --syn -m state --state NEW -j DROP

$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $BR_IP -j ACCEPT
$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG =
--log-level 7 --log-prefix "IPT OUTPUT packet died: "

------=_NextPart_000_0009_01C2CD38.43A4C650
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi, I successfully configured (I think) =
a bridging=20
firewall using Script provided in David Whitmarsh's how too at <A=20
href=3D"http://www.sparkle-cc.co.uk/firewall/firewall.html">http://www.sp=
arkle-cc.co.uk/firewall/firewall.html</A>=20
I have a few questions as I am trying VERY hard to never have to see a =
Windows=20
XXAnything disc again.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>1.) I do not see anything other than =
IPTables=20
starting up and learning.......in /var/log/messages. I have unremarked =
kernal*=20
to point to /var/log/messages. I think the only logging being done is if =
a DOS=20
occurrs. Based on his script, how do I enable more or any logging that =
will show=20
me a little or alot of&nbsp;something? :)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>2.) I have 2 NIC's both public (which =
is why I=20
choose to bridge) In this script, I enabled the option to allow remote =
access=20
from my LAN. However I cannot even ping.....from inside the LAN ,the =
specified=20
address in the script to the firewall.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>3.) The firewall cannot ping outside =
the LAN (which=20
I could care less) but Im getting messages when the script runs that the =
machine=20
cannot lookup or resolve FQDN's specified to be blocked. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any help is greatly appreciated. Below =
is the=20
script after I modified it.&nbsp; I am using REDHat 8.0 with IPTables =
Bridg Util=20
Patch.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Tim Roberts</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>techlists@dsslink.net</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><PRE>#!/bin/sh
#
# rc.firewall - Initial SIMPLE IP Firewall test script for 2.4.x
#
# Author: David Whitmarsh
# (c) 2001, 2002 Sparkle Computer Co ltd.
# based on rc.firewall by Oskar Andreasson &lt;blueflux@koffein.net&gt;
# parts (c) of BoingWorld.com, use at your own risk,
# do whatever you please with
# it as long as you don't distribute this without due credits to
# BoingWorld.com and Sparkle Computer Co Ltd
#

###########
# Configuration options, these will speed you up getting this script to
# work with your own setup.

#
# your LAN's IP range and localhost IP. /24 means to only use the first =
24=20
# bits of the 32 bit IP adress. the same as netmask 255.255.255.0
#
# BR_IP is used to access the firewall accross the network
# For maxium security don't set one up - but then you must do
# everything directly on the firewall.

BR_IP=3D65.173.10.254
BR_IFACE=3Dbr0

LAN_BCAST_ADDRESS=3D65.173.13.255
INTERNAL_ADDRESS_RANGE=3D65.173.120.0/22

INET_IFACE=3D"eth1"
LAN_IFACE=3D"eth0"

LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"

IPTABLES=3D"/sbin/iptables"

#########
# Load all required IPTables modules
#

#
# Needed to initially load modules
#
/sbin/depmod -a

#
# Adds some iptables targets like LOG, REJECT
#
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_REJECT

#
# Support for connection tracking of FTP and IRC.
#
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_conntrack_irc

#
# Take down the interfaces before setting up the bridge
#

ifdown $INET_IFACE
ifdown $LAN_IFACE
ifconfig $INET_IFACE 0.0.0.0
ifconfig $LAN_IFACE 0.0.0.0

# Clean up for a restart

$IPTABLES -F=20
$IPTABLES -X
#
# Set default policies for the INPUT, FORWARD and OUTPUT chains
#

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP

# Our interfaces don't have IP addresses so we have to start with the =
mangle
# PREROUTING table

$IPTABLES -t mangle -P PREROUTING DROP

# Now we are pretty secure, let's start the bridge
# This will create a new interface

brctl addbr $BR_IFACE

# and add the interfaces to it
brctl addif $BR_IFACE $INET_IFACE
brctl addif $BR_IFACE $LAN_IFACE

# make us visible to the network again (optional)
if [ "$BR_IP" !=3D "" ] ; then
    ifconfig $BR_IFACE $BR_IP
else
# otherwise we must at least bring the interface up for the bridge to =
work.
    ifconfig $BR_IFACE up
fi

# Block obvious spoofs

$IPTABLES -t mangle -A PREROUTING -s 192.168.0.0/16 -j DROP
$IPTABLES -t mangle -A PREROUTING -s 10.0.0.0/8 -j DROP
$IPTABLES -t mangle -A PREROUTING -s 172.16.0.0/12 -j DROP

# Accept internal packets on the internal i/f
$IPTABLES -t mangle -A PREROUTING -i $LAN_IFACE -s =
$INTERNAL_ADDRESS_RANGE -j ACCEPT

# Accept external packets on the external i/f

$IPTABLES -t mangle -A PREROUTING -i $INET_IFACE ! -s =
$INTERNAL_ADDRESS_RANGE -j ACCEPT

#
# Accept the packets we actually want to forward
#

$IPTABLES -A FORWARD -p ALL -s $INTERNAL_ADDRESS_RANGE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT=20
$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG =
--log-level 7 --log-prefix "IPT FORWARD packet died: "

#
# Create separate chains for ICMP, TCP and UDP to traverse
#

$IPTABLES -N icmp_packets
#
# ICMP rules
#

$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 0 -j ACCEPT	# echo =
reply
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j ACCEPT	# dest =
unreachable
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 5 -j ACCEPT	# =
redirect
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT	# time =
exceeded
$IPTABLES -A FORWARD -p ICMP -j icmp_packets

#
# UDP ports
#
$IPTABLES -N udpincoming_packets

$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 53 -j =
ACCEPT	# DNS
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 123 -j =
ACCEPT	# ntp
#$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 2074 -j =
ACCEPT	# speakfreely
#$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 4000 -j =
ACCEPT	#icq

$IPTABLES -A FORWARD -p UDP -j udpincoming_packets

#

$IPTABLES -N tcp_packets

#
# The allowed chain for TCP connections
#

$IPTABLES -N allowed
$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j =
ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

# TCP rules
#

#
# Bad TCP packets we don't want
#

$IPTABLES -A tcp_packets -p tcp ! --syn -m state --state NEW -j LOG =
--log-prefix "New not syn:"
$IPTABLES -A tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

$IPTABLES -A tcp_packets -p TCP -s 0/0 -d springfield.sparkle-cc.co.uk =
--dport 80 -j allowed # smtp
$IPTABLES -A tcp_packets -p TCP -s 0/0 -d lisa.sparkle-cc.co.uk --dport =
6346 -j allowed # gnutella
$IPTABLES -A tcp_packets -p TCP -s 0/0 -d springfield.sparkle-cc.co.uk =
--dport 25 -j allowed # smtp

$IPTABLES -A FORWARD -p TCP -j tcp_packets

#
# Input to the firewall itself. Leave these out if you don't want the =
firewall
# to be visible on the network at all.
# Note that the PREROUTING restrictions above mean that only packets =
form inside
# the firewall can fulfill the source condition. So the firewall machine =
should not be
# visible to the internet.
#

$IPTABLES -A INPUT -p ALL -i $BR_IFACE -s $INTERNAL_ADDRESS_RANGE -d =
$LAN_BCAST_ADDRESS -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $BR_IFACE -s $INTERNAL_ADDRESS_RANGE -d =
$BR_IP -j ACCEPT

# But you *will* need this

$IPTABLES -A INPUT -p ALL -i $LO_IFACE -d $LO_IP -j ACCEPT

$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG =
--log-level 7 --log-prefix "IPT INPUT packet died: "

#
# OUTPUT chain
#

$IPTABLES -A OUTPUT -p tcp ! --syn -m state --state NEW -j LOG =
--log-prefix "New not syn:"
$IPTABLES -A OUTPUT -p tcp ! --syn -m state --state NEW -j DROP

$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $BR_IP -j ACCEPT
$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG =
--log-level 7 --log-prefix "IPT OUTPUT packet died: "
</PRE></FONT></DIV></BODY></HTML>

------=_NextPart_000_0009_01C2CD38.43A4C650--


