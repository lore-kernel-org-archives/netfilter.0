From: "Gerry Weaver" <gerryw@objectivedomain.com>
Subject: iptables bridge filter question
Date: Thu, 18 Mar 2004 02:28:28 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ILECICAFAJIIMPBBLMEAAELECPAA.gerryw@objectivedomain.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000E_01C40C90.B2BBE9E0"
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

------=_NextPart_000_000E_01C40C90.B2BBE9E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello All,

I have setup a bridging firewall. I want to drop packets on the external
interface, which have source addresses on my internal network. However, the
firewall/bridge sits between my T1 router and the rest of my LAN. Is there a
way to drop the packets mentioned previously, but allow the router? I guess
a rule could be created that uses the routers mac address as a match. I've
been playing around with this, but I'm not getting the result I want. I
could sure use some advice on this.

[ LAN xx.xx.xx.0/24 ]<==>[ bridge/firewall ]<==>[ router xx.xx.xx.254/24 ]


Thanks in advance,
Gerry
---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.576 / Virus Database: 365 - Release Date: 1/30/2004

------=_NextPart_000_000E_01C40C90.B2BBE9E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D668195307-18032004>Hello=20
All,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D668195307-18032004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D668195307-18032004>I have =
setup a=20
bridging firewall. I want to drop packets on the external interface, =
which have=20
source addresses on my internal network. However, the firewall/bridge =
sits=20
between my T1 router and the rest of my LAN. Is there a way to drop the =
packets=20
mentioned previously, but allow the router? I guess a rule could be =
created that=20
uses the routers mac address as a match. I've been playing around with =
this, but=20
I'm not getting the result I want. I could sure use some advice on=20
this.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D668195307-18032004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D668195307-18032004>[ LAN =
xx.xx.xx.0/24=20
]&lt;=3D=3D&gt;[ bridge/firewall ]&lt;=3D=3D&gt;[ router xx.xx.xx.254/24 =

]</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D668195307-18032004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D668195307-18032004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D668195307-18032004>Thanks =
in=20
advance,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D668195307-18032004>Gerry</SPAN></FONT></DIV></BODY></HTML>

------=_NextPart_000_000E_01C40C90.B2BBE9E0--


