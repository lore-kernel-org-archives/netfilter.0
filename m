From: "Leonardo A. de Camargo" <leonardo@openware.com.br>
Subject: NAT, SNAT, FORWARD, what i use ?
Date: Thu, 31 Oct 2002 10:20:25 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBLIMDELLHLIKGLDNNEEDBCBAA.leonardo@openware.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0003_01C280C7.2107C600"
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

------=_NextPart_000_0003_01C280C7.2107C600
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,
my first message on the list, hope it doesnt sucks.

I have machines xxx.zzz.yyy.www (conected to internet, via eth0) and a
196.10.10.2.
They are conected to each other with cable pluged in both eth1.
Looks like this

----------------eth0(xxx.zzz.yyy.www)eth1----------------------eth1(196.10.1
0.2)
internet                                                   cable


xxx.zzz.yyy.www is running iptables with drop policy on input, output and
forward chains.

I have services like telnet and www running on the 196.10.10.2.

I want that a connection, telnet(23) and www(80), to xxx.zzz.yyy.www be
redirected to 196.10.10.2.  (Somekind of a DMZ).

And im lost, tried some tutorials and man pages and couldnt build workin
rules for it.

Any tips, advices, rules or even candies are welcome.


Thanks in advance,

Leonardo

------=_NextPart_000_0003_01C280C7.2107C600
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2314.1000" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D220371012-31102002>Hi,=20
</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D220371012-31102002>my =
first message on=20
the list, hope it doesnt sucks.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D220371012-31102002>I have =
machines=20
xxx.zzz.yyy.www (conected to internet, via eth0) and a=20
196.10.10.2.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D220371012-31102002>They =
are conected to=20
each other with cable pluged in both eth1.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D220371012-31102002>Looks =
like=20
this</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002>----------------eth0(xxx.zzz.yyy.www)eth1-----=
-----------------eth1(196.10.10.2)</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002>internet&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
cable</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D220371012-31102002>xxx.zzz.yyy.www is=20
running iptables with drop policy on input, output and forward=20
chains.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D220371012-31102002>I have =
services like=20
telnet and www running on the 196.10.10.2.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D220371012-31102002>I want =
that a=20
connection, telnet(23) and www(80), to xxx.zzz.yyy.www be redirected to=20
196.10.10.2.&nbsp; (Somekind of a DMZ).</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D220371012-31102002>And im =
lost, tried=20
some tutorials and man pages and couldnt build workin rules for=20
it.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D220371012-31102002>Any =
tips, advices,=20
rules or even candies are welcome.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D220371012-31102002>Thanks =
in=20
advance,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D220371012-31102002>Leonardo</SPAN></FONT></DIV></BODY></HTML>

------=_NextPart_000_0003_01C280C7.2107C600--


