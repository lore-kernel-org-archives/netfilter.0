From: "Danila Octavian" <pisic@service.agress.ro>
Subject: Port forwarding problem...
Date: Tue, 11 Feb 2003 20:21:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <13720.2509250075$1044989251@news.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0013_01C2D20B.29EF0A40"
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

------=_NextPart_000_0013_01C2D20B.29EF0A40
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hello,

I want to ask you something regarding something that i am stuck in... =
:-)
I need to allow acces to a Web server which runs on a machine inside my =
LAN.
my topology is  :

internet =
<------>(eth0)[web,smtp,pop3,ftp](eth1)<------>LAN(192.168.13.0/24)

i have only one "real" IP on eth0.
=20
can you tell me how can i use something like :

http://www.myserver.xxx:33333 to redirect to .. let's say =
192.168.13.147:80 ??

the main problem that i see here is that on port 33333 i have no =
services running.

Thanxx in advance,
                                         Danila =
Octavian(pisic@service.agress.ro)

------=_NextPart_000_0013_01C2D20B.29EF0A40
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-2" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I want to ask you something regarding =
something=20
that i am stuck in... :-)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I need to allow acces to a Web server =
which runs on=20
a machine inside my LAN.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>my topology is&nbsp; :</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>internet=20
&lt;------&gt;(eth0)[web,smtp,pop3,ftp](eth1)&lt;------&gt;LAN(192.168.13=
.0/24)</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i have only one "real" IP on =
eth0.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>can&nbsp;you tell me how can i use =
something like=20
:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><A href=3D"http://www.myserver"></A><FONT face=3DArial size=3D2><A=20
href=3D"http://www.myserver.xxx:33333">http://www.myserver.xxx:33333</A> =
to=20
redirect to .. let's say 192.168.13.147:80 ??</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>the main problem that i see here is =
that on port=20
33333 i have no services running.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanxx in advance,</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Danila Octavian(<A=20
href=3D"mailto:pisic@service.agress.ro">pisic@service.agress.ro</A>)</FON=
T></DIV></DIV></BODY></HTML>

------=_NextPart_000_0013_01C2D20B.29EF0A40--



