From: "kayegee" <tontense4u@hotmail.com>
Subject: VPN behind Linux Firewall
Date: Mon, 24 Jun 2002 12:48:34 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <00ff01c21b9e$fafe0790$0327a8c0@kayegee>
Reply-To: "kayegee" <tontense4u@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00FC_01C21B7D.73985420"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_00FC_01C21B7D.73985420
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have a LINUX firewall protecting my local LAN. I have 2 computers that =
use the Nortel VPN client to connect to my office. I can make the VPN =
connection, but I can't seem to stay connected for more than 10 to 15 =
min. Suddenly the system stops responding. If you look at the VPN icon, =
only the top half of the icon blinks. When things are working properly, =
both the top and bottom half of the VPN icon flash. While this is =
happening, other computers connected to the Internet continue to work =
without a problem. I was looking in /proc/net/ip_conntrack file and =
notice that I seem to lose my connection every time I get an entry like =
the following in that file:

unknown  50 523 src=3D192.168.XX.X dst=3D192.128.166.44 =
src=3D192.128.166.44 dst=3DXX.XXX.XXX.XX use=3D1=20

I'm not sure why I'm getting an unknown packet. I'm also not sure how =
iptables should handle an unknown packet. If anyone can shed some light =
on this subject, I'd greatly appreciate it.=20


192.168.XX.X  =3D  Local LAN address
XX.XXX.XXX.XX =3D My IP address

LINUX OS:        Redhat Kernel 2.4.18-3
iptables:            1.2.5
VPN Client:        Nortel 2.62.33



IPTables Setup File:

#!/bin/sh

#Path of the iptables program
IPTABLES=3D"/sbin/iptables"

#Private LAN address
IN_LAN=3D"192.168.XX.X/24"

# Private LAN Interface
IN_LAN_INTERFACE=3D"eth0"

# Private LAN Interace Address
IN_LAN_INTERFACE_ADDR=3D"192.168.XX.X"
=20
# External LAN Interface
EXT_LAN_INTERFACE=3D"eth1"

# External LAN Interface address
EXT_LAN_INTERFACE_ADDR=3D"XX.XXX.XXX.XX"

# Flush all the current packet filtering rules
$IPTABLES -F

#Set Default policy to deny everything
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP

# Allow packets from the interal LAN to the firewall
$IPTABLES -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT
$IPTABLES -A INPUT -i $IN_LAN_INTERFACE -j ACCEPT

# Allow packets coming to the external interface only if already =
established or related to a current session
$IPTABLES -A INPUT -i $EXT_LAN_INTERFACE -m state --state =
ESTABLISHED,RELATED -j ACCEPT


# Allow packets generated from the firewall.
$IPTABLES -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT
$IPTABLES -A OUTPUT -j ACCEPT

# Allow packets coming from the internal LAN to the external interface
$IPTABLES -A FORWARD -s $IN_LAN -j ACCEPT

# Allow packetes coming to the external interface only if already =
established or related to a current session=20
$IPTABLES -A FORWARD -j LOG
$IPTABLES -A FORWARD -i $EXT_LAN_INTERFACE -o $IN_LAN_INTERFACE -m state =
--state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $IN_LAN_INTERFACE -o $EXT_LAN_INTERFACE -j =
ACCEPT

# Set up Network Translation
$IPTABLES -t nat -A POSTROUTING -o $EXT_LAN_INTERFACE -j SNAT --to =
$EXT_LAN_INTERFACE_ADDR=20


------=_NextPart_000_00FC_01C21B7D.73985420
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I have a LINUX firewall protecting my =
local LAN. I=20
have 2 computers that use the Nortel VPN client to connect to my office. =
I can=20
make the VPN connection, but I can't seem to stay connected for more =
than 10 to=20
15 min. Suddenly the system stops responding. If you look at the VPN =
icon, only=20
the top half of the icon blinks. When things are working properly, both =
the top=20
and bottom half of the VPN icon flash. While this is happening, other =
computers=20
connected to the Internet continue to work without a problem. I was =
looking in=20
/proc/net/ip_conntrack file and notice that I seem to lose my connection =
every=20
time I get an entry like the following in that file:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>unknown&nbsp; 50 523 src=3D192.168.XX.X =

