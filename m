From: "Jeremy" <jeremy@paradise.net.nz>
Subject: pptp_conntrack_nat compatability & dependencies
Date: Thu, 24 Jul 2003 12:48:15 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <016401c3517d$44744be0$3964a8c0@comsol.co.nz>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0161_01C351E1.D96BFBD0"
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

------=_NextPart_000_0161_01C351E1.D96BFBD0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,=20

Here is something simple.

I want to clarify the following:
What kernelversion, what iptables version and what OTHER patches (i.e. =
helpers) etc. do I need to get this working correctly.=20

I run debian linux, and have tried the following:

Originial Configuration=20
--------------------------
Vanilla 2.4.20 kernel, iptables 1.2.6a, pom patch applied cleany, =
re-compiled cleanly.
rebooted, and any postrounting commands give 'invalid argument'=20

Other configurations tried
----------------------------
Vanilla 2.4.21 kernel, iptables 1.2.6a - same problem
Vanilla 2.4.21 kernel, iptables 1.2.7a - same problem
Vanilla 2.4.21 kernel, iptables 1.2.8 - same problem
Vanialla 2.4.19 - iptables 1.2.6a or 1.2.8 - same problem

the command Is just:
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source =
$INET_IP

error occurs when running as a script or typing in the values from a =
shell.=20

Do i just have an incompatability problem here? or is there something =
fundamental i'm doing wrong. =20
Any help much appreciated.=20

(about to throw this box out the window)









------=_NextPart_000_0161_01C351E1.D96BFBD0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi Everyone, </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is something simple.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I want to clarify the =
following:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>What kernelversion, what iptables =
version and what=20
OTHER patches (i.e. helpers) etc. do I need to get this working =
correctly.=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I run debian linux, and have tried the=20
following:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Originial Configuration </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--------------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Vanilla 2.4.20 kernel, iptables 1.2.6a, =
pom patch=20
applied cleany, re-compiled cleanly.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>rebooted, and any postrounting commands =
give=20
'invalid argument' </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Other configurations tried</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>----------------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Vanilla 2.4.21 kernel, iptables 1.2.6a =
- same=20
problem</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>Vanilla 2.4.21 kernel, iptables 1.2.7a =
- same=20
problem</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Vanilla 2.4.21 kernel, iptables 1.2.8 - =
same=20
problem</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Vanialla 2.4.19 - iptables 1.2.6a or =
1.2.8 - same=20
problem</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>the command Is just:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>$IPTABLES -t nat -A POSTROUTING -o =
$INET_IFACE -j=20
SNAT --to-source $INET_IP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>error occurs when running as a script =
or typing in=20
the values from a shell. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Do i just have an incompatability =
problem here? or=20
is there something fundamental i'm doing wrong.&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Any help much appreciated. =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>(about to throw this box out the=20
window)<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0161_01C351E1.D96BFBD0--


