From: "Christopher Davis" <cldavis@speakeasy.net>
Subject: Packet Flags & ICMP errors
Date: Sat, 17 May 2003 23:27:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <KOELJFLIIGOBCCBACPGBCEEHCAAA.cldavis@speakeasy.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0020_01C31CCB.F2FAD710"
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

------=_NextPart_000_0020_01C31CCB.F2FAD710
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

I'm trying to setup an iptables rule to bounce back an icmp error message on
a firewall if a packet is sent with the syn and fin flags only --

A packet with SYN flag set only -- accept
A packet with FIN flag set only -- accept
A packet with SYN & FIN flag -- reject Is it possible to choose the error
code?

Thank you for any help you can offer on this.
Christopher Davis

------=_NextPart_000_0020_01C31CCB.F2FAD710
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D841261403-18052003>I'm =
trying to setup=20
an iptables rule to bounce back an icmp error message on a firewall if a =
packet=20
is sent with the syn and&nbsp;fin flags only&nbsp;--</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D841261403-18052003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D841261403-18052003>A =
packet with SYN=20
flag set only -- accept</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D841261403-18052003>A =
packet with FIN=20
flag set only -- accept</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D841261403-18052003>A =
packet with SYN=20
&amp; FIN flag -- reject Is it possible to choose the error=20
code?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D841261403-18052003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D841261403-18052003>Thank =
you for any=20
help you can offer on this.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D841261403-18052003>Christopher=20
Davis</SPAN></FONT></DIV></BODY></HTML>

------=_NextPart_000_0020_01C31CCB.F2FAD710--