dst=3D192.128.166.44 src=3D192.128.166.44 dst=3DXX.XXX.XXX.XX use=3D1 =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm not sure why I'm getting an unknown =
packet. I'm=20
also not sure how iptables should handle an unknown packet. If anyone =
can shed=20
some light on this subject, I'd greatly appreciate it. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>192.168.XX.X&nbsp;&nbsp;=3D&nbsp; Local =
LAN=20
address</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>XX.XXX.XXX.XX =3D My IP =
address</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>LINUX OS:&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
Redhat Kernel 2.4.18-3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables:&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; 1.2.5</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>VPN Client:&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
Nortel 2.62.33</DIV>
<DIV><BR>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>IPTables Setup File:</DIV>
<DIV>&nbsp;</DIV>
<DIV>#!/bin/sh</DIV>
<DIV>&nbsp;</DIV>
<DIV>#Path of the iptables program<BR>IPTABLES=3D"/sbin/iptables"</DIV>
<DIV>&nbsp;</DIV>
<DIV>#Private LAN address<BR>IN_LAN=3D"192.168.XX.X/24"</DIV>
<DIV>&nbsp;</DIV>
<DIV># Private LAN Interface<BR>IN_LAN_INTERFACE=3D"eth0"</DIV>
<DIV>&nbsp;</DIV>
<DIV># Private LAN Interace=20
Address<BR>IN_LAN_INTERFACE_ADDR=3D"192.168.XX.X"<BR>&nbsp;<BR># =
External LAN=20
Interface<BR>EXT_LAN_INTERFACE=3D"eth1"</DIV>
<DIV>&nbsp;</DIV>
<DIV># External LAN Interface=20
address<BR>EXT_LAN_INTERFACE_ADDR=3D"XX.XXX.XXX.XX"</DIV>
<DIV>&nbsp;</DIV>
<DIV># Flush all the current packet filtering rules<BR>$IPTABLES =
-F</DIV>
<DIV>&nbsp;</DIV>
<DIV>#Set Default policy to deny everything<BR>$IPTABLES -P INPUT=20
DROP<BR>$IPTABLES -P OUTPUT ACCEPT<BR>$IPTABLES -P FORWARD DROP</DIV>
<DIV>&nbsp;</DIV>
<DIV># Allow packets from the interal LAN to the firewall<BR>$IPTABLES =
-A INPUT=20
-p udp -m state --state ESTABLISHED -j ACCEPT<BR>$IPTABLES -A INPUT -i=20
$IN_LAN_INTERFACE -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># Allow packets coming to the external interface only if already=20
established or related to a current session<BR>$IPTABLES -A INPUT -i=20
$EXT_LAN_INTERFACE -m state --state ESTABLISHED,RELATED -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV># Allow packets generated from the firewall.<BR>$IPTABLES -A OUTPUT =
-p udp=20
-m state --state NEW,ESTABLISHED -j ACCEPT<BR>$IPTABLES -A OUTPUT -j=20
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># Allow packets coming from the internal LAN to the external=20
interface<BR>$IPTABLES -A FORWARD -s $IN_LAN -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># Allow packetes coming to the external interface only if already=20
established or related to a current session <BR>$IPTABLES -A FORWARD -j=20
LOG<BR>$IPTABLES -A FORWARD -i $EXT_LAN_INTERFACE -o $IN_LAN_INTERFACE =
-m state=20
--state ESTABLISHED,RELATED -j ACCEPT<BR>$IPTABLES -A FORWARD -i=20
$IN_LAN_INTERFACE -o $EXT_LAN_INTERFACE -j ACCEPT<BR></DIV>
<DIV># Set up Network Translation<BR>$IPTABLES -t nat -A POSTROUTING -o=20
$EXT_LAN_INTERFACE -j SNAT --to $EXT_LAN_INTERFACE_ADDR=20
<BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_00FC_01C21B7D.73985420--



