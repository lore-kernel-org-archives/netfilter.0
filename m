From: "Roberto Rossi" <roberto.rossi@smc.it>
Subject: mail server problem
Date: Fri, 7 Nov 2003 16:10:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005e01c3a541$375c29b0$0101010a@tv.smc>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_005B_01C3A549.98FBF2B0"
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

------=_NextPart_000_005B_01C3A549.98FBF2B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello all,

I've a range of 30 public internet addresses to manage starting, say, =
from 213.25.24.0 to 213.25.24.31 netmask of course 255.255.255.224.

My firewall (Red Hat 9.0, latest kernel) public IP is 213.25.24.30 the =
router address is 213.25.24.1 and the LAN network is 10.1.0.0/16.

I've an internal mail server, say, 10.1.1.2 which I would like to see =
from the outside as 213.25.24.3, one IP of my range.

Except DNS registration, what are the correct steps to make this =
possible?

I just set this rule on my firewall:
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 213.25.24.3 --dport 25 =
-j DNAT --to 10.1.1.2:25

but I guess it's not enough because it's not working.

A help is really appreciated, thanks in advance.

Roberto - Italy    
------=_NextPart_000_005B_01C3A549.98FBF2B0
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
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DVerdana size=3D2>Hello all,</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D2>I've a range of 30 public internet =
addresses to=20
manage starting, say, from 213.25.24.0 to 213.25.24.31 netmask of course =

255.255.255.224.</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D2>My firewall (Red Hat 9.0, latest=20
kernel)&nbsp;public IP is 213.25.24.30 the router address=20
is&nbsp;213.25.24.1&nbsp;and the LAN network is =
10.1.0.0/16.</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D2>I've an internal mail server, say, =
10.1.1.2 which=20
I would like to see from the outside&nbsp;as 213.25.24.3, one IP of my=20
range.</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D2>Except DNS registration, what are the =
correct=20
steps to make this possible?</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D2>I just set this rule on my =
firewall:</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D2>iptables -t nat -A PREROUTING -p tcp =
-i eth0 -d=20
213.25.24.3 --dport 25 -j DNAT --to 10.1.1.2:25<BR></FONT></DIV>
<DIV><FONT face=3DVerdana size=3D2>but I guess it's not enough because =
it's not=20
working.</DIV></FONT>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D2>A help is really appreciated, thanks =
in=20
advance.</FONT></DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana size=3D2>Roberto - Italy&nbsp;&nbsp;&nbsp;=20
</FONT></DIV></BODY></HTML>

------=_NextPart_000_005B_01C3A549.98FBF2B0--


