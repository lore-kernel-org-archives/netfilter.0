From: "marekjs" <slackware9@tlen.pl>
Subject: problem with p-o-m...
Date: Thu, 17 Jul 2003 16:35:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c34c70$b8f4b980$1a00a8c0@mj>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001B_01C34C81.7C18D440"
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

------=_NextPart_000_001B_01C34C81.7C18D440
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi.
I use tke kernel 2.4.21 and I need to build a firewall.
I tried to patch my kernel by patch-o-matic in order:
-fresh kernel into /usr/src/linux
-make menuconfig
-./runme extra (sometimes base)
Everytime I've an error from patches like:
-/submitted/61-arptables_magle
-/pending/40_nf-log (ipv4 and ipv6 too)
-/extra/connmark
-/extra/pptp-conntrack-nat.
When I skip those patches, the kernel compiles OK.

Do you know any tricks how to remove this problem :) ?
Maybe it's not the problem. I'm not sure ;).

---------
All the best from:

marekjs
slackware9@tlen.pl
------=_NextPart_000_001B_01C34C81.7C18D440
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
<DIV><FONT face=3DArial size=3D2>Hi.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I use tke kernel 2.4.21 and I need to =
build a=20
firewall.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I tried to patch my kernel by =
patch-o-matic in=20
order:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-fresh kernel into =
/usr/src/linux</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-make menuconfig</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-./runme extra (sometimes =
base)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Everytime I've an error from patches=20
like:</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>-/submitted/61-arptables_magle</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-/pending/40_nf-log (ipv4 and ipv6=20
too)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-/extra/connmark</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>-/extra/pptp-conntrack-nat.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>When I skip those patches, the kernel =
compiles=20
OK.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Do you know any tricks how to remove =
this problem=20
:) ?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Maybe it's not the problem. I'm not =
sure=20
;).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>---------<BR>All the best =
from:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>marekjs<BR><A=20
href=3D"mailto:slackware9@tlen.pl">slackware9@tlen.pl</A></FONT></DIV></B=
ODY></HTML>

------=_NextPart_000_001B_01C34C81.7C18D440--


