From: "Bertrand TACHAGO" <btachago@creolink.net>
Subject: Iptables and Zebra
Date: Tue, 16 Dec 2003 10:34:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006301c3c3b7$e02ef0b0$220aa8c0@BERTRAND>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0060_01C3C3C0.4166D020"
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

------=_NextPart_000_0060_01C3C3C0.4166D020
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi to all!
I'm trying to setup a zebra router on a RH9 machine but right I'm =
blocked because there's a firewall (iptables) problem. I had entered a =
POSTROUTING rule (iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE) =
but the packets are not routed to the external interface. Can somebody =
help me solve this problem (use zebra routing protocol to route packets =
from my network to the Internet)?

Bertrand TACHAGO
Computer specialist / Network administrator
Cellular: (237) 975 55 31
------=_NextPart_000_0060_01C3C3C0.4166D020
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
<DIV><FONT face=3DArial size=3D2>Hi to all!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I'm trying to setup a zebra router on a =
RH9 machine=20
but right I'm blocked because there's a firewall (iptables) problem. I =
had=20
entered a POSTROUTING rule (iptables -t nat -A POSTROUTING -o eth0 -j=20
MASQUERADE) but the packets are not routed to the external interface. =
Can=20
somebody help me solve this problem (use zebra routing protocol to route =
packets=20
from my network to the Internet)?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Bertrand TACHAGO<BR>Computer specialist =
/ Network=20
administrator<BR>Cellular: (237) 975 55 31</FONT></DIV></BODY></HTML>

------=_NextPart_000_0060_01C3C3C0.4166D020--


