From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: h323
Date: Mon, 18 Aug 2003 07:51:33 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C0F6@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C36509.B99CF24C"
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

------_=_NextPart_001_01C36509.B99CF24C
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

        insmod ip_nat_h323
        insmod ip_conntrack_h323
=20
        $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 389    =
-j DNAT --to 192.168.0.1         # H323
        $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 522    =
-j DNAT --to 192.168.0.1         # H323
        $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1503   =
-j DNAT --to 192.168.0.1         # H323
        $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1720   =
-j DNAT --to 192.168.0.1         # H323
        $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1731   =
-j DNAT --to 192.168.0.1         # H323
        $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 8080   =
-j DNAT --to 192.168.0.1         # H323
        $IPTABLES -t nat -A PREROUTING -i $EXTDEV -p tcp --dport 1469   =
-j DNAT --to 192.168.0.1         # H323aud
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
From: Sundaram Ramasamy [mailto:sun@percipia.com]
Sent: Friday, August 15, 2003 11:35 PM
To: George Vieira; dalive@flashmail.com; netfilter@lists.netfilter.org
Cc: Morrison, Trevor (Trevor)
Subject: Re: h323


Can you post your iptables rules for this?

----- Original Message -----=20
From: George Vieira <mailto:georgev@citadelcomputer.com.au> =20
To: dalive@flashmail.com ; netfilter@lists.netfilter.org=20
Cc: Morrison, Trevor (Trevor) <mailto:tmorrison@avaya.com> =20
Sent: Tuesday, August 12, 2003 6:48 AM
Subject: RE: h323

Just use the H323 patch in p-o-m... I use it and it works fine for me..
I don't know what this gatekeeper is.. but it's not needed if you can =
successfully patch in the pom module.


------_=_NextPart_001_01C36509.B99CF24C
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE></TITLE>

<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY text=3D#000000 bgColor=3D#ffffff>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D727424921-17082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
insmod=20
ip_nat_h323</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D727424921-17082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
insmod=20
ip_conntrack_h323</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D727424921-17082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -t nat -A =
PREROUTING=20
-i $EXTDEV -p tcp --dport 389&nbsp;&nbsp;&nbsp; -j DNAT --to&nbsp;<SPAN=20
class=3D727424921-17082003>192.168.0.1</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
# H323<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -t nat -A =

PREROUTING -i $EXTDEV -p tcp --dport 522&nbsp;&nbsp;&nbsp; -j DNAT --to =
<SPAN=20
class=3D727424921-17082003>192.168.0.1</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
# H323<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -t nat -A =

PREROUTING -i $EXTDEV -p tcp --dport 1503&nbsp;&nbsp; -j DNAT --to <SPAN =

class=3D727424921-17082003>192.168.0.1</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
# H323<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -t nat -A =

PREROUTING -i $EXTDEV -p tcp --dport 1720&nbsp;&nbsp; -j DNAT --to <SPAN =

class=3D727424921-17082003>192.168.0.1</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
# H323<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -t nat -A =

PREROUTING -i $EXTDEV -p tcp --dport 1731&nbsp;&nbsp; -j DNAT --to <SPAN =

class=3D727424921-17082003>192.168.0.1</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
# H323<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -t nat -A =

PREROUTING -i $EXTDEV -p tcp --dport 8080&nbsp;&nbsp; -j DNAT --to <SPAN =

class=3D727424921-17082003>192.168.0.1</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
# H323<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -t nat -A =

PREROUTING -i $EXTDEV -p tcp --dport 1469&nbsp;&nbsp; -j DNAT --to <SPAN =

class=3D727424921-17082003>192.168.0.1</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
# H323aud</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
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
size=3D2>-----Original Message-----<BR><B>From:</B> Sundaram Ramasamy=20
[mailto:sun@percipia.com]<BR><B>Sent:</B> Friday, August 15, 2003 11:35=20
PM<BR><B>To:</B> George Vieira; dalive@flashmail.com;=20
netfilter@lists.netfilter.org<BR><B>Cc:</B> Morrison, Trevor=20
(Trevor)<BR><B>Subject:</B> Re: h323<BR><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Can you post your iptables rules for=20
this?</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dgeorgev@citadelcomputer.com.au=20
  href=3D"mailto:georgev@citadelcomputer.com.au">George Vieira</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Ddalive@flashmail.com=20
  href=3D"mailto:dalive@flashmail.com">dalive@flashmail.com</A> ; <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Cc:</B> <A =
title=3Dtmorrison@avaya.com=20
  href=3D"mailto:tmorrison@avaya.com">Morrison, Trevor (Trevor)</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Tuesday, August 12, 2003 =
6:48=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: h323</DIV>
  <DIV><BR></DIV>
  <DIV><SPAN class=3D728514710-12082003><FONT face=3DArial =
color=3D#0000ff size=3D2>Just=20
  use the H323 patch in p-o-m... I use it and it works fine for=20
  me..</FONT></SPAN></DIV>
  <DIV><SPAN class=3D728514710-12082003><FONT face=3DArial =
color=3D#0000ff size=3D2>I=20
  don't know what this gatekeeper is.. but it's not needed if you can=20
  successfully patch in the pom=20
module.</FONT></SPAN></DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C36509.B99CF24C--

