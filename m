From: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Subject: VPN Issue - help
Date: Tue, 6 May 2003 06:42:38 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006c01c31357$a1565ce0$6400a8c0@homes>
Reply-To: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0069_01C3139A.AF54FDE0"
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

------=_NextPart_000_0069_01C3139A.AF54FDE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

repost:

Clients can connect to the VPN server w/o any problem. Private network =
is 192.168.0.0/24. VPN server IP is=20

Public (ppp0) =3D 203.x.x.x
Private (eth0) =3D 192.168.0.10

When client is connected to the VPN server, it can ping the VPN but not =
the other machines in the network. Client IP when connected is =
192.168.0.80/255.255.255.255. clients can surf the net after they are =
connected but cannot see other machines inside the network.

###########################
other config:
net.ipv4.ip_forward =3D 1
net.ipv4.conf.eth0.proxy_arp =3D 1

###########################
client is connected to the VPN. here's the result of ifconfig:=20

ppp1      Link encap:Point-to-Point Protocol
          inet addr:192.168.0.10  P-t-P:192.168.0.80  =
Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1400  Metric:1
          RX packets:18 errors:0 dropped:0 overruns:0 frame:0
          TX packets:10 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:1062 (1.0 Kb)  TX bytes:147 (147.0 b)
###########################
route -n

192.168.0.180   0.0.0.0         255.255.255.255 UH    0      0        0 =
ppp1
###########################


What could be the problem? What iptables rule should i do.

TIA
/Voltaire
------=_NextPart_000_0069_01C3139A.AF54FDE0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#fffbf0>
<DIV><FONT face=3DArial size=3D2>repost:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Clients can connect to the VPN server =
w/o any=20
problem. Private network is 192.168.0.0/24. VPN server IP is =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Public&nbsp;(ppp0)&nbsp;=3D =
203.x.x.x</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Private (eth0) =3D </FONT><FONT =
face=3DArial=20
size=3D2>192.168.0.10</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When client is connected to the VPN =
server, it can=20
ping the VPN but not the other machines in the network. Client IP when =
connected=20
is 192.168.0.80/255.255.255.255. clients can surf the net after they are =

connected but cannot see other machines inside the network.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>###########################</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>other config:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>net.ipv4.ip_forward =3D 1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>net.ipv4.conf.eth0.proxy_arp =3D =
1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>###########################</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>client is connected to the VPN. here's =
the result=20
of ifconfig: </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ppp1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Link =

encap:Point-to-Point=20
Protocol<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inet=20
addr:192.168.0.10&nbsp; P-t-P:192.168.0.80&nbsp;=20
Mask:255.255.255.255<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
UP POINTOPOINT RUNNING NOARP MULTICAST&nbsp; MTU:1400&nbsp;=20
Metric:1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX =
packets:18=20
errors:0 dropped:0 overruns:0=20
frame:0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TX =
packets:10=20
errors:0 dropped:0 overruns:0=20
carrier:0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
collisions:0=20
txqueuelen:3<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
RX=20
bytes:1062 (1.0 Kb)&nbsp; TX bytes:147 (147.0=20
b)<BR>###########################</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>route -n</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>192.168.0.180&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.255.255.255=20
UH&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 ppp1</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>###########################</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>What could be the problem? What =
iptables rule=20
should i do.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>TIA</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/Voltaire</FONT></DIV></BODY></HTML>

------=_NextPart_000_0069_01C3139A.AF54FDE0--


