From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Masquerade Problem
Date: Wed, 28 May 2003 11:28:36 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D19@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C324B8.75A96908"
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
To: Peter Pohlmann <peter@e-partner.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C324B8.75A96908
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

You need to add the ESTABLISHED,RELATED rules with -m state
=20
heaps of emails already about it... no offence. ;)
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
From: Peter Pohlmann [mailto:peter@e-partner.com]
Sent: Wednesday, May 28, 2003 11:16 AM
To: netfilter@lists.netfilter.org
Subject: Masquerade Problem


Hello list,
=20
I have a problem with my masquerading.=20
Can someone supply me a basic configuration. I want to have the private =
network
open for everything.=20
=20
The current rules are below. Works for pop ,http etc. But ftp is not =
proper and connecting to an outside=20
smtp server is a problem too. I can send very small emails but if some =
larger email or attachment it stops after transferring some kbs.  What =
am I missing here ?  The server is redhat 9 pppoe to the dsl modem.
=20
#!/bin/sh
=20
modprobe ip_conntrack_ftp
modprobe iptable_nat
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT


echo 1 >/proc/sys/net/ipv4/ip_forward
echo 1 >/proc/sys/net/ipv4/ip_dynaddr
=20
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS =
--clamp-mss-to-pmtu
=20
Thank you in advance,
Peter
=20


------_=_NextPart_001_01C324B8.75A96908
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">


<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D575072801-28052003><FONT face=3DArial color=3D#0000ff =
size=3D2>You=20
need to add the ESTABLISHED,RELATED rules with -m =
state</FONT></SPAN></DIV>
<DIV><SPAN class=3D575072801-28052003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D575072801-28052003><FONT face=3DArial color=3D#0000ff =
size=3D2>heaps=20
of emails already about it... no offence. ;)</FONT></SPAN></DIV>
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
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Peter Pohlmann=20
  [mailto:peter@e-partner.com]<BR><B>Sent:</B> Wednesday, May 28, 2003 =
11:16=20
  AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> =
Masquerade=20
  Problem<BR><BR></FONT></DIV>
  <DIV>
  <DIV><FONT size=3D2>Hello list,</FONT></DIV>
  <DIV><FONT size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT size=3D2>I have a problem with my masquerading. =
</FONT></DIV>
  <DIV><FONT size=3D2>Can someone supply me a basic configuration. I =
want to have=20
  the private network</FONT></DIV>
  <DIV><FONT size=3D2>open for everything. </FONT></DIV>
  <DIV><FONT size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT size=3D2>The current rules are below. Works for pop ,http =
etc. But=20
  ftp is not proper and connecting to an outside </FONT></DIV>
  <DIV><FONT size=3D2>smtp server is a problem too. I can send very =
small emails=20
  but if some larger email or attachment it stops after transferring =
some=20
  kbs.&nbsp; What am I missing here ?&nbsp; The server is redhat 9 pppoe =
to the=20
  dsl modem.</FONT></DIV>
  <DIV><FONT size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT size=3D2>#!/bin/sh</FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT size=3D2>modprobe ip_conntrack_ftp<BR>modprobe=20
  iptable_nat</FONT></DIV>
  <DIV><FONT size=3D2>iptables -P INPUT ACCEPT<BR>iptables -P OUTPUT=20
  ACCEPT<BR>iptables -P FORWARD ACCEPT</FONT></DIV><FONT size=3D2>
  <DIV><BR>echo 1 &gt;/proc/sys/net/ipv4/ip_forward<BR>echo 1=20
  &gt;/proc/sys/net/ipv4/ip_dynaddr</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE<BR>iptables =
-A=20
  FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS =
--clamp-mss-to-pmtu</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>Thank you in advance,</DIV>
  <DIV>Peter</DIV>
  <DIV>&nbsp;</DIV></FONT></DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C324B8.75A96908--

