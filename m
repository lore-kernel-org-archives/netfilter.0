From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: NAT + Web based authentication ?
Date: Mon, 18 Aug 2003 10:26:42 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C105@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3651F.65CCB754"
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
To: Ashraf Zia <ashrafszia@yahoo.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C3651F.65CCB754
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Do what I do and write a special php script which they authenticate and =
it places entries into the database.
=20
Then have a "root" process which continously runs (like a service) and =
scans the database for flagged entries which represent new authenticated =
users and it resets the flag and create a rule for them.
=20
Then the rest is up to you how you want to keep/remove the rules.. ie. =
have the websession refresh every 30 seconds and it deletes the rules if =
they close the browser etc..etc..
=20
this is handy for wireless folks who don't really give a damn about =
mac/ip spoofing but don't want ANYONE to just hop on easily...
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
From: Ashraf Zia [mailto:ashrafszia@yahoo.com]
Sent: Monday, August 18, 2003 10:13 AM
To: netfilter@lists.netfilter.org
Subject: NAT + Web based authentication ?



HI everybody,

I am new to iptables. Need to figure out a solution.

- Want to create an authentication based NAT.=20

- Have the gateway machine running DHCP server on eth1 that gives up =
192.168.1.x ip addresses.

- eth0 on the gateway has a real ip.=20

- I have an web based authentication working at lets say www.abc.com on =
a remote web server.

- Now I have the Masquerading working at the gateway machine but I need =
to restrict the internet access to ip addresses who can authenticate =
themselves at www.abc.com. How do I interface authentication from web =
server with Iptables NAT and what rules do I use to get this done.

- Also I need that any port 80 request from address 192.168.1.x by =
defaults goes to www.abc.com=20

I think it can be done using script, but I am not sure how to use =
iptables for this.=20

Thanks in advance.

Zia

=20


  _____ =20

Do you Yahoo!?
Yahoo!  =
<http://us.rd.yahoo.com/evt=3D10469/*http://sitebuilder.yahoo.com> =
SiteBuilder - Free, easy-to-use web site design software

------_=_NextPart_001_01C3651F.65CCB754
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D911122300-18082003><FONT face=3DArial color=3D#0000ff =
size=3D2>Do=20
what I do and write a special php script which they authenticate and it =
places=20
entries into the database.</FONT></SPAN></DIV>
<DIV><SPAN class=3D911122300-18082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D911122300-18082003><FONT face=3DArial color=3D#0000ff =
size=3D2>Then=20
have a "root" process which continously runs (like a service) and scans =
the=20
database for flagged entries which represent new authenticated users and =
it=20
resets the flag and create a rule for them.</FONT></SPAN></DIV>
<DIV><SPAN class=3D911122300-18082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D911122300-18082003><FONT face=3DArial color=3D#0000ff =
size=3D2>Then=20
the rest is up to you how you want to keep/remove the rules.. ie. have =
the=20
websession refresh every 30 seconds and it deletes the rules if they =
close the=20
browser etc..etc..</FONT></SPAN></DIV>
<DIV><SPAN class=3D911122300-18082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D911122300-18082003><FONT face=3DArial color=3D#0000ff =
size=3D2>this=20
is handy for wireless folks who don't really give a damn about mac/ip =
spoofing=20
but don't want ANYONE to just hop on easily...</FONT></SPAN></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
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
size=3D2>-----Original Message-----<BR><B>From:</B> Ashraf Zia=20
[mailto:ashrafszia@yahoo.com]<BR><B>Sent:</B> Monday, August 18, 2003 =
10:13=20
AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> NAT + =
Web=20
based authentication ?<BR><BR></FONT></DIV>
<DIV></DIV>
<P>HI everybody,</P>
<P>I am new to iptables. Need to figure out a solution.</P>
<P>- Want to create an authentication based NAT. </P>
<P>- Have the gateway machine running DHCP server on eth1 that gives up=20
192.168.1.x ip addresses.</P>
<P>- eth0 on the gateway has a real ip.&nbsp;</P>
<P>- I have an web based authentication working at lets say <A=20
href=3D"http://www.abc.com">www.abc.com</A> on a remote web server.</P>
<P>- Now I have the Masquerading working at the gateway machine but I =
need to=20
restrict the internet access to ip addresses who can authenticate =
themselves at=20
<A href=3D"http://www.abc.com">www.abc.com</A>. How do I interface =
authentication=20
from web server with Iptables NAT and what rules do I use to get this =
done.</P>
<P>- Also I need that any port 80 request from address 192.168.1.x by =
defaults=20
goes to <A href=3D"http://www.abc.com">www.abc.com</A> </P>
<P>I think it can be done using script, but I am not sure how to use =
iptables=20
for this. </P>
<P>Thanks in advance.</P>
<P>Zia</P>
<P>&nbsp;</P>
<P>
<HR SIZE=3D1>
Do you Yahoo!?<BR><A=20
href=3D"http://us.rd.yahoo.com/evt=3D10469/*http://sitebuilder.yahoo.com"=
>Yahoo!=20
SiteBuilder</A> - Free, easy-to-use web site design =
software</BODY></HTML>

------_=_NextPart_001_01C3651F.65CCB754--

