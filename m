From: "Dariusz" <darkmartin@interia.pl>
Subject: CLASSIFY on bridge ?
Date: Wed, 18 Feb 2004 23:06:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c3f66b$7f9439e0$64d6600a@area51.katowice.pl>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01C3F673.DB8B5780"
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

------=_NextPart_000_000C_01C3F673.DB8B5780
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

CLASSIFY work on bridge ?

I write
iptables -t mangle -A POSTROUTING -o br0 -p tcp - m mark --mark 0x2000 =
-j
CLASSIFY --set-class 1:10

but packet no go to class

Dark
------=_NextPart_000_000C_01C3F673.DB8B5780
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
<DIV><FONT face=3DArial size=3D2>CLASSIFY work on bridge ?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I write</FONT></DIV>
<DIV>iptables -t mangle -A POSTROUTING -o br0 -p tcp - m mark --mark =
0x2000=20
-j<BR>CLASSIFY --set-class 1:10</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>but packet no go to class</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Dark</FONT></DIV></BODY></HTML>

------=_NextPart_000_000C_01C3F673.DB8B5780--



