From: "HTB" <kerasakti@nusa.net.id>
Subject: block mirc, messenger
Date: Thu, 19 Jun 2003 16:16:05 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <062e01c33643$69dee570$0300a8c0@medannic>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_062B_01C3367E.15B839C0"
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

------=_NextPart_000_062B_01C3367E.15B839C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello ,=20

I already install RH. 8, with 2 interface (eth0 10.10.10.8), (eth1 =
192.168.1.1), i want blocking mirc, messeger. I type this command

/sbin/iptables -I INPUT -i eth0 -p tcp -s 10.10.10.8/32 --dport 6667 -j =
DROP

but I still can running mirc.

pls help me to solv this problem

HTB


------=_NextPart_000_062B_01C3367E.15B839C0
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
<DIV><FONT face=3DArial size=3D2>Hello , </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I already install RH. 8, with 2 =
interface (eth0=20
10.10.10.8), (eth1 192.168.1.1), i want blocking mirc, messeger. I type =
this=20
command</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -I INPUT -i eth0 -p tcp =
-s=20
10.10.10.8/32 --dport 6667 -j DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>but I still can running =
mirc.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>pls help me to solv this =
problem</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>HTB</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_062B_01C3367E.15B839C0--


