From: "HTB" <kerasakti@nusa.net.id>
Subject: Are IP ALIASES supported by iptables?
Date: Tue, 29 Jul 2003 12:06:14 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008301c3558f$22b075e0$080a0a0a@medannic>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0080_01C355C9.CEDFB260"
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

------=_NextPart_000_0080_01C355C9.CEDFB260
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When i want to active nat using iptable on eth0:0 (aliasing) "error =
appear"
# /sbin/iptables -A POSTROUTING -j MASQUERADE -t nat -s 192.168.0.0/24 =
-o eth0:0
Warning: wierd character in interface `eth0:0' (No aliases, :, ! or *).

Are IP ALIASES supported by iptables?



regards

HTB


------=_NextPart_000_0080_01C355C9.CEDFB260
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2479.1" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>When i want to active nat using iptable =
on eth0:0=20
(aliasing) "error appear"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># /sbin/iptables -A POSTROUTING -j =
MASQUERADE -t=20
nat -s 192.168.0.0/24 -o eth0:0<BR>Warning: wierd character in interface =

`eth0:0' (No aliases, :, ! or *).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>
<P>Are IP ALIASES supported by iptables?</P>
<P>&nbsp;</P>
<P><FONT size=3D2>regards</FONT></P>
<P><FONT size=3D2>HTB</FONT></P></FONT></FONT></DIV></BODY></HTML>

------=_NextPart_000_0080_01C355C9.CEDFB260--


