From: "s" <xperience@interia.pl>
Subject: NAT PPPOE & MTU problems
Date: Thu, 29 May 2003 14:36:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c325de$f89fde60$1800a8c0@ckznak.pl>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C325EF.BB9AC640"
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

------=_NextPart_000_0005_01C325EF.BB9AC640
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

I've got a problem with NAT connections on PPPOE.
My box is connected to internet via DSL, and I have some computers =
behind NAT.=20
I changed MTU on internal interfaces to 1492 and configured iptables =
with:

iptables -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS =
--clamp-mss-to-pmtu

also I have squid cache installed for local workstations.
When I surfing net without squid everything works fine, no timeouts or =
something. Is good.
But when I use squid as a cache sometimes when squid uses POST method =
with huge amount of parameters, connection hangs. On tcpdump I see that =
one packet is repeated few times (5) and I got timeout message.
What's wrong ? Repeated packet has 1492 bytes lenght. But there's no =
answer from www server.

Pozdraviam
Przemyslaw Borkowski
------=_NextPart_000_0005_01C325EF.BB9AC640
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-2">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I've got a problem with NAT connections =
on=20
PPPOE.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>My box is connected to internet via =
DSL, and I have=20
some computers behind NAT. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I changed MTU on internal interfaces to =
1492 and=20
configured iptables with:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -p tcp -m tcp =
--tcp-flags=20
SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>also I have squid cache installed for =
local=20
workstations.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>When I surfing net without squid =
everything works=20
fine, no timeouts or something. Is good.</FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2>But when I use squid as a cache =
sometimes=20
when squid uses POST method with huge amount of parameters, connection =
hangs. On=20
tcpdump I see that one packet is repeated few times (5) and I got =
timeout=20
message.</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2>What's wrong ? Repeated packet =
has 1492 bytes=20
lenght. But there's no answer from www server.</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT =
size=3D2><FONT>Pozdraviam</FONT></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2><FONT>Przemyslaw=20
Borkowski</DIV></FONT></FONT></FONT></BODY></HTML>

------=_NextPart_000_0005_01C325EF.BB9AC640--



