From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: DNAT & Host Headers
Date: Tue, 1 Jul 2003 11:44:56 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BEA4@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C33F72.60261AFC"
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
To: Tim <twrodriguez@earthlink.net>, Netfilter Mailing List <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C33F72.60261AFC
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Connection tracking takes care after the SYN packet. Every connection =
ALWAYS uses the header (HTTP protocol) even for images and all... except =
for port 443 which is impossible after it switches to encrypted mode.
=20
I have this as a backup for our sites here which if any virtual site =
fails, I can use a string match to move --string "Host: www.domain.com" =
to another server and not ALL sites which are working fine..
=20
this works well and thank god it hasn't been required yet..

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
From: Tim [mailto:twrodriguez@earthlink.net]
Sent: Tuesday, July 01, 2003 11:34 AM
To: Netfilter Mailing List
Subject: DNAT & Host Headers


First here is the rules within their respective chains:=20
=20
iptables -t nat -A PREROUTING -p tcp --dport 80 -d $INTERNET -j DNAT =
--to $NEMESIS
=20
iptables -A FORWARD -p tcp --dport 80 -d $NEMESIS -j ACCEPT
=20
I'm running this particular web-site with a host header, when I type in =
the www.mydomain.com address on the browser and the packets hit the =
prerouting chain then the forward chain how will the communication still =
know that it is meant for www.mydomain.com
=20
Will this work or do I need to modify the rules in order for my web =
server to recognize that the information is intended for =
www.mydomain.com. As it is there are several web-sites within my =
web-server utilizing the same ip address, including the default =
web-site.
=20
Any insight will be gratefully appreciated.
=20
Thanks in advance
Tim--Mia/Fla.
=20

------_=_NextPart_001_01C33F72.60261AFC
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D625344201-01072003><FONT face=3DArial color=3D#0000ff =

size=3D2>Connection tracking takes care after the SYN packet. Every =
connection=20
ALWAYS uses the header (HTTP protocol) even for images and all... except =
for=20
port 443 which is impossible after it switches to encrypted=20
mode.</FONT></SPAN></DIV>
<DIV><SPAN class=3D625344201-01072003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D625344201-01072003><FONT face=3DArial color=3D#0000ff =
size=3D2>I have=20
this as a backup for our sites here which if any virtual site fails, I =
can use a=20
string match to move --string "Host: www.domain.com" to another server =
and not=20
ALL sites which are working fine..</FONT></SPAN></DIV>
<DIV><SPAN class=3D625344201-01072003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D625344201-01072003><FONT face=3DArial color=3D#0000ff =
size=3D2>this=20
works well and thank god it hasn't been required =
yet..</FONT></SPAN></DIV>
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
size=3D2>-----Original Message-----<BR><B>From:</B> Tim=20
[mailto:twrodriguez@earthlink.net]<BR><B>Sent:</B> Tuesday, July 01, =
2003 11:34=20
AM<BR><B>To:</B> Netfilter Mailing List<BR><B>Subject:</B> DNAT &amp; =
Host=20
Headers<BR><BR></FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>First here is the rules within their =
respective=20
chains: </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -p tcp =
--dport 80 -d=20
$INTERNET -j DNAT --to $NEMESIS</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -p tcp --dport 80 =
-d $NEMESIS=20
-j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm running this particular web-site =
with a host=20
header, when I type in the www.mydomain.com address on the browser and =
the=20
packets hit the prerouting chain then the forward chain how will the=20
communication still know that it is meant for =
www.mydomain.com</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Will this work or do I need to modify =
the rules in=20
order for my web server to recognize that the information is intended =
for=20
www.mydomain.com. As it is there are several&nbsp;web-sites within my =
web-server=20
utilizing the same ip address, including the default =
web-site.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any insight will be gratefully=20
appreciated.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Tim--Mia/Fla.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></DIV></BODY></HTML>

------_=_NextPart_001_01C33F72.60261AFC--

