From: Doug Watson <doug@1stbooks.com>
Subject: intermittent and unreliable behaviour with iptables scripts
Date: Mon, 11 Nov 2002 12:25:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <91F7518FF779D41181A700010266356D015555D6@mail.springbound.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C289A7.6135E160"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C289A7.6135E160
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C289A7.6135E160"


------_=_NextPart_001_01C289A7.6135E160
Content-Type: text/plain;
	charset="iso-8859-1"

Fellow list users,

I have been attempting to set up a new firewall for my company with the
two goals of 1. implementing statefull packet filtering and 2.
creating a DMZ for servers that need to be accessed by the
outside world, such as HTTP, SMTP, DNS and FTP.

There seems to be a lot to describe here so please stick with me.

I eventually ended up using a script that I ran across at
http://www.linuxguruz.org/iptables/scripts/rc.DMZ.firewall.txt
written by Oskar Andreasson. I was quickly able to reconfigure
the script to match my network configuration and was up and
running. However, I along with my test group of 5 "lucky" users began to see
some
intermittent and unreliable behavior when accessing the internet through
this new firewall most notably when browsing the web. 

When browsing the web, web pages that normally would load very quickly seem 
to hang for an inconsistent amount of time, anywhere between 1 second to 30
seconds or more
before they would even begin to load or would at times never load at all as
if the connection to the web was lost. This state may continue for seemingly
any random amount of time, a few seconds to several minutes or until I
finally
restarted the firewall computer which would bring it around, but would
always
return eventually. Yet users connecting through the current firewall which
is running RedHat
6.2 and using ipfwadm to forward and masquerade experienced none of these
problems. 
I will note that when the firewall is in the state that no web pages will
load, pings to its LAN interface which usually return in about 1ms will time
timeout, but I have not been able to link this to any specific network
issue. 
Nor am I seeing this behaviour anywhere else on our network. 

Also overall speed of our connection seems to be noticeably slower when 
running through this firewall. One example be it a good one or not is 
when running the high speed bandwidth test at http://www.bandwidthplace.com
through the current firewall the average speed returned is between 1.0 and
1.4
Mbps which seems reasonable given that we have 2 T1's that are load balanced
and about 100 users with varying amounts of usage. However, when running the

same test through the new iptables based firewall the average speed returned
usually in the range of 600 to 800 Kbps.

Wondering if this was caused by a bad rule or rules I implemented the
following script 
so there would be no rules. While this is not much of a firewall and would
be
insane to use at all I never experienced any of the problems described above

while using the firewall in this configuration. 
NOTE: my current modification of the script listed above is attached. You
will notice that
all of the DNAT and FORWARDing rules dealing with the DMZ have been
commented out.
They have worked fine but access to and from the DMZ seem to be affected by
the above
mentioned problems as well. 

#!/bin/sh
INET_IP="XXX.XXX.XXX.XXX"
INET_IFACE="eth2"

IPTABLES="/sbin/iptables"
###########################################
# Load all required IPTables modules
#
/sbin/modprobe ip_tables

$IPTABLES -P INPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -P OUTPUT ACCEPT

for i in filter nat mangle
do
$IPTABLES -t $i -F
$IPTABLES -t $i -X
done

#CRITICAL: Enable IP forwarding since it is disabled by default.
echo "1" > /proc/sys/net/ipv4/ip_forward

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP
###########################################################################

Finally the last thing to note for now is that I have changed out nearly 
all of the hardware in this box and am currently using the following
components
with RedHat 8.0 and iptables 1.2.7a.

AMD K6-450 processor (REPLACED)
Asus P5A motherboard (REPLACED)
224Mb PC-100 memory (REPLACED)
3 Netgear FA-310TX NICS (REPLACED 3 3Com 905b-TXNMs and 3 3Com 980C-TXs)
1 ATI 8Mb RAGE IIC AGP graphics card (NO X console only)
1 52X Creative Labs IDE CD-ROM (Secondary Master)
1 10Gb IBM 7200Rpm HardDrive (Primary master) (REPLACED)
1 cheap floppy drive 3.5"

If you have read this far you are a saint.
If anyone has any thoughts in general or would care to comment on 
the attached script I would appreciate any advise given.

Thank you,
Doug Watson


------_=_NextPart_001_01C289A7.6135E160
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2654.45">
<TITLE>intermittent and unreliable behaviour with iptables =
scripts</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Fellow list users,</FONT>
</P>

<P><FONT SIZE=3D2>I have been attempting to set up a new firewall for =
my company with the</FONT>
<BR><FONT SIZE=3D2>two goals of 1. implementing statefull packet =
filtering and 2.</FONT>
<BR><FONT SIZE=3D2>creating a DMZ for servers that need to be accessed =
by the</FONT>
<BR><FONT SIZE=3D2>outside world, such as HTTP, SMTP, DNS and =
FTP.</FONT>
</P>

