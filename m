From: "AJ Mayor" <AJ@comspeco.net>
Subject: DNAT & Redirects
Date: Tue, 19 Nov 2002 16:40:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c29014$430b39b0$8bb5a8c0@ajbox>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01C28FEA.5A0F0C10"
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

------=_NextPart_000_000C_01C28FEA.5A0F0C10
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello All,

Im trying (unsuccessfully thus far) to do the following.

Redirect all port 80 http traffic coming from subnet 172.16.100.0/24 to =
172.16.200.5:80

The idea being that all people on the 172.16.100.0 subnet are suspended =
from surfing the net and that any http request they make will bring them =
to a default webpage on the server saying something to the effect of pls =
call our office to activate your account blah blah blah

here is what I have tried and failed with so far;

iptables -t nat -A PREROUTING -p tcp -s 172.16.100.0/24 -d 0/0 -dport 80 =
-j DNAT --to 172.16.200.5:80

i know im overlooking something but what i dont know, any idea on this =
one??

AJ

------=_NextPart_000_000C_01C28FEA.5A0F0C10
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>Hello All,</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Im trying (unsuccessfully thus far) to =
do the=20
following.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Redirect all port 80 http traffic =
coming from=20
subnet 172.16.100.0/24 to 172.16.200.5:80</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The idea being that all people on the =
172.16.100.0=20
subnet are suspended from surfing the net and that any http request they =
make=20
will bring them to a default webpage on the server saying something to =
the=20
effect of pls call our office to activate your account blah blah=20
blah</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>here is what I have tried and failed =
with so=20
far;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -p tcp -s =

172.16.100.0/24 -d 0/0 -dport 80 -j DNAT --to =
172.16.200.5:80</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i know im overlooking something but =
what i dont=20
know, any idea on this one??</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>AJ</FONT></DIV></BODY></HTML>

------=_NextPart_000_000C_01C28FEA.5A0F0C10--



