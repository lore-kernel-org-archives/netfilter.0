From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: [iptables] howto bind Mac to ip address
Date: Mon, 11 Aug 2003 21:03:12 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C0A6@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C35FF8.27D42AD0"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C35FF8.27D42AD0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

There is also a "time" patch which can allow rules to be active at =
certain times.. ie. browse only during lunch time.. ;) etc etc..
This would make it easier than a crontab... but both just as easy..
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
From: Paul Cousins [mailto:paul@pimper.fsnet.co.uk]
Sent: Monday, August 11, 2003 8:34 PM
To: netfilter@lists.netfilter.org
Subject: Re: [iptables] howto bind Mac to ip address


.>  I want to bind each MAC address to his or her assigned IP address so =
nobody should mess around to change his or her IP's.
=20
look into dhcpd from the internet consortium www.isc.org/products/DHCP/ =
99.9% of all linux release's come with so its a case of RTM and go from =
there but its very easy to configure espically with something like =
webmin.
=20

2.> I want to allow selective MAC addresses each time, so they are not =
allowed to use it all the time or I can block them whenever I want to.

=20

iptables can filter by mac address and ip adress so deny all users but =
those you wish to allow. A script with an allow variable in it would be =
you best bet as you coud add and remove users very quickly form the =
script then simply run and you new rules will be implemented =
immediately.

=20

simple cron scripts with drop or deny rules set to run at times you wish =
to deny access will restrict the users. there may be an easy way not =
sure?.=20

=20

=20

hope this points you in the rigth direction.

------------------------------------------------
Paul Cousins
Canterbury Computer Services
paul@canterburycomputerservices.co.uk
=20
=20

----- Original Message -----=20
From: Tariq Anwer <mailto:alien@aol.com.pk> =20
To: netfilter@lists.netfilter.org=20
Sent: Monday, August 11, 2003 9:17 AM
Subject: [iptables] howto bind Mac to ip address

Hi!
=20

I'm a new to Linux, I want to setup Linux NAT box for a small LAN with =
selective services to allow like only browsing for staff and other =
services for management like ftp msn chatting etc.

=20

1.>  I want to bind each MAC address to his or her assigned IP address =
so nobody should mess around to change his or her IP's.

=20

2.> I want to allow selective MAC addresses each time, so they are not =
allowed to use it all the time or I can block them whenever I want to.

=20

I will highly appreciate if anybody could help me or direct me to any =
web site or article to build this Box successfully.

=20

Best regards,

=20

Alien


------_=_NextPart_001_01C35FF8.27D42AD0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns:o =3D "urn:schemas-microsoft-com:office:office"><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D710080211-11082003><FONT face=3DArial color=3D#0000ff =
size=3D2>There=20
is also a "time" patch which can allow rules to be active at certain =
times.. ie.=20
browse only during lunch time.. ;) etc etc..</FONT></SPAN></DIV>
<DIV><SPAN class=3D710080211-11082003><FONT face=3DArial color=3D#0000ff =
size=3D2>This=20
would make it easier than a crontab... but both just as=20
easy..</FONT></SPAN></DIV>
<DIV><SPAN class=3D710080211-11082003></SPAN>&nbsp;</DIV>
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
size=3D2>-----Original Message-----<BR><B>From:</B> Paul Cousins=20
[mailto:paul@pimper.fsnet.co.uk]<BR><B>Sent:</B> Monday, August 11, 2003 =
8:34=20
PM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> Re: =
[iptables]=20
howto bind Mac to ip address<BR><BR></FONT></DIV>
<DIV>.&gt; <SPAN style=3D"mso-spacerun: yes">&nbsp;</SPAN>I want to bind =
each MAC=20
address to his or her assigned IP address so nobody should mess around =
to change=20
his or her IP&#8217;s.</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2><FONT face=3DTahoma><FONT color=3D#0000ff>look into =
dhcpd from the=20
internet consortium </FONT><A=20
href=3D"http://www.isc.org/products/DHCP/">www.isc.org/products/DHCP/</A>=
<FONT=20
color=3D#0000ff> 99.9% of all linux release's come with so its a case of =
RTM and=20
go from there but its very easy to configure espically with something =
like=20
webmin.</FONT></FONT></FONT></DIV>
<DIV><FONT face=3DTahoma color=3D#008000 size=3D2></FONT>&nbsp;</DIV>
<DIV>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">2.&gt; I want to =
allow selective=20
MAC addresses each time, so they are not allowed to use it all the time =
or I can=20
block them whenever I want to.</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2>iptables can filter by mac address and ip adress so deny all =
users but=20
those you wish to allow. A script with an allow variable in it would be =
you best=20
bet as you coud add and remove users very quickly form the script then=20
simply&nbsp;run and you new rules will be implemented =
immediately.</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2>simple cron scripts with drop or deny rules set to run at times =
you wish=20
to deny access will restrict the users. there may be an easy way not =
sure?.=20
</FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2></FONT>&nbsp;</P>
<P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT face=3DTahoma =
color=3D#0000ff=20
size=3D2>hope this points you in the rigth direction.</FONT></P></DIV>
<DIV>------------------------------------------------<BR>Paul=20
Cousins<BR>Canterbury Computer Services<BR><A=20
href=3D"mailto:paul@canterburycomputerservices.co.uk">paul@canterburycomp=
uterservices.co.uk</A></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #0000ff 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dalien@aol.com.pk href=3D"mailto:alien@aol.com.pk">Tariq =
Anwer</A>=20
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, August 11, 2003 =
9:17=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> [iptables] howto bind =
Mac to ip=20
  address</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hi!</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">I&#8217;m a new to =
Linux, I want to=20
  setup Linux NAT box for a small LAN with selective services to allow =
like only=20
  browsing for staff and other services for management like ftp msn =
chatting=20
  etc.</P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in =
0pt">&nbsp;<o:p></o:p></P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">1.&gt; <SPAN=20
  style=3D"mso-spacerun: yes">&nbsp;</SPAN>I want to bind each MAC =
address to his=20
  or her assigned IP address so nobody should mess around to change his =
or her=20
  IP&#8217;s.</P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in =
0pt">&nbsp;<o:p></o:p></P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">2.&gt; I want to =
allow=20
  selective MAC addresses each time, so they are not allowed to use it =
all the=20
  time or I can block them whenever I want to.</P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in =
0pt">&nbsp;<o:p></o:p></P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">I will highly =
appreciate if=20
  anybody could help me or direct me to any web site or article to build =
this=20
  Box successfully.</P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in =
0pt">&nbsp;<o:p></o:p></P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">Best regards,</P>
  <P class=3DMsoNormal style=3D"MARGIN: 0in 0in =
0pt">&nbsp;<o:p></o:p></P>
  <P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt">Alien</P></DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C35FF8.27D42AD0--

