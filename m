From: "Ben Tan" <linuxnewbie74@hotmail.com>
Subject: does the ip_conntrack subjected to DOS attack???
Date: Fri, 1 Nov 2002 18:44:15 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002401c28193$9fcbbba0$1801010a@demo>
Reply-To: "Ben Tan" <linuxnewbie74@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0021_01C281D6.ADB80D20"
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
To: a <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0021_01C281D6.ADB80D20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi,
    it seems that once the ip_conntrack table is being filled up, the =
system will crash.=20

    Does it means that it is very vulnerable to DOS attack?

    I have performed a port scan using nmap on my box, and it is able to =
scan alot of ports being opened? How come this happened? I only allow =
established,related tcp packets and tcp port 22 New on INPUT to the box? =
The default policy is DROP.

    The result is=20
    port 22 open=20
    port 80 open

Why it is so? Pls advise. Thanks in advanced.

ben
    =20

   =20

------=_NextPart_000_0021_01C281D6.ADB80D20
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; it seems that once =
the=20
ip_conntrack table is being filled up, the system will crash. =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Does it means that =
it is very=20
vulnerable to DOS attack?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I have performed =
a&nbsp;port=20
scan using nmap on my box, and it is able to scan alot of ports being =
opened?=20
How come this happened? I only allow established,related tcp packets=20
and&nbsp;tcp port 22 New on INPUT to the box? The default policy is=20
DROP.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; The result is =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; port 22 open =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; port 80 =
open</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Why it is so? Pls advise. Thanks in=20
advanced.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ben</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; </FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
</FONT></DIV></BODY></HTML>

------=_NextPart_000_0021_01C281D6.ADB80D20--


