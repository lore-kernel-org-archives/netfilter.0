From: "John Berntsen" <john@pepco.no>
Subject: asymetric routing
Date: Mon, 28 Apr 2003 14:10:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004001c30d7f$1aa69bc0$0c0a0a0a@JOHNNY>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003D_01C30D8F.DE1D1C40"
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

------=_NextPart_000_003D_01C30D8F.DE1D1C40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

I'm running an ipchains 2.2.19 firewall inside ip 192.168.1.1
in parallell with this firewall i have a cisco160x router with ip =
192.168.1.2

The reason for the router is that i have multiple clients that are =
running pptp vpn towards
an external server connected to the internet, and it only allows one =
client per ip,
so the pptp masq patch does not work since all clients would appear to =
come from the same ip.

So i added a static route on the firewall, saying that all traffic =
towards the pptp server should go to
192.168.1.2 which would do full nat for each client making them come =
from different public ip's.

This works great with 2.2.19 and ipchains.

But when i installed a new machine with 2.4.20 and iptables 1.2.7a =
patched with Harald W pptp patch,
because of an internal pptp server, things broke.

Everything worked fine, except for the pptp vpn against that one server.

Clients trying this are nt4 boxes, and traffic works like this as far as =
i can understand:
client -  linux-gateway - cisco router - pptp server
and back like:
pptp server - nated ip on cisco - client

I tried to turn of rp_filter for the internal network card but that did =
not help.

So I ended up this morning switcing back to the machine running 2.2.19 =
and ipchains, and all
worked. Which has both icmp_redirect and rp_filter turned on.

in the iptables script i'm using, this was entered for the pptp machine
to make sure no filter blocked it.

iptables -A FORWARD -s $pptpsrv -j ACCEPT
iptables -A FORWARD -d $pptpsrv -j ACCEPT

these where entered before any snat rules
iptables -t nat -A PREROUTING -s $pptpsrv -j ACCEPT
iptables -t nat -A PREROUTING -d $pptpsrv -j ACCEPT
iptables -t nat -A POSTROUTING -s $pptpsrv -j ACCEPT
iptables -t nat -A POSTROUTING -d $pptpsrv -j ACCEPT

Does anyone have a suggestion about tuning parameters to make this work, =
or is it not possible
with iptables and connection tracking?

Mvh
John Berntsen / Pepco AS


------=_NextPart_000_003D_01C30D8F.DE1D1C40
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2726.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hi</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm running an ipchains 2.2.19 firewall =
inside ip=20
192.168.1.1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>in parallell with this firewall i have =
a cisco160x=20
router with ip 192.168.1.2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The reason for the router is that i =
have multiple=20
clients that are running pptp vpn towards</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>an external server connected to the =
internet, and=20
it only allows one client per ip,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>so the pptp masq patch does not work =
since all=20
clients would appear to come from the same ip.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So i added a static route on the =
firewall, saying=20
that all traffic towards the pptp server should go to</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>192.168.1.2 which would do full nat for =
each client=20
making them come from different public ip's.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This works great with 2.2.19 and=20
ipchains.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>But when i installed a new machine with =
2.4.20 and=20
iptables 1.2.7a patched with Harald W pptp patch,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>because of an internal pptp server, =
things=20
broke.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Everything worked fine, except for the =
pptp vpn=20
against that one server.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Clients trying this are nt4 boxes, and =
traffic=20
works like this as far as i can understand:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>client -&nbsp; linux-gateway - cisco =
router - pptp=20
server</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and back like:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>pptp server - nated ip on cisco -=20
client</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I tried to turn of rp_filter for the =
internal=20
network card but that did not help.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So I ended up this morning switcing =
back to the=20
machine running 2.2.19 and ipchains, and all</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>worked. Which has both icmp_redirect =
and rp_filter=20
turned on.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>in the iptables script i'm using, this =
was entered=20
for the pptp machine</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>to make sure no filter blocked =
it.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -s $pptpsrv -j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -d $pptpsrv -j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>these where entered before any snat=20
rules</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -s =
$pptpsrv -j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -d =
$pptpsrv -j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -s =
$pptpsrv -j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -d =
$pptpsrv -j=20
ACCEPT</FONT></DIV>
<DIV>&nbsp;</DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Does anyone have a suggestion about =
tuning=20
parameters to make this work, or is it not possible</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>with iptables and connection =
tracking?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Mvh<BR>John Berntsen / Pepco=20
AS</FONT></DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_003D_01C30D8F.DE1D1C40--


