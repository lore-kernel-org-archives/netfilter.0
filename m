From: "Carlos Fernandez Sanz" <cfs-netfilter@nisupu.com>
Subject: Routing problem
Date: Fri, 13 Feb 2004 16:39:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002c01c3f247$9d3ee350$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0029_01C3F24F.FE742AB0"
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
To: netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0029_01C3F24F.FE742AB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have a small problem setting up a routing exception here.

We have a small LAN with NAT-based internet access. Nothing special =
here.=20
The router is a Linux box, with two NICs. One of them has a private =
address. The other one has a WAN address (it's a requirement of our =
provider that we use this address even if we have public addresses).=20

Anyway, one of our users needs to go out using a public IP, and NAT =
doesn't do, because he needs to establish a connection encrypted where =
the IP address is part of a signature.

We do have spare IPs. The problem is that I can't add a route to him, =
route returns "network is unreachable".

Suppose NIC A in the linux box (route) is 192.168.21.1. NIC B is our =
public IP 1 (of a pool of five) A.B.C.1. Everyone gets out using this IP =
and NAT.
Now I want someone in the LAN to own the public IP A.B.C.2, however he =
is connected to the internal switch.=20
I tried to do this

route add A.B.C.2 gw A.B.C.2 dev eth0=20

But I get "network unreachable".

Before you ask: I can't connect this special computer to the same place =
I connect the linux box (which would be the obvious solution) because =
the carrier expects traffic to come from one WAN IP, owned by the linux =
box.=20

All suggestions welcome.
------=_NextPart_000_0029_01C3F24F.FE742AB0
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
<DIV><FONT face=3DArial size=3D2>I have a small problem setting up a =
routing=20
exception here.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>We have a small LAN with NAT-based =
internet access.=20
Nothing special here. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The router is a Linux box, with two =
NICs. One of=20
them has a private address. The other one has a WAN address (it's a =
requirement=20
of our provider that we use this address even if we have public =
addresses).=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Anyway, one of our users needs to go =
out using a=20
public IP, and NAT doesn't do, because he needs to establish a =
connection=20
encrypted where the IP address is part of a signature.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>We do have spare IPs. The problem is =
that I can't=20
add a route to him, route returns "network is unreachable".</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Suppose NIC&nbsp;A in the linux box =
(route) is=20
192.168.21.1. NIC B is our public IP 1 (of a pool of five) A.B.C.1. =
Everyone=20
gets out using this IP and NAT.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Now I want someone in the LAN to own =
the public IP=20
A.B.C.2, however he is connected to the internal switch. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I tried to do this</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>route add A.B.C.2 gw A.B.C.2 dev eth0 =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>But I get "network =
unreachable".</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Before you ask: I can't connect this =
special=20
computer to the same place I connect the linux box (which would be the =
obvious=20
solution) because the carrier expects traffic to come from one WAN IP, =
owned by=20
the linux box. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>All suggestions =
welcome.</FONT></DIV></BODY></HTML>

------=_NextPart_000_0029_01C3F24F.FE742AB0--