<P><FONT SIZE=3D2>There seems to be a lot to describe here so please =
stick with me.</FONT>
</P>

<P><FONT SIZE=3D2>I eventually ended up using a script that I ran =
across at</FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"http://www.linuxguruz.org/iptables/scripts/rc.DMZ.firewall.txt" =
TARGET=3D"_blank">http://www.linuxguruz.org/iptables/scripts/rc.DMZ.fire=
wall.txt</A></FONT>
<BR><FONT SIZE=3D2>written by Oskar Andreasson. I was quickly able to =
reconfigure</FONT>
<BR><FONT SIZE=3D2>the script to match my network configuration and was =
up and</FONT>
<BR><FONT SIZE=3D2>running. However, I along with my test group of 5 =
&quot;lucky&quot; users began to see some</FONT>
<BR><FONT SIZE=3D2>intermittent and unreliable behavior when accessing =
the internet through</FONT>
<BR><FONT SIZE=3D2>this new firewall most notably when browsing the =
web. </FONT>
</P>

<P><FONT SIZE=3D2>When browsing the web, web pages that normally would =
load very quickly seem </FONT>
<BR><FONT SIZE=3D2>to hang for an inconsistent amount of time, anywhere =
between 1 second to 30 seconds or more</FONT>
<BR><FONT SIZE=3D2>before they would even begin to load or would at =
times never load at all as</FONT>
<BR><FONT SIZE=3D2>if the connection to the web was lost. This state =
may continue for seemingly</FONT>
<BR><FONT SIZE=3D2>any random amount of time, a few seconds to several =
minutes or until I finally</FONT>
<BR><FONT SIZE=3D2>restarted the firewall computer which would bring it =
around, but would always</FONT>
<BR><FONT SIZE=3D2>return eventually. Yet users connecting through the =
current firewall which is running RedHat</FONT>
<BR><FONT SIZE=3D2>6.2 and using ipfwadm to forward and masquerade =
experienced none of these problems. </FONT>
<BR><FONT SIZE=3D2>I will note that when the firewall is in the state =
that no web pages will</FONT>
<BR><FONT SIZE=3D2>load, pings to its LAN interface which usually =
return in about 1ms will time</FONT>
<BR><FONT SIZE=3D2>timeout, but I have not been able to link this to =
any specific network issue. </FONT>
<BR><FONT SIZE=3D2>Nor am I seeing this behaviour anywhere else on our =
network. </FONT>
</P>

<P><FONT SIZE=3D2>Also overall speed of our connection seems to be =
noticeably slower when </FONT>
<BR><FONT SIZE=3D2>running through this firewall. One example be it a =
good one or not is </FONT>
<BR><FONT SIZE=3D2>when running the high speed bandwidth test at <A =
HREF=3D"http://www.bandwidthplace.com" =
TARGET=3D"_blank">http://www.bandwidthplace.com</A></FONT>
<BR><FONT SIZE=3D2>through the current firewall the average speed =
returned is between 1.0 and 1.4</FONT>
<BR><FONT SIZE=3D2>Mbps which seems reasonable given that we have 2 =
T1's that are load balanced</FONT>
<BR><FONT SIZE=3D2>and about 100 users with varying amounts of usage. =
However, when running the </FONT>
<BR><FONT SIZE=3D2>same test through the new iptables based firewall =
the average speed returned</FONT>
<BR><FONT SIZE=3D2>usually in the range of 600 to 800 Kbps.</FONT>
</P>

<P><FONT SIZE=3D2>Wondering if this was caused by a bad rule or rules I =
implemented the following script </FONT>
<BR><FONT SIZE=3D2>so there would be no rules. While this is not much =
of a firewall and would be</FONT>
<BR><FONT SIZE=3D2>insane to use at all I never experienced any of the =
problems described above </FONT>
<BR><FONT SIZE=3D2>while using the firewall in this configuration. =
</FONT>
<BR><FONT SIZE=3D2>NOTE: my current modification of the script listed =
above is attached. You will notice that</FONT>
<BR><FONT SIZE=3D2>all of the DNAT and FORWARDing rules dealing with =
the DMZ have been commented out.</FONT>
<BR><FONT SIZE=3D2>They have worked fine but access to and from the DMZ =
seem to be affected by the above</FONT>
<BR><FONT SIZE=3D2>mentioned problems as well. </FONT>
</P>

