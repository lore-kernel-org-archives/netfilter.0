From: "Nicolas" <fpnmml@free.fr>
Subject: iptables v1.2.7a: Unknown arg `--icmp-type'
Date: Wed, 8 Oct 2003 18:10:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NFEBKDECMMGIAKCMGJGDOENJEOAA.fpnmml@free.fr>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0029_01C38DC7.738E2690"
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

------=_NextPart_000_0029_01C38DC7.738E2690
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hey all

I'm trying to add iptables rules and get the folowing error message:
iptables v1.2.7a: Unknown arg `--icmp-type'
when I type the following line:
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT

It seems me there should be no problem with this.

Any help would be welcome

Nicolas

------=_NextPart_000_0029_01C38DC7.738E2690
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial size=3D2>Hey=20
all</FONT></SPAN></DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial size=3D2>I'm =
trying to add=20
iptables rules and get the folowing error message:</FONT></SPAN></DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial =
size=3D2>iptables v1.2.7a:=20
Unknown arg `--icmp-type'</FONT></SPAN></DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial size=3D2>when I =
type the=20
following line:</FONT></SPAN></DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial =
size=3D2>iptables -A=20
INPUT&nbsp;-p&nbsp;icmp --icmp-type destination-unreachable -j=20
ACCEPT</FONT></SPAN></DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial size=3D2>It =
seems me there=20
should be no problem with this.</FONT></SPAN></DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial size=3D2>Any =
help would be=20
welcome</FONT></SPAN></DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial=20
size=3D2>Nicolas</FONT></SPAN></DIV>
<DIV><SPAN class=3D138085615-08102003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0029_01C38DC7.738E2690--


