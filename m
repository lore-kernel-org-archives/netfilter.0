From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Portfowarding not working while SNATing,
Date: Tue, 15 Jul 2003 16:45:15 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BF19@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C34A9C.A5CDE596"
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
To: Ilo <sneak@gmsg.co.za>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C34A9C.A5CDE596
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

How about telling us what the problem is and what you've done to =
eliminate/test it.. ie. tcpdumping, -j LOG, etc..
=20
I would've used -j MASQUERADE instead of SNAT personally......
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
From: Ilo [mailto:sneak@gmsg.co.za]
Sent: Tuesday, July 15, 2003 4:33 PM
To: netfilter@lists.netfilter.org
Subject: Portfowarding not working while SNATing,


If have the following set for some port forwarding that I need done, =
which works well...
=20
/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 196.11.11.11 =
--dport 80 -j DNAT --to 10.0.0.2:80
/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 196.11.11.11 =
--dport 389 -j DNAT --to 10.0.0.2:389

then once I set the following for SNAT so my local machines can get =
internet access my port forwarding=20
stops working.
=20
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 196.11.11.11
=20
=20
Is there something im not doing right? can someone point me in the right =
direction.
=20
tx.

------_=_NextPart_001_01C34A9C.A5CDE596
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
<DIV><SPAN class=3D276164406-15072003><FONT face=3DArial color=3D#0000ff =
size=3D2>How=20
about telling us what the problem is and what you've done to =
eliminate/test it..=20
ie. tcpdumping, -j LOG, etc..</FONT></SPAN></DIV>
<DIV><SPAN class=3D276164406-15072003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D276164406-15072003><FONT face=3DArial color=3D#0000ff =
size=3D2>I=20
would've used -j MASQUERADE instead of SNAT =
personally......</FONT></SPAN></DIV>
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
size=3D2>-----Original Message-----<BR><B>From:</B> Ilo=20
[mailto:sneak@gmsg.co.za]<BR><B>Sent:</B> Tuesday, July 15, 2003 4:33=20
PM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> =
Portfowarding=20
not working while SNATing,<BR><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>If have the following set for some port =
forwarding=20
that I need done, which works well...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><EM>/sbin/iptables -t nat -A PREROUTING =
-p tcp -i=20
eth0 -d 196.11.11.11 --dport 80 -j DNAT --to =
10.0.0.2:80<BR>/sbin/iptables -t=20
nat -A PREROUTING -p tcp -i eth0 -d 196.11.11.11 --dport 389 -j DNAT =
--to=20
10.0.0.2:389</EM><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>then once I set the following for SNAT =
so my local=20
machines can get internet access my port forwarding </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>stops working.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2><EM>/sbin/iptables -t nat -A =
POSTROUTING -o eth0 -j=20
SNAT --to 196.11.11.11</EM></FONT></DIV>
<DIV><EM></EM>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Is there something im not doing right? can someone point me in the =
right=20
direction.</DIV>
<DIV>&nbsp;</DIV>
<DIV>tx.</DIV></DIV></FONT></FONT></DIV></BODY></HTML>

------_=_NextPart_001_01C34A9C.A5CDE596--