<P><FONT SIZE=3D2>#!/bin/sh</FONT>
<BR><FONT SIZE=3D2>INET_IP=3D&quot;XXX.XXX.XXX.XXX&quot;</FONT>
<BR><FONT SIZE=3D2>INET_IFACE=3D&quot;eth2&quot;</FONT>
</P>

<P><FONT SIZE=3D2>IPTABLES=3D&quot;/sbin/iptables&quot;</FONT>
<BR><FONT SIZE=3D2>###########################################</FONT>
<BR><FONT SIZE=3D2># Load all required IPTables modules</FONT>
<BR><FONT SIZE=3D2>#</FONT>
<BR><FONT SIZE=3D2>/sbin/modprobe ip_tables</FONT>
</P>

<P><FONT SIZE=3D2>$IPTABLES -P INPUT ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -P FORWARD ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -P OUTPUT ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>for i in filter nat mangle</FONT>
<BR><FONT SIZE=3D2>do</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -t $i -F</FONT>
<BR><FONT SIZE=3D2>$IPTABLES -t $i -X</FONT>
<BR><FONT SIZE=3D2>done</FONT>
</P>

<P><FONT SIZE=3D2>#CRITICAL: Enable IP forwarding since it is disabled =
by default.</FONT>
<BR><FONT SIZE=3D2>echo &quot;1&quot; &gt; =
/proc/sys/net/ipv4/ip_forward</FONT>
</P>

<P><FONT SIZE=3D2>$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j =
SNAT --to-source $INET_IP</FONT>
<BR><FONT =
SIZE=3D2>###############################################################=
############</FONT>
</P>

<P><FONT SIZE=3D2>Finally the last thing to note for now is that I have =
changed out nearly </FONT>
<BR><FONT SIZE=3D2>all of the hardware in this box and am currently =
using the following components</FONT>
<BR><FONT SIZE=3D2>with RedHat 8.0 and iptables 1.2.7a.</FONT>
</P>

<P><FONT SIZE=3D2>AMD K6-450 processor (REPLACED)</FONT>
<BR><FONT SIZE=3D2>Asus P5A motherboard (REPLACED)</FONT>
<BR><FONT SIZE=3D2>224Mb PC-100 memory (REPLACED)</FONT>
<BR><FONT SIZE=3D2>3 Netgear FA-310TX NICS (REPLACED 3 3Com 905b-TXNMs =
and 3 3Com 980C-TXs)</FONT>
<BR><FONT SIZE=3D2>1 ATI 8Mb RAGE IIC AGP graphics card (NO X console =
only)</FONT>
<BR><FONT SIZE=3D2>1 52X Creative Labs IDE CD-ROM (Secondary =
Master)</FONT>
<BR><FONT SIZE=3D2>1 10Gb IBM 7200Rpm HardDrive (Primary master) =
(REPLACED)</FONT>
<BR><FONT SIZE=3D2>1 cheap floppy drive 3.5&quot;</FONT>
</P>

<P><FONT SIZE=3D2>If you have read this far you are a saint.</FONT>
<BR><FONT SIZE=3D2>If anyone has any thoughts in general or would care =
to comment on </FONT>
<BR><FONT SIZE=3D2>the attached script I would appreciate any advise =
given.</FONT>
</P>

<P><FONT SIZE=3D2>Thank you,</FONT>
<BR><FONT SIZE=3D2>Doug Watson</FONT>
</P>

<P><FONT FACE=3D"Arial" SIZE=3D2 COLOR=3D"#000000"></FONT>&nbsp;

</BODY>
</HTML>
------_=_NextPart_001_01C289A7.6135E160--

------_=_NextPart_000_01C289A7.6135E160
Content-Type: application/octet-stream;
	name="iptables"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="iptables"

#!/bin/sh
#
# rc.DMZ.firewall - DMZ IP Firewall script for Linux 2.4.x and iptables
#
# Copyright (C) 2001  Oskar Andreasson &lt;blueflux@koffein.net&gt;
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program or from the site that you downloaded it
# from; if not, write to the Free Software Foundation, Inc., 59 Temple
# Place, Suite 330, Boston, MA  02111-1307   USA
#

###########
# Configuration options, these will speed you up getting this script to
# work with your own setup.

#
# your LAN's IP range and localhost IP. /24 means to only use the first =
24=20
# bits of the 32 bit IP adress. the same as netmask 255.255.255.0
#
# STATIC_IP is used by me to allow myself to do anything to myself, =
might
# be a security risc but sometimes I want this. If you don't have a =
static
# IP, I suggest not using this option at all for now but it's stil
# enabled per default and will add some really nifty security bugs for =
all
# those who skips reading the documentation=3D)

LAN_IP=3D"XXX.XXX.XXX.XXX"
LAN_BCAST_ADRESS=3D"XXX.XXX.XXX.XXX"
LAN_IFACE=3D"eth0"

