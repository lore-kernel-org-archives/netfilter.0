From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: help regarding DNAT
Date: Wed, 4 Jun 2003 08:20:10 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6DA1@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C32A1E.4BDDCE1E"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: subramanya <angeeras@satyam.net.in>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C32A1E.4BDDCE1E
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

You may need a bridge patch to make iptables work on a bridge... not =
100% sure but that might be it.
=20
A bridge links 2 network cards together basically, so it listens and =
learns ARP addresses on each side and basically proxys the ARP so link =
the 2 sides of the machine together making it almost 100% transparent... =
I've been told years ago that it bypasses the packets filtering because =
of this..
=20
But that was years ago and I've been told since that there are patches =
to enable the filtering but I don't know much more than that..
=20
hope that's some info for you..
=20

Thanks,

=20
____________________________________________
George Vieira
Citadel Computer Systems Pty Ltd Systems Manager georgev AT =
citadelcomputer DOT com DOT au=20
Citadel Computer Systems Pty Ltd
Phone : +61 2 9955 2644 HelpDesk: +61 2 9955 2698  =
<http://www.citadelcomputer.com.au/> http://www.citadelcomputer.com.au
=20
=20
-----Original Message-----
From: subramanya [mailto:angeeras@satyam.net.in]
Sent: Tuesday, June 03, 2003 2:25 PM
To: netfilter@lists.netfilter.org
Subject: help regarding DNAT


i am a student doing my final year engineering project work.
=20
i am faced with a problem:i want to DNAT all the packets and ia m using =
the following command:
=20
iptables -t nat -I PREROUTING -p ALL -j DNAT -s xx.xx.xx.xx -d =
yy.yy.yy.yy --to-destination zz.zz.zz.zz
=20
this works fine on a router. but this doesnot work on a machine that =
acts as a bridge. the packets that are entering the PREROUTING chain are =
lost in that chain.
=20
what could the problem be? plz help
=20
=20
=20

------_=_NextPart_001_01C32A1E.4BDDCE1E
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D588331722-03062003><FONT face=3DArial color=3D#0000ff =
size=3D2>You=20
may need a bridge patch to make iptables work on a bridge... not 100% =
sure but=20
that might be it.</FONT></SPAN></DIV>
<DIV><SPAN class=3D588331722-03062003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D588331722-03062003><FONT face=3DArial color=3D#0000ff =
size=3D2>A=20
bridge links 2 network cards together basically, so it listens and =
learns ARP=20
addresses on each side and basically proxys the ARP so link the 2 sides =
of the=20
machine together making it almost 100% transparent... I've been told =
years ago=20
that it bypasses the packets filtering because of =
this..</FONT></SPAN></DIV>
<DIV><SPAN class=3D588331722-03062003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D588331722-03062003><FONT face=3DArial color=3D#0000ff =
size=3D2>But=20
that was years ago and I've been told since that there are patches to =
enable the=20
filtering but I don't know much more than that..</FONT></SPAN></DIV>
<DIV><SPAN class=3D588331722-03062003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D588331722-03062003><FONT face=3DArial color=3D#0000ff =
size=3D2>hope=20
that's some info for you..</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV>
<P><FONT face=3DArial size=3D2><SPAN=20
class=3D674251008-03092002>Thanks,</SPAN></FONT></P></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D674251008-03092002></SPAN></FONT>&nbsp;</DIV>
<DIV style=3D"WIDTH: 305px; HEIGHT: 232px">
<MARQUEE id=3DMarquee1 style=3D"WIDTH: 220px; HEIGHT: 57px" trueSpeed =
scrollAmount=3D1=20
scrollDelay=3D20 direction=3Ddown behavior=3Dslide loop=3D1 =
border=3D"2"><FONT=20
size=3D1>____________________________________________</FONT></MARQUEE><BR=
><B><FONT=20
color=3D#000066 size=3D2></FONT><FONT face=3DVerdana color=3D#000066 =
size=3D2>George=20
Vieira<BR></FONT></B>
<MARQUEE id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" trueSpeed =
scrollAmount=3D1=20
scrollDelay=3D3 behavior=3Dslide loop=3D1 border=3D"0"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3Dblack =
size=3D1><B>Citadel=20
Computer Systems Pty Ltd</B></FONT></MARQUEE>
<MARQUEE id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" trueSpeed =
scrollAmount=3D1=20
scrollDelay=3D3 behavior=3Dslide loop=3D1 border=3D"0"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3Dblack =
size=3D1><B>Systems=20
Manager</B></FONT></MARQUEE><FONT face=3DVerdana>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 255px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D2 scrollDelay=3D5 direction=3Dright =
behavior=3Dslide loop=3D1=20
width=3D300 height=3D16 border=3D"0"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3D#000099 =
size=3D1>georgev AT=20
citadelcomputer DOT com DOT au</FONT></MARQUEE>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D1 scrollDelay=3D3 behavior=3Dslide loop=3D1=20
border=3D"0"></MARQUEE></FONT>
<DIV><FONT face=3D"Verdana, Verdana, Helvetica, sans-serif" =
color=3Dblack=20
size=3D1>Citadel Computer Systems Pty Ltd</FONT><FONT =
face=3DVerdana></DIV>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D1 scrollDelay=3D3 direction=3Dright =
behavior=3Dslide loop=3D1=20
border=3D"0"><FONT color=3Dblack size=3D1>Phone : +61 2 9955=20
2644</FONT></MARQUEE></FONT><FONT face=3DVerdana>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D1 scrollDelay=3D3 direction=3Dright =
behavior=3Dslide loop=3D1=20
border=3D"0"><FONT color=3Dblack size=3D1>HelpDesk: +61 2 9955=20
2698</FONT></MARQUEE></FONT>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D4 scrollDelay=3D5 direction=3Dright =
behavior=3Dslide loop=3D1=20
border=3D"0"><A href=3D"http://www.citadelcomputer.com.au/"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3D#000099 =
size=3D1><A=20
href=3D"http://www.citadelcomputer.com.au/">http://www.citadelcomputer.co=
m.au</FONT></A></MARQUEE></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
size=3D2>-----Original Message-----<BR><B>From:</B> subramanya=20
[mailto:angeeras@satyam.net.in]<BR><B>Sent:</B> Tuesday, June 03, 2003 =
2:25=20
PM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> help =
regarding=20
DNAT<BR><BR></FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>i am a student doing my =
final year=20
engineering project work.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>i am faced with a =
problem:i want to=20
DNAT all the packets and ia m using the following command:</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>iptables -t nat -I =
PREROUTING -p ALL=20
-j DNAT -s xx.xx.xx.xx -d yy.yy.yy.yy --to-destination =
zz.zz.zz.zz</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>this works fine on a =
router. but this=20
doesnot work on a machine that acts as a bridge. the packets that are =
entering=20
the PREROUTING chain are lost in that chain.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>what could the problem =
be? plz=20
help</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 =
size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C32A1E.4BDDCE1E--

