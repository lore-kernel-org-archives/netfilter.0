From: "AJ Mayor" <AJ@comspeco.net>
Subject: Linux with NAT
Date: Mon, 25 Nov 2002 14:16:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c294b7$27292890$7fb5a8c0@ajbox>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C2948D.3E29C6A0"
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

------=_NextPart_000_000D_01C2948D.3E29C6A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>"I am using RedHat 7.3 with iptables 1.2.6a,=20
>Apache 1.3.27 compiled with PHP 4.2.3 and >mod_perl 1.27,=20
>and running postgresql."

your box is trying to access postgresql as a local service through =
"localhost" Ive actually had simular problems in the past with MySQL, =
solved it by using "127.0.0.1" instead of "localhost"

AJ


------=_NextPart_000_000D_01C2948D.3E29C6A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial>&gt;"I am using RedHat 7.3 with iptables 1.2.6a, =

<BR>&gt;Apache 1.3.27 compiled with PHP 4.2.3 and &gt;mod_perl 1.27, =
<BR>&gt;and=20
running postgresql."</FONT></DIV>
<DIV><FONT face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>your box is trying to access =
postgresql as a=20
local service through "localhost" Ive actually had simular problems in =
the past=20
with MySQL, solved it by using "127.0.0.1" instead of=20
"localhost"</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>AJ</FONT></DIV>
<DIV><BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_000D_01C2948D.3E29C6A0--



