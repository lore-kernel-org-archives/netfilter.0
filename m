From: "Tomek" <tomekm@cea.pl>
Subject: winXP l2tp ipsec protocol
Date: Fri, 16 Jul 2004 12:31:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c46b20$058208b0$2a245cc2@cea05>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_01C46B30.C5D8F9B0"
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
To: Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0012_01C46B30.C5D8F9B0
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi
I have problems with connection WinXP l2tp ipsec client to Linux 2.6.6 =
with racoon.
In case the NAT isn't between client and server everything is ok but =
when client is behind NAT occurs broblems with connecition.
I applied WinXP update ( L2TP/PISec NAT-t update) and racoon is =
configure with NAT-T. On my server my firewall have open ports for ISKMP =
( 500 ), L2TP (1701), and NAT-T (4500) and permits peckets of  ESP =
protocol.
When I applied tcpdump on server interface there are any packets on 4500 =
port ( NAT-T) only on port 500. The key negotiation ends on phase1.
Have somebody the same problem??Know somebody the solution of this =
problem.
Thanks and sorry for my English!!
Best regards
Tomek
------=_NextPart_000_0012_01C46B30.C5D8F9B0
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-2">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have problems with connection WinXP =
l2tp ipsec=20
client to Linux 2.6.6 with racoon.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>In case the NAT isn't between client =
and server=20
everything is ok but when client is behind NAT occurs broblems with=20
connecition.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I applied WinXP update ( L2TP/PISec =
NAT-t update)=20
and racoon is configure with NAT-T. On my server my firewall have open =
ports for=20
ISKMP ( 500 ), L2TP (1701), and NAT-T (4500) and permits&nbsp;peckets of =

&nbsp;ESP protocol.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>When I applied tcpdump on server =
interface there=20
are any packets on 4500 port ( NAT-T) only on port 500. The key =
negotiation ends=20
on phase1.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Have somebody the same problem??Know =
somebody the=20
solution of this problem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thanks and sorry for my =
English!!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Best regards</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Tomek</FONT></DIV></BODY></HTML>

------=_NextPart_000_0012_01C46B30.C5D8F9B0--