INET_IP=3D"XXX.XXX.XXX.XXX"
INET_IFACE=3D"eth2"

# HTTP_IP=3D""
# DNS_IP=3D""
# DMZ_HTTP_IP=3D""
# DMZ_DNS_IP=3D""
DMZ_IP=3D"XXX.XXX.XXX.XXX"
DMZ_IFACE=3D"eth1"

LO_IP=3D"127.0.0.1"
LO_IFACE=3D"lo"


IPTABLES=3D"/sbin/iptables"

###########################################
#
# Load all required IPTables modules
#

#
# Needed to initially load modules
#

/sbin/depmod -a

#
# Adds some iptables targets like LOG, REJECT and MASQUARADE.
#

/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_MASQUERADE

#
# Support for connection tracking of FTP and IRC.
#
#/sbin/modprobe ip_conntrack_ftp
#/sbin/modprobe ip_conntrack_irc


#CRITICAL:  Enable IP forwarding since it is disabled by default.
#

echo "1" > /proc/sys/net/ipv4/ip_forward

#
# Dynamic IP users:
#
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr

###########################################
#
# Chain Policies gets set up before any bad packets gets through
#

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

#
# the allowed chain for TCP connections, utilized in the FORWARD chain
#

$IPTABLES -N allowed
$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j =
ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

#
# ICMP rules, utilized in the FORWARD chain
#


$IPTABLES -N icmp_packets

# Changed rules totally
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

#
# bad_tcp_packets chain
#
# Take care of bad TCP packets that we don't want.
#

$IPTABLES -N bad_tcp_packets
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG =
\
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j =
DROP

#
# Do some checks for obviously spoofed IP's
#

$IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 192.168.0.0/16 -j DROP
$IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 10.0.0.0/8 -j DROP
$IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 172.16.0.0/12 -j DROP

###########################################
# POSTROUTING chain in the nat table
#
# Enable IP SNAT for all internal networks trying to get out on the =
Internet
#

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source =
$INET_IP



###########################################
# PREROUTING chain in the nat table
#
# Enable IP Destination NAT for DMZ zone
#

# $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_IP =
--dport 80 \
# -j DNAT --to-destination $DMZ_HTTP_IP
# $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_IP =
--dport 53 \
# -j DNAT --to-destination $DMZ_DNS_IP
# $IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_IP =
--dport 53 \
# -j DNAT --to-destination $DMZ_DNS_IP

###########################################
#
# FORWARD chain
#
#
# Bad TCP packets we don't want
#

$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets


#
# DMZ section
#
# General rules
#

$IPTABLES -A FORWARD -i $DMZ_IFACE -o $INET_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -o $DMZ_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN_IFACE -j ACCEPT

#
# HTTP server
#

# $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d =
$DMZ_HTTP_IP \
# --dport 80 -j allowed
# $IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d =
$DMZ_HTTP_IP \
# -j icmp_packets

#
# DNS server
#

# $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d =
$DMZ_DNS_IP \
# --dport 53 -j allowed
# $IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d =
$DMZ_DNS_IP \
# --dport 53 -j ACCEPT
# $IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d =
$DMZ_DNS_IP \
# -j icmp_packets

#
# LAN section
#

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT=20

#
# LOG all packets reaching here
#

$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "


###########################################################
#
# Firewall rules
# Rules applying to the firewall box
#
#
# INPUT chain
#
# Bad TCP packets we don't want
#

$IPTABLES -A INPUT -p tcp -j bad_tcp_packets

#
# Packets from the Internet to this box
#

$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets

#
# Packets from LAN, DMZ or LOCALHOST
#

# From DMZ Interface to DMZ firewall IP
$IPTABLES -A INPUT -p ALL -i $DMZ_IFACE -d $DMZ_IP -j ACCEPT

# From LAN Interface to LAN firewall IP
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_BCAST_ADRESS -j ACCEPT

# From Localhost interface to Localhost IP
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT

# All established and related packets incoming from the internet to the =

# firewall
$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state =
ESTABLISHED,RELATED \
-j ACCEPT

# Logging rule
$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 \
-j LOG --log-level DEBUG --log-prefix "IPT INPUT packet died: "

###########################################################
#
# OUTPUT chain
#
#
# Bad TCP packets we don't want
#

$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

#
# Allow ourself to send packets not spoofed everywhere
#

$IPTABLES -A OUTPUT -p ALL -o $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -o $LAN_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -o $INET_IFACE -s $INET_IP -j ACCEPT

#
# Logging rule=20
#

$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "

------_=_NextPart_000_01C289A7.6135E160--

