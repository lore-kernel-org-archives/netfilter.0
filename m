From: "Guillaume" <gkweb@wanadoo.fr>
Subject: nat table
Date: Sat, 7 Sep 2002 18:56:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c2568f$757ca410$0100a8c0@poste1>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0006_01C256A0.38AB4620"
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

------=_NextPart_000_0006_01C256A0.38AB4620
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have a windows PC behind a linux gateway with iptables. Whit it, the =
default policy for all is DROP, but the two line "mangle" are ACCEPT.
All work well to go on internet, send/received email,etc...
But there is one thing wich don't want to work, and i don't understand =
at all what is wrong. I have a small daemon who is listening on my =
network card eth0 on LAN side at port 3000, and I can't connect on it =
from my windows browser.
But, when I put policy for nat table "POSTROUTING, OUTPUT" to ACCEPT, =
it's work! I am able to connect on my daemon.
I don't understand because I have between other the folowing rules:

iptables -t nat -A PREROUTING   -i eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j ACCEPT
iptables -t nat -A OUTPUT           -o eth0 -j ACCEPT

Why when i put default policy of nat table to DROP, i can't connect? =
even with this rules?
What i have to do against?

Thanks.

        Guillaume.

------=_NextPart_000_0006_01C256A0.38AB4620
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
<DIV><FONT face=3DArial size=3D2>I have a windows PC behind a linux =
gateway with=20
iptables. Whit it, the default policy for all is DROP, but the two line =
"mangle"=20
are ACCEPT.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>All work well to go on internet, =
send/received=20
email,etc...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But there is one&nbsp;thing wich don't =
want to=20
work, and i don't understand at all what is wrong. I have a small daemon =
who is=20
listening on my network card eth0 on LAN side at port 3000, and I can't =
connect=20
on it from my windows browser.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But, when I put policy for nat table =
"POSTROUTING,=20
OUTPUT" to ACCEPT, it's work! I am able to connect on my =
daemon.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I don't understand because I have =
between other the=20
folowing rules:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A =
PREROUTING&nbsp;&nbsp; -i eth0=20
-j ACCEPT</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A&nbsp;POSTROUTING -o =
eth0 -j=20
ACCEPT</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A=20
OUTPUT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-=
o eth0=20
-j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Why when i put default policy of nat =
table to DROP,=20
i can't connect? even with this rules?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>What i have to do against?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
Guillaume.</FONT></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_0006_01C256A0.38AB4620--


