From: "Charan" <charanbeer.s@net4india.net>
Subject: Forward to a Cache Server
Date: Sat, 23 Aug 2003 19:53:51 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <093601c36982$2cd753c0$f58047ca@Charanbeer>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0933_01C369B0.46665CE0"
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

------=_NextPart_000_0933_01C369B0.46665CE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi List

I have a Linux box that allows LAN users with local IP addresses to =
access Internet using the following IPtables based shell script. I have =
basic understanding of IPtables and have done some reading on how to fwd =
all dport 80 traffic to a separate box that runs a caching server (Squid =
in my case). Can someone help me with changes in the existing setup:
--> to forward all the traffic to the squid port (say 8080) on a =
separate box or;
-->to a local  port (say 4000) running transproxy that simply forwards =
all the requests coming to local:4000 on to the squid box at port 8080.

#!/bin/sh

# Set up default policies
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# Flush all tables
iptables -F
iptables -t nat -F
iptables -t mangle -F

#NAT
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.0/24 -j SNAT =
--to-source 202.xx.xxx.xx

# Forward all traffic for Local Network
iptables -t filter -A FORWARD -s 192.168.1.0/24 -j ACCEPT
iptables -t filter -A FORWARD -d 192.168.1.0/24 -j ACCEPT

# Enable IP forwarding.
echo "1" > /proc/sys/net/ipv4/ip_forward

Also, please guide me to some good document on IPtables.

Thanks in advance
Charan

------=_NextPart_000_0933_01C369B0.46665CE0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2730.1700" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi List</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a Linux box that allows LAN =
users=20
with&nbsp;local IP addresses to access Internet using the following =
IPtables=20
based&nbsp;shell script. I have&nbsp;basic&nbsp;understanding of =
IPtables=20
and&nbsp;have done some&nbsp;reading on how to fwd all dport 80 traffic =
to a=20
separate box that runs a caching server (Squid in my case). Can someone =
help me=20
with changes in the existing setup:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--&gt; to forward all the traffic to =
the squid port=20
(say 8080) on a separate box or;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--&gt;to a local&nbsp; port (say 4000) =
running=20
transproxy that simply forwards all the requests coming =
to&nbsp;local:4000=20
on&nbsp;to the squid&nbsp;box&nbsp;at port 8080.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>#!/bin/sh</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># Set up default policies<BR>iptables =
-P INPUT=20
ACCEPT<BR>iptables -P OUTPUT ACCEPT<BR>iptables -P FORWARD =
DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># Flush all tables<BR>iptables =
-F<BR>iptables -t=20
nat -F<BR>iptables -t mangle -F</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>#NAT<BR>iptables -t nat -A POSTROUTING =
-o eth0 -s=20
192.168.1.0/24 -j SNAT --to-source 202.xx.xxx.xx</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># Forward all traffic for Local =
Network<BR>iptables=20
-t filter -A FORWARD -s 192.168.1.0/24 -j ACCEPT<BR>iptables -t filter =
-A=20
FORWARD -d 192.168.1.0/24 -j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># Enable IP forwarding.<BR>echo "1" =
&gt;=20
/proc/sys/net/ipv4/ip_forward</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Also, please guide me to some =
good&nbsp;document on=20
IPtables.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Charan</FONT></DIV></BODY></HTML>

------=_NextPart_000_0933_01C369B0.46665CE0--


