From: "Tom" <gunsuper@atm.cyberec.com>
Subject: Problem for Bittorrent Application behind Linux Firewall
Date: Tue, 23 Sep 2003 17:16:41 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <049201c381b3$672939f0$5a01a8c0@wireless.cheung.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_048F_01C381F6.74CDAD00"
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

------=_NextPart_000_048F_01C381F6.74CDAD00
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

Hello Everyone:

I have encountered a problem when implementing my Linux Firewall using =
iptables together with some applications like Bittorrent.It's peer to =
peer application sharing program.My Linux have two network interfaces, =
one is connecting to my internal LAN with IP range 192.168.1.0/24 and =
other network interface is connecting to internet via ADSL modem using =
PPPoE.

Before I illustrated my situation to you, I have tried to use "BT =
client" called Bittorrent S-5.7.3(Shadow's Experimental) to download =
file from the others. It has no problem for download but the light turns =
"YELLOW" to indicate that I'm behind firewall.Then I add some rules to =
my iptables to allow traffic can pass via in my machines in LAN from =
outside.

The following is my iptables rules.According to my understanding, BT use =
the ports 6881 to 6889,Then I forward these ports to my machines in LAN.

#! /bin/sh
iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 6881:6889 -j DNAT =
--to 192.168.1.90:6881-6889
iptables -A FORWARD -p tcp -s 192.168.1.90 --dport 6881:6889 -j ACCEPT

After I have implemented these rules, my light for BT client turns to =
"GREEN" mean that it's operational.Then I try to make some BT file for =
someone to download behind firewall, but problem occurs. The light is =
always "RED" - there are no connections from other clients.

So I would like to know that what happens to my linux firewall and how =
can I do to achieve my goal that creating BT files behind firewall for =
others to download ?

The above chain rules already prove that outside traffic can come in to =
my client machine.

I appreciate if anyone can help me to solve these problems...many thx !!

Tom Cheung
23 Sept 2003
------=_NextPart_000_048F_01C381F6.74CDAD00
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dbig5">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3D"Courier New" size=3D2>Hello Everyone:</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>I have encountered a problem =
when=20
implementing my Linux Firewall using iptables together with some =
applications=20
like Bittorrent.It's peer to peer application sharing program.My Linux =
have two=20
network interfaces, one is connecting to my internal LAN with IP range=20
192.168.1.0/24 and other network interface is connecting to internet via =
ADSL=20
modem using PPPoE.</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2><FONT face=3D!Ps2OcuAe>Before I =
illustrated=20
my situation to you, I have tried to use "BT client" called Bittorrent=20
S-5.7.3(Shadow's Experimental) to download file from the =
others.</FONT>&nbsp;It=20
has no problem for download but the light turns "YELLOW" to indicate =
that I'm=20
behind firewall.Then I add some rules to my iptables to allow traffic =
can pass=20
via in my machines in LAN from outside.</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>The following is my=20
iptables&nbsp;rules.According to my understanding, BT use the ports 6881 =
to=20
6889,Then I forward these ports to my machines in LAN.</FONT></DIV>
<DIV><FONT face=3D!Ps2OcuAe size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D!Ps2OcuAe size=3D2>#! /bin/sh</FONT></DIV>
<DIV><FONT face=3D!Ps2OcuAe size=3D2>iptables -t nat -A PREROUTING -i =
ppp0 -p tcp=20
--dport 6881:6889 -j DNAT --to 192.168.1.90:6881-6889</FONT></DIV>
<DIV><FONT face=3D!Ps2OcuAe size=3D2>iptables -A FORWARD -p tcp -s =
192.168.1.90=20
--dport 6881:6889 -j ACCEPT</FONT></DIV>
<DIV><FONT face=3D!Ps2OcuAe size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>After I have implemented these =
rules, my=20
light for BT client turns to "GREEN" mean that it's operational.Then I =
try to=20
make some BT file for someone to download behind firewall, but problem =
occurs.=20
The light is always "RED" - there are no connections from other=20
clients.</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>So I would like to know that =
what happens=20
to my linux firewall and how can I do to achieve my goal that creating =
BT files=20
behind firewall for others to download ?</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>The above chain rules already =
prove that=20
outside traffic can come in to my client machine.</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>I appreciate if anyone can help =
me to solve=20
these problems...many thx !!</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>Tom Cheung</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>23 Sept =
2003</FONT></DIV></BODY></HTML>

------=_NextPart_000_048F_01C381F6.74CDAD00--


