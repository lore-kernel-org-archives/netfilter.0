From: =?iso-8859-1?Q?Jeppe_S=F8rensen?= <smed@tdcadsl.dk>
Subject: iptables with alias?
Date: Sat, 5 Oct 2002 22:37:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002301c26caf$0a063210$1801a8c0@CBOOK>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0020_01C26CBF.CC236420"
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

------=_NextPart_000_0020_01C26CBF.CC236420
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello

I have a little question that perhaps someone can help me with

I have a interface to the inet with 4 dynamic ip addr
eth0 =3D first dynamic ip addr
eth0:0 =3D second dynmaic ip addr
and so on

I want to make 1 on 1 nat on the frist 2 aliass and the last 2 alias are =
for the rest of the network
192.168.1.5 nat to eth0
192.168.1.6 nat to eth0:0
192.168.1.7-to-15 nat to eth0:1
192.168.1.16-to-30 nat to eth0:2

but iptables wan't take alias

What do I do / what can I do ?

I have looked in the The netfilter user mailinglist Archives and found =
the following solution

ip addr add w.x.y.z/bits dev eth0 label eth00

but how does I get it to work with dynamic address?


The archive mail I found the solution in
http://lists.netfilter.org/pipermail/netfilter/2002-June/034592.html


Jeppe Sorensen
Denmark
------=_NextPart_000_0020_01C26CBF.CC236420
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have a little question that perhaps =
someone can=20
help me with</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a interface to the =
inet&nbsp;with 4 dynamic=20
ip addr</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0 =3D first dynamic ip =
addr</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0:0 =3D second dynmaic ip =
addr</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and so on</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I want to make 1 on 1 nat on the =
frist&nbsp;2=20
aliass and the last 2 alias are for the rest of the network</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>192.168.1.5 nat to eth0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>192.168.1.6 nat to eth0:0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>192.168.1.7-to-15 nat to =
eth0:1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>192.168.1.16-to-30 nat to =
eth0:2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>but iptables wan't take =
alias</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>What do I do / what can I do =
?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>I have looked in the </FONT><FONT =
size=3D2>The=20
netfilter user mailinglist </FONT><FONT size=3D2>Archives and found the =
following=20
solution</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ip addr add w.x.y.z/bits dev eth0 label =

eth00</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>but how does I get it to work with =
dynamic=20
address?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The archive mail I found =
the&nbsp;solution=20
in</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><A=20
href=3D"http://lists.netfilter.org/pipermail/netfilter/2002-June/034592.h=
tml">http://lists.netfilter.org/pipermail/netfilter/2002-June/034592.html=
</A></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Jeppe Sorensen</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Denmark</FONT></DIV></BODY></HTML>

------=_NextPart_000_0020_01C26CBF.CC236420--


