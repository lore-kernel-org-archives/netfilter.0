From: "Clayton Check" <clayton.check@cornettech.com>
Subject: static IP, different gateway & dns
Date: Wed, 23 Oct 2002 13:49:26 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006301c27a57$f29f8840$0f01a8c0@Inspiron2100>
Reply-To: "Clayton Check" <clayton.check@cornettech.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0060_01C27A9B.00595810"
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

------=_NextPart_000_0060_01C27A9B.00595810
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Can iptables NAT or handle nodes that have static IP address not on the =
same subnet as the iptable box, also with different gateway =
configuration and different DNS config?


Overview
A linux box with iptable acts as a gateway to connect several clients to =
the Internet. However, the clients behind this gateway have static IP =
addresses and different gateway and dns configuration. Lets assume that =
changing their network configurations are not possible.=20

Can iptables handle this sort of networking?


                             |--- 192.168.1.12 (gw: 192.168.1.1)
                             |
---- eth0 (iptables) eth1 ---|--- 192.168.10.25 (gw: 192.168.10.1)
                  10.0.0.1/8 |
                             |--- 202.145.23.25 (gw: 202.145.0.5)
                             |
                             |--- 10.0.0.16 (gw: 10.0.0.1)










------=_NextPart_000_0060_01C27A9B.00595810
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4919.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Can iptables NAT or handle nodes that =
have static=20
IP address not on the same subnet as the iptable box, also with =
different=20
gateway configuration and different DNS config?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Overview</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>A linux box with iptable&nbsp;acts as a =
gateway to=20
connect several clients to&nbsp;the&nbsp;Internet. However, =
t</FONT><FONT=20
face=3DArial size=3D2>he clients behind this gateway&nbsp;have static IP =
addresses=20
and different gateway and dns configuration. Lets assume that changing =
their=20
network configurations are not possible. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Can iptables handle this sort of=20
networking?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New"=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|--- 192.168.1.12 (gw: 192.168.1.1)</FONT></DIV>
<DIV><FONT face=3D"Courier New"=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2>---- eth0&nbsp;(iptables) eth1 =
---|---=20
192.168.10.25 (gw: 192.168.10.1)</FONT></DIV>
<DIV><FONT face=3D"Courier New"=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
10.0.0.1/8&nbsp;|</FONT></DIV>
<DIV><FONT face=3D"Courier New"=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
|--- 202.145.23.25 (gw: 202.145.0.5)</FONT></DIV>
<DIV><FONT face=3D"Courier New"=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</FONT></DIV>
<DIV><FONT face=3D"Courier New"=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---=20
10.0.0.16 (gw: 10.0.0.1)</FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0060_01C27A9B.00595810--


