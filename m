From: "Luca Scattin" <luca@atlantenet.com>
Subject: Bridge-firewall
Date: Wed, 3 Dec 2003 13:55:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009901c3b99c$b18b9ee0$1e00a8c0@MERCURIO>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0096_01C3B9A5.1312D6D0"
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

------=_NextPart_000_0096_01C3B9A5.1312D6D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello all.
I have a little problem to build a solution for a customer (an hotel).
I try to explai the situation with an ascii art
--------------
|      PC        |
|    Clent       |
-------------
        |  ip    =20
        |
--------------
|  Firewall     |
|   Bridge      |
-------------
        |
        |
        |192.168.0.254 (example)
--------------
|  router        |
|                   |
-------------
        | Public IP              =20
Internet

Client pc have your IP address and default gateway that it's impossible =
to change.
Bridge/Firewall have to accept all pachets with all ip adress (no =
problem... it' a bridge) and have to change the ip address of all =
packets in order to send correctly to the router.
I build the bridge correctly (I Think) with:
brctl addbr br0
brctl stp br0 off
brctl addif br0 eth0
brctl addif br0 eth1
ifconfig eth0 0.0.0.0 up
ifconfig eth1 0.0.0.0 up
ifconfig bro 0.0.0.0 up
route add default gw 192.158.0.254
echo "1" > /proc/sys/net/ipv4/ip_forward

After that bridge is working.
I try to dump pachets in eth0 and eth1 and packest cross the bridge.

Noy I try to modify cleint packet address using SNAT
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 192.168.0.21 =
(example).
but in the second interface i view allvays the original client =
packets....=20
I mistake something but I don't know what.
I need help.
Thanks

=20
Luca Scattin


------=_NextPart_000_0096_01C3B9A5.1312D6D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hello all.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have a little problem to build a =
solution for a=20
customer (an hotel).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I try to explai the situation with an =
ascii=20
art</FONT></DIV>
<DIV>--------------<BR>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
PC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>|&nbsp;&nbsp;&nbsp;=20
Clent&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>-------------<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =

ip&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
|<BR>--------------<BR>|&nbsp; Firewall&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>|&nbsp;&nbsp; Bridge&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>-------------<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |192.168.0.254=20
(example)<BR>--------------<BR>|&nbsp;=20
router&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|<BR>-------------<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;Public=20
IP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
<BR>Internet</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Client pc have your IP address and =
default gateway=20
that it's impossible to change.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Bridge/Firewall have to accept all =
pachets with all=20
ip adress (no problem... it' a bridge) and have to change the ip address =
of all=20
packets in order to send correctly to the router.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I build the bridge correctly (I Think)=20
with:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>brctl addbr br0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>brctl stp br0 off</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>brctl addif br0 eth0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>brctl addif br0 eth1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ifconfig eth0 0.0.0.0 up</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ifconfig eth1 0.0.0.0 up</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ifconfig bro 0.0.0.0 up</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>route add default gw =
192.158.0.254</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>echo "1" &gt;=20
/proc/sys/net/ipv4/ip_forward</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>After that bridge is =
working.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I try to dump pachets in eth0 and eth1 =
and packest=20
cross the bridge.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Noy I try to modify cleint packet =
address using=20
SNAT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -o eth1 =
-j SNAT --to=20
192.168.0.21 (example).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>but in the second interface i view =
allvays the=20
original client packets.... </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I mistake something but I don't know=20
what.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I need help.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT><BR>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Luca=20
Scattin<BR><BR></FONT></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0096_01C3B9A5.1312D6D0--



