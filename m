From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Blocking file type by iptables?
Date: Mon, 25 Aug 2003 08:28:18 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C183@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C36A8F.0448BFD0"
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
To: ads nat <adsnat@yahoo.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C36A8F.0448BFD0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

No because this is a bad idea. not only does the CPU have a bad day =
goign through every packet sniffing for file extensions but also that =
other innocent data can get blocked when it shouldn't be..
=20
1. The only thing you can do is block all outgoing/incoming ports and =
allow only some (25,80)
2. Use transparent squid proxy to limit access and get it to use regex =
expressions on URLs you may also want to block.
3. Block any and all MSN/Kazaa/ICQ servers addresses
=20
You could also setup a fake primary DNS domain like aol.com and icq.com =
and point to yourself... this is what I've done for ICQ to stop those =
damn ADs.. if the clients can't resolve the DNS for those domains then =
they also can't connect. But then they get smart and put a hosts file in =
their machine.. ;)
=20
=20
=20
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
From: ads nat [mailto:adsnat@yahoo.com]
Sent: Monday, August 25, 2003 2:22 AM
To: netfilter@lists.netfilter.org
Subject: Blocking file type by iptables?


Hi,
I have gone through mail archives to check whether can be blocked. I =
also checked squid mailing list. But thre is no definite solution to =
block kazza file downloads. I would like t know whether using iptables =
can i block particular type of file. If I block .mpeg, .mp3 files =
through IPtables then it does not matter from which site file is coming. =
It will get blocked.
Any suggestion and solutions.
Thanks


  _____ =20

Do you Yahoo!?
Yahoo!  =
<http://us.rd.yahoo.com/evt=3D10469/*http://sitebuilder.yahoo.com> =
SiteBuilder - Free, easy-to-use web site design software

------_=_NextPart_001_01C36A8F.0448BFD0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D528422422-24082003><FONT face=3DArial color=3D#0000ff =
size=3D2>No=20
because this is a bad idea. not only does the CPU have a bad day goign =
through=20
every packet sniffing for file extensions but also that other innocent =
data can=20
get blocked when it shouldn't be..</FONT></SPAN></DIV>
<DIV><SPAN class=3D528422422-24082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D528422422-24082003><FONT face=3DArial color=3D#0000ff =
size=3D2>1. The=20
only thing you can do is block all outgoing/incoming ports and allow =
only some=20
(25,80)</FONT></SPAN></DIV>
<DIV><SPAN class=3D528422422-24082003><FONT face=3DArial color=3D#0000ff =
size=3D2>2. Use=20
transparent squid proxy to limit access and get it to use regex =
expressions on=20
URLs you may also want to block.</FONT></SPAN></DIV>
<DIV><SPAN class=3D528422422-24082003><FONT face=3DArial color=3D#0000ff =
size=3D2>3.=20
Block any and all MSN/Kazaa/ICQ servers addresses</FONT></SPAN></DIV>
<DIV><SPAN class=3D528422422-24082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D528422422-24082003><FONT face=3DArial color=3D#0000ff =
size=3D2>You=20
could also setup a fake primary DNS domain like aol.com and icq.com and =
point to=20
yourself... this is what I've done for ICQ to stop those damn ADs.. if =
the=20
clients can't resolve the DNS for those domains then they also can't =
connect.=20
But then they get smart and put a hosts file in their machine..=20
;)</FONT></SPAN></DIV>
<DIV><SPAN class=3D528422422-24082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D528422422-24082003></SPAN><SPAN =
class=3D528422422-24082003><FONT=20
face=3DArial color=3D#0000ff size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D528422422-24082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
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
scrollDelay=3D3 behavior=3Dslide loop=3D1 width=3D281 height=3D19 =
border=3D"0"><FONT=20
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
size=3D2>-----Original Message-----<BR><B>From:</B> ads nat=20
[mailto:adsnat@yahoo.com]<BR><B>Sent:</B> Monday, August 25, 2003 2:22=20
AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> =
Blocking file=20
type by iptables?<BR><BR></FONT></DIV>
<DIV>Hi,</DIV>
<DIV>I have gone through mail archives to check whether can be blocked. =
I also=20
checked squid mailing list. But thre is no definite solution to block =
kazza file=20
downloads. I would like t know whether using iptables can i block =
particular=20
type of file. If I block .mpeg, .mp3 files through IPtables then it does =
not=20
matter from which site file is coming. It will get blocked.</DIV>
<DIV>Any suggestion and solutions.</DIV>
<DIV>Thanks</DIV>
<P>
<HR SIZE=3D1>
Do you Yahoo!?<BR><A=20
href=3D"http://us.rd.yahoo.com/evt=3D10469/*http://sitebuilder.yahoo.com"=
>Yahoo!=20
SiteBuilder</A> - Free, easy-to-use web site design =
software</BODY></HTML>

------_=_NextPart_001_01C36A8F.0448BFD0--

