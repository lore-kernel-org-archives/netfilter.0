From: "Brei, Matt" <mbrei@medclaiminc.com>
Subject: Port forwarding
Date: Thu, 24 Apr 2003 01:20:25 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <091A6DF13847F44395B31658ED61C19C627C1D@yellowstone.medclaim.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C30A21.35FB6154"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

------_=_NextPart_001_01C30A21.35FB6154
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all. =20
=20
I'm using iptables on RH 8.0 to route and firewall my cable connection
to the rest of the lan.  My problem is joining games (Ghost Recon) on
ubi.com from behind the firewall.  Ubi.com requires port 80 for http
which works fine, port 6667 for chat which also works fine, and
40000-42000 for the game (I'm assuming) which seems to be random when I
run nmap on machines running the game with no firewall.  Is there a way
to allow one or multiple machines behind the firewall to join/host a
game by forwarding the ports.  I attached my iptables script that I'm
currently using.
=20
Thanks,
Matt
=20
=20
#!/bin/sh
#
# rc.firewall - Initial SIMPLE IP Firewall script for Linux 2.4.x and
iptables
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
=20
########################################################################
###
#
# 1. Configuration options.
#
=20
########################################################################
###
#
# Local Area Network configuration.
#
# your LAN's IP range and localhost IP. /24 means to only use the first
24=20
# bits of the 32 bit IP adress. the same as netmask 255.255.255.0
#
=20
LAN_IP=3D"192.168.0.254"
LAN_IP_RANGE=3D"192.168.0.0/16"
LAN_BCAST_ADRESS=3D"192.168.255.255"
LAN_IFACE=3D"eth1"
=20
########################################################################
###
#
w
# Localhost Configuration.
#
=20
LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"
=20
########################################################################
###
#
# Internet Configuration.
#
=20
INET_IP=3D"12.251.163.214"
INET_IFACE=3D"eth0"
=20
########################################################################
###
#
# IPTables Configuration.
#
=20
IPTABLES=3D"/sbin/iptables"
=20
########################################################################
###
#
# 2. Module loading.
#
=20
#
# Needed to initially load modules
#
/sbin/depmod -a
=20
#
# Adds some iptables targets like LOG, REJECT and MASQUARADE.
#
/sbin/modprobe ip_conntrack
/sbin/modprobe ip_tables
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
#/sbin/modprobe ipt_REJECT
#/sbin/modprobe ipt_MASQUERADE
=20
#
# Support for owner matching
#
#/sbin/modprobe ipt_owner
=20
#
# Support for connection tracking of FTP and IRC.
#
#/sbin/modprobe ip_conntrack_ftp
#/sbin/modprobe ip_conntrack_irc
=20
=20
########################################################################
###
#
# 3. /proc set up.
#
# Enable ip_forward if you have two or more networks, including the
# Internet, that needs forwarding of packets through this box. This is
# critical since it is turned off as default in Linux.
#
=20
echo "1" > /proc/sys/net/ipv4/ip_forward
=20
#
# Dynamic IP users:
#
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr
=20
########################################################################
###
#
# 4. IPTables rules set up.
#
# Set default policies for the INPUT, FORWARD and OUTPUT chains.
# Drop ALL packets
=20
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP
=20
#
# bad_tcp_packets chain
#
# Take care of bad TCP packets that we don't want.
#
=20
$IPTABLES -N bad_tcp_packets
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG
\
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP
=20
#
# Do some checks for obviously spoofed IP's
#
=20
$IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 192.168.0.0/16 -j DROP
$IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 10.0.0.0/8 -j DROP
$IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 172.16.0.0/12 -j DROP
=20
#
# Enable simple IP Forwarding and Network Address Translation
#
=20
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source
$INET_IP
=20
#
# Bad TCP packets we don't want
#
=20
$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets
=20
#
# Accept the packets we actually want to forward
#
=20
$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "
=20
#
# Create separate chains for ICMP, TCP and UDP to traverse
#
=20
$IPTABLES -N icmp_packets
$IPTABLES -N tcp_packets
$IPTABLES -N udpincoming_packets
=20
#
# The allowed chain for TCP connections
#
=20
$IPTABLES -N allowed
$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPTABLES -A allowed -p TCP -j DROP
=20
#
# ICMP rules
#
=20
# Changed rules totally
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT
=20
#
# TCP rules
#
=20
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 25 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 110 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 1723 -j allowed
=20
#
# UDP ports
#
=20
# nondocumented commenting out of these rules
#$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 53 -j
ACCEPT
#$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 123 -j
ACCEPT
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 2074 -j
ACCEPT
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 4000 -j
ACCEPT
=20
##########################
# INPUT chain
#
# Bad TCP packets we don't want.
#
=20
$IPTABLES -A INPUT -p tcp -j bad_tcp_packets
=20
#
# Rules for incoming packets from the internet.
#
=20
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udpincoming_packets
=20
#
# VPN for incoming connections to 192.168.0.1
#
=20
$IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 -j DNAT --to
192.168.0.1
$IPTABLES -t nat -A PREROUTING -i eth0 -p 47 -j DNAT --to 192.168.0.1
$IPTABLES -A FORWARD -p tcp -d 192.168.0.1/16 --dport 1723 -j ACCEPT
$IPTABLES -A FORWARD -p 47 -d 192.168.0.1/16 -j ACCEPT
=20
#
#E-Mail routes to 192.168.0.1=20
#
=20
$IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j DNAT --to
192.168.0.1
$IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 110 -j DNAT --to
192.168.0.1
$IPTABLES -A FORWARD -p tcp -d 192.168.0.1 --dport 25 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -s 192.168.0.1 --dport 25 -j ACCEPT
=20
# Rules for special networks not part of the Internet
#
=20
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_BCAST_ADRESS -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state
ESTABLISHED,RELATED \
-j ACCEPT
$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT INPUT packet died: "
=20
###############################
# OUTPUT chain
#
#
# Bad TCP packets we don't want.
#
=20
$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets
=20
#
# Special OUTPUT rules to decide which IP's to allow.
#
=20
$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
=20
#
# Log weird packets that don't match the above.
#
=20
$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "
=20
=20
=20

------_=_NextPart_001_01C30A21.35FB6154
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C309FF.CD734560">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"country-region"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PostalCode"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"State"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"Street"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"address"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;
	text-underline:single;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello all.<span style=3D'mso-spacerun:yes'>&nbsp; =
</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;m using <span class=3DSpellE>iptables</span> =
on RH 8.0
to route and firewall my cable connection to the rest of the <span
class=3DSpellE><span class=3DGramE>lan</span></span>.<span
style=3D'mso-spacerun:yes'>&nbsp; </span>My problem is joining games =
(Ghost
Recon) on ubi.com from behind the firewall.<span
style=3D'mso-spacerun:yes'>&nbsp; </span>Ubi.com requires port 80 for =
http which
works fine, port 6667 for chat which also works fine, and 40000-42000 =
for the
game (I&#8217;m assuming) which seems to be random when I run <span
class=3DSpellE>nmap</span> on machines running the game with no =
firewall.<span
style=3D'mso-spacerun:yes'>&nbsp; </span>Is there a way to allow one or =
multiple
machines behind the firewall to join/host a game by forwarding the <span
class=3DGramE>ports.</span><span style=3D'mso-spacerun:yes'>&nbsp; =
</span>I
attached my <span class=3DSpellE>iptables</span> script that I&#8217;m =
currently
using.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Matt<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>#!/</span></font></span><font size=3D2
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>bin/<span
class=3DSpellE>sh</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DSpellE>rc.firewall</span> - Initial SIMPLE IP Firewall =
script for
Linux 2.4.x and <span =
class=3DSpellE>iptables</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Copyright (C) <span class=3DGramE>2001<span =
style=3D'mso-spacerun:yes'>&nbsp;
</span><span class=3DSpellE>Oskar</span></span> <span =
class=3DSpellE>Andreasson</span>
&amp;<span =
class=3DSpellE>lt;blueflux@koffein.net&amp;gt</span>;<o:p></o:p></span></=
font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>This</span> program is free software; you can =
redistribute it
and/or modify<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>it</span> under the terms of the GNU General Public =
License
as published by<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>the</span> Free Software Foundation; version 2 of =
the
License.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>This</span> program is distributed in the hope that =
it will
be useful,<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>but</span> WITHOUT ANY WARRANTY; without even the =
implied warranty
of<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.</span></font></span><font size=3D2 face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'><span
style=3D'mso-spacerun:yes'>&nbsp; </span>See =
the<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># GNU General Public License for more =
details.</span></font></span><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>You</span> should have received a copy of the GNU =
General
Public License<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>along</span> with this program or from the site that =
you
downloaded it<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>from</span>; if not, write to the Free Software =
Foundation,
Inc., 59 </span></font><st1:City><st1:place><font size=3D2 =
face=3D"Courier New"><span
  style=3D'font-size:10.0pt;font-family:"Courier =
New"'>Temple</span></font></st1:place></st1:City><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Place, </span></font><st1:address><st1:Street><font size=3D2 =
face=3D"Courier New"><span
  style=3D'font-size:10.0pt;font-family:"Courier =
New"'>Suite</span></font></st1:Street><font
 size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>
 330</span></font></st1:address><font size=3D2 face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>, =
</span></font><st1:place><st1:City><font
  size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>Boston</span></font></st1:City><font
 size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>,
 </span></font><st1:State><font size=3D2 face=3D"Courier New"><span
  style=3D'font-size:10.0pt;font-family:"Courier =
New"'>MA</span></font></st1:State><font
 size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'><span
 style=3D'mso-spacerun:yes'>&nbsp; =
</span></span></font><st1:PostalCode><font
  size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>02111-1307</span></font></st1:PostalCode><font
 size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'><span
 style=3D'mso-spacerun:yes'>&nbsp;&nbsp; =
</span></span></font><st1:country-region><font
  size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>USA</span></font></st1:country-region></st1:place><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>###################################################################=
########<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># 1.</span></font></span><font size=3D2
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'> <span
class=3DGramE>Configuration options.</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>###################################################################=
########<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># Local Area Network =
configuration.</span></font></span><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>your</span> LAN's IP range and <span =
class=3DSpellE>localhost</span>
IP. /24 means to only use the first 24 <o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
bits of the 32 bit IP <span class=3DSpellE>adress</span>. <span =
class=3DGramE>the</span>
same as <span class=3DSpellE>netmask</span> =
255.255.255.0<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>LAN_IP=3D&quot;192.168.0.254&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>LAN_IP_RANGE=3D&quot;192.168.0.0/16&quot;<o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>LAN_BCAST_ADRESS=3D&quot;192.168.255.255&quot;<o:p></o:p></span></f=
ont></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>LAN_IFACE=3D&quot;eth1&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>###################################################################=
########<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>w</span></font></span><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># <span class=3DSpellE>Localhost</span> =
Configuration.</span></font></span><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>LO_IFACE=3D&quot;lo&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>LO_IP=3D&quot;127.0.0.1&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>###################################################################=
########<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># Internet =
Configuration.</span></font></span><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>INET_IP=3D&quot;12.251.163.214&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>INET_IFACE=3D&quot;eth0&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>###################################################################=
########<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># <span class=3DSpellE>IPTables</span> =
Configuration.</span></font></span><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>IPTABLES=3D&quot;/<span
class=3DSpellE>sbin/iptables</span>&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>###################################################################=
########<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># 2.</span></font></span><font size=3D2
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'> <span
class=3DGramE>Module loading.</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>Needed</span> to initially load =
modules<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>/<span
class=3DSpellE>sbin/depmod</span> -a<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>Adds</span> some <span =
class=3DSpellE>iptables</span> targets
like LOG, REJECT and MASQUARADE.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>ip_conntrack</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>ip_tables</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>iptable_filter</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>iptable_mangle</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>iptable_nat</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>ipt_LOG</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>ipt_REJECT</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>ipt_MASQUERADE</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Support for owner matching<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>ipt_owner</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># Support for connection tracking of FTP and =
IRC.</span></font></span><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>ip_conntrack_ftp</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#/<span
class=3DSpellE>sbin/modprobe</span> <span =
class=3DSpellE>ip_conntrack_irc</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>###################################################################=
########<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># 3.</span></font></span><font size=3D2
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>
/proc set up.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Enable <span class=3DSpellE>ip_forward</span> if you have two or more =
networks,
including the<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>Internet, that</span> needs forwarding of packets =
through
this box. This is<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>critical</span> since it is turned off as default in =
Linux.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>echo</span></font></span><font size=3D2
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>
&quot;1&quot; &gt; =
/proc/sys/net/ipv4/ip_forward<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Dynamic IP users:<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#echo
&quot;1&quot; &gt; =
/proc/sys/net/ipv4/ip_dynaddr<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>###################################################################=
########<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><span
class=3DGramE><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'># 4.</span></font></span><font size=3D2
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'> <span
class=3DSpellE>IPTables</span> rules set =
up.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Set default policies for the INPUT, FORWARD and OUTPUT =
chains.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Drop ALL packets<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-P INPUT DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-P OUTPUT DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-P FORWARD DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DSpellE><span class=3DGramE>bad_tcp_packets</span></span> =
chain<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Take care of bad TCP packets that we don't =
want.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-N <span =
class=3DSpellE>bad_tcp_packets</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>bad_tcp_packets</span> -p <span =
class=3DSpellE><span
class=3DGramE>tcp</span></span><span class=3DGramE> !</span> --<span =
class=3DSpellE><span
class=3DGramE>syn</span></span> -m state --state NEW -j LOG =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>--log-prefix
&quot;New not <span =
class=3DSpellE>syn</span>:&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>bad_tcp_packets</span> -p <span =
class=3DSpellE><span
class=3DGramE>tcp</span></span><span class=3DGramE> !</span> --<span =
class=3DSpellE><span
class=3DGramE>syn</span></span> -m state --state NEW -j =
DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Do some checks for obviously spoofed IP's<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>bad_tcp_packets</span> -<span =
class=3DSpellE>i</span>
$INET_IFACE -s 192.168.0.0/16 -j DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>bad_tcp_packets</span> -<span =
class=3DSpellE>i</span>
$INET_IFACE -s 10.0.0.0/8 -j DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>bad_tcp_packets</span> -<span =
class=3DSpellE>i</span>
$INET_IFACE -s 172.16.0.0/12 -j DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Enable simple IP Forwarding and Network Address =
Translation<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-t <span class=3DSpellE>nat</span> -A POSTROUTING -o $INET_IFACE -j SNAT
--to-source $INET_IP<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Bad TCP packets we don't want<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A FORWARD -p <span class=3DSpellE>tcp</span> -j <span =
class=3DSpellE>bad_tcp_packets</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Accept the packets we actually want to =
forward<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A FORWARD -<span class=3DSpellE>i</span> $LAN_IFACE -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A FORWARD -m state --state ESTABLISHED<span =
class=3DGramE>,RELATED</span> -j
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>--log-level
DEBUG --log-prefix &quot;IPT FORWARD packet died<span class=3DGramE>: =
&quot;</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Create separate chains for ICMP, TCP and UDP to =
traverse<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-N <span class=3DSpellE>icmp_packets</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-N <span class=3DSpellE>tcp_packets</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-N <span =
class=3DSpellE>udpincoming_packets</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DGramE>The</span> allowed chain for TCP =
connections<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-N allowed<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-<span class=3DGramE>A</span> allowed -p TCP --<span =
class=3DSpellE>syn</span> -j
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A allowed -p TCP -m state --state ESTABLISHED<span =
class=3DGramE>,RELATED</span>
-j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A allowed -p TCP -j DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
ICMP rules<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Changed rules totally<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-<span class=3DGramE>A</span> <span class=3DSpellE>icmp_packets</span> =
-p ICMP -s
0/0 --<span class=3DSpellE>icmp</span>-type 8 -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-<span class=3DGramE>A</span> <span class=3DSpellE>icmp_packets</span> =
-p ICMP -s
0/0 --<span class=3DSpellE>icmp</span>-type 11 -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
TCP rules<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>tcp_packets</span> -p TCP -s 0/0 --<span =
class=3DSpellE>dport</span>
21 -j allowed<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>tcp_packets</span> -p TCP -s 0/0 --<span =
class=3DSpellE>dport</span>
22 -j allowed<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>tcp_packets</span> -p TCP -s 0/0 --<span =
class=3DSpellE>dport</span>
25 -j allowed<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>tcp_packets</span> -p TCP -s 0/0 --<span =
class=3DSpellE>dport</span>
80 -j allowed<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>tcp_packets</span> -p TCP -s 0/0 --<span =
class=3DSpellE>dport</span>
110 -j allowed<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>tcp_packets</span> -p TCP -s 0/0 --<span =
class=3DSpellE>dport</span>
113 -j allowed<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A <span class=3DSpellE>tcp_packets</span> -p TCP -s 0/0 --<span =
class=3DSpellE>dport</span>
1723 -j allowed<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
UDP ports<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
<span class=3DSpellE>nondocumented</span> commenting out of these =
rules<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#$IPTABLES
-A <span class=3DSpellE>udpincoming_packets</span> -p UDP -s 0/0 =
--source-port 53
-j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#$IPTABLES
-A <span class=3DSpellE>udpincoming_packets</span> -p UDP -s 0/0 =
--source-port
123 -j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-<span class=3DGramE>A</span> <span =
class=3DSpellE>udpincoming_packets</span> -p
UDP -s 0/0 --source-port 2074 -j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-<span class=3DGramE>A</span> <span =
class=3DSpellE>udpincoming_packets</span> -p
UDP -s 0/0 --source-port 4000 -j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>##########################<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
INPUT chain<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Bad TCP packets we don't want.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A INPUT -p <span class=3DSpellE>tcp</span> -j <span =
class=3DSpellE>bad_tcp_packets</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Rules for incoming packets from the =
internet.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A INPUT -p ICMP -<span class=3DSpellE>i</span> $INET_IFACE -j <span
class=3DSpellE>icmp_packets</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A INPUT -p TCP -<span class=3DSpellE>i</span> $INET_IFACE -j <span =
class=3DSpellE>tcp_packets</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A INPUT -p UDP -<span class=3DSpellE>i</span> $INET_IFACE -j <span =
class=3DSpellE>udpincoming_packets</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
VPN for incoming connections to 192.168.0.1<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-t <span class=3DSpellE>nat</span> -A PREROUTING -<span =
class=3DSpellE>i</span>
eth0 -p <span class=3DSpellE>tcp</span> --<span =
class=3DSpellE>dport</span> 1723 -j
DNAT --to 192.168.0.1<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-t <span class=3DSpellE>nat</span> -A PREROUTING -<span =
class=3DSpellE>i</span>
eth0 -p 47 -j DNAT --to 192.168.0.1<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A FORWARD -p <span class=3DSpellE>tcp</span> -d 192.168.0.1/16 --<span
class=3DSpellE>dport</span> 1723 -j <span =
class=3DGramE>ACCEPT</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A FORWARD -p 47 -d 192.168.0.1/16 -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#E-Mail
routes to 192.168.0.1 <o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-t <span class=3DSpellE>nat</span> -A PREROUTING -<span =
class=3DSpellE>i</span>
eth0 -p <span class=3DSpellE>tcp</span> --<span =
class=3DSpellE>dport</span> 25 -j
DNAT --to 192.168.0.1<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-t <span class=3DSpellE>nat</span> -A PREROUTING -<span =
class=3DSpellE>i</span>
eth0 -p <span class=3DSpellE>tcp</span> --<span =
class=3DSpellE>dport</span> 110 -j
DNAT --to 192.168.0.1<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A FORWARD -p <span class=3DSpellE>tcp</span> -d 192.168.0.1 --<span
class=3DSpellE>dport</span> 25 -j <span =
class=3DGramE>ACCEPT</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A FORWARD -p <span class=3DSpellE>tcp</span> -s 192.168.0.1 --<span
class=3DSpellE>dport</span> 25 -j <span =
class=3DGramE>ACCEPT</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Rules for special networks not part of the =
Internet<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A INPUT -p ALL -<span class=3DSpellE>i</span> $LAN_IFACE -d =
$LAN_BCAST_ADRESS -j
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A INPUT -p ALL -<span class=3DSpellE>i</span> $LO_IFACE -s $LO_IP -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A INPUT -p ALL -<span class=3DSpellE>i</span> $LO_IFACE -s $LAN_IP -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A INPUT -p ALL -<span class=3DSpellE>i</span> $LO_IFACE -s $INET_IP -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A INPUT -p ALL -<span class=3DSpellE>i</span> $LAN_IFACE -s =
$LAN_IP_RANGE -j
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED<span =
class=3DGramE>,RELATED</span>
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>-j
<span class=3DGramE>ACCEPT</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-<span class=3DGramE>A</span> INPUT -m limit --limit 3/minute =
--limit-burst 3 -j
LOG \<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>--log-level
DEBUG --log-prefix &quot;IPT INPUT packet died<span class=3DGramE>: =
&quot;</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>###############################<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
OUTPUT chain<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Bad TCP packets we don't want.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A OUTPUT -p <span class=3DSpellE>tcp</span> -j <span =
class=3DSpellE>bad_tcp_packets</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Special OUTPUT rules to decide which IP's to =
allow.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A OUTPUT -p ALL -s $LO_IP -j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A OUTPUT -p ALL -s $LAN_IP -j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-A OUTPUT -p ALL -s $INET_IP -j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>#
Log weird packets that don't match the =
above.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>#<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>$IPTABLES
-<span class=3DGramE>A</span> OUTPUT -m limit --limit 3/minute =
--limit-burst 3 -j
LOG \<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier New"'>--log-level
DEBUG --log-prefix &quot;IPT OUTPUT packet died<span class=3DGramE>: =
&quot;</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-layout-grid-align:none;text-autospace:none'><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C30A21.35FB6154--

