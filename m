From: "John Paul" <john@pinoylinux.sytes.net>
Subject: Re: NAT or Proxy?
Date: Fri, 13 Jun 2003 13:03:13 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b801c33169$190aa140$fe000a0a@homes>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E94@wardrive.citadelcomputer.com.au>
Reply-To: "John Paul" <john@pinoylinux.sytes.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00B5_01C331AC.25ADF800"
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
To: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_00B5_01C331AC.25ADF800
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

oh yes, it was a TYPO ERROR in my part. that should be;

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

*shrug*

so, how can I establish plug and play connectivity w/o changing the ip =
addess of the client. Is it possible to do so?
  ----- Original Message -----=20
  From: George Vieira=20
  To: John Paul ; netfilter@lists.netfilter.org=20
  Sent: Friday, June 13, 2003 9:31 AM
  Subject: RE: NAT or Proxy?


  Change your ACCEPT to MAQUERADE.. ACCEPT will cause your 192.168.0.0 =
IPs to go out to the internet and guess what the ISP does to them.. yes, =
drops them...

  Thanks,


  ____________________________________________
  George Vieira
  Citadel Computer Systems Pty LtdSystems Managergeorgev AT =
citadelcomputer DOT com DOT au
  Citadel Computer Systems Pty Ltd
  Phone : +61 2 9955 2644HelpDesk: +61 2 9955 =
2698http://www.citadelcomputer.com.au


  -----Original Message-----
  From: John Paul [mailto:john@pinoylinux.sytes.net]
  Sent: Friday, June 13, 2003 10:12 AM
  To: netfilter@lists.netfilter.org
  Subject: NAT or Proxy?


  Hi,

  Case: My "PC" is configured to have a static IP (say 1.2.3.4). My =
private network is 192.168.0.0/24. I have  a firewall, NAT and squid =
running in my box.

  snip...(iptables)

  echo "1" > /proc/sys/net/ipv4/ip_forward
  iptables -t nat -A POSTROUTING -o ppp0 -j ACCEPT
  etc...

  Question: Im trying to establish plug and play connectivity. Can "PC" =
surf the net connected to the private network (i.e. 192.168.0.0/24) w/o =
changing its IP Address (1.2.3.4)??? Can this be handled by a firewall =
rule or by squid???

  Your help/tip/comments is very much appreciated.

  TIA
  //Jpee

------=_NextPart_000_00B5_01C331AC.25ADF800
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2726.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#edfefc>
<DIV><FONT face=3DArial size=3D2>oh yes, it was a TYPO ERROR in my part. =
that should=20
be;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>*shrug*</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>so, how can I establish plug and play =
connectivity=20
w/o changing the ip addess of the client. Is it possible to do =
so?</FONT></DIV>
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
title=3Djohn@pinoylinux.sytes.net=20
  href=3D"mailto:john@pinoylinux.sytes.net">John Paul</A> ; <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Friday, June 13, 2003 =
9:31 AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: NAT or =
Proxy?</DIV>
  <DIV><BR></DIV>
  <DIV><SPAN class=3D238173101-13062003><FONT face=3DArial =
color=3D#0000ff=20
  size=3D2>Change your ACCEPT to MAQUERADE.. ACCEPT will cause your =
192.168.0.0=20
  IPs to go out to the internet and guess what the ISP does to them.. =
yes, drops=20
  them...</FONT></SPAN></DIV>
  <DIV>&nbsp;</DIV>
  <DIV>
  <P><FONT face=3DArial size=3D2><SPAN=20
  class=3D674251008-03092002>Thanks,</SPAN></FONT></P></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN=20
  class=3D674251008-03092002></SPAN></FONT>&nbsp;</DIV>
  <DIV style=3D"WIDTH: 305px; HEIGHT: 232px">
  <MARQUEE id=3DMarquee1 style=3D"WIDTH: 220px; HEIGHT: 57px" trueSpeed=20
  scrollAmount=3D1 scrollDelay=3D20 direction=3Ddown behavior=3Dslide =
loop=3D1=20
  border=3D"2"><FONT=20
  =
size=3D1>____________________________________________</FONT></MARQUEE><BR=
><B><FONT=20
  color=3D#000066 size=3D2></FONT><FONT face=3DVerdana color=3D#000066 =
size=3D2>George=20
  Vieira<BR></FONT></B>
  <MARQUEE id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" trueSpeed=20
  scrollAmount=3D1 scrollDelay=3D3 behavior=3Dslide loop=3D1 =
border=3D"0"><FONT=20
  face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3Dblack =
size=3D1><B>Citadel=20
  Computer Systems Pty Ltd</B></FONT></MARQUEE>
  <MARQUEE id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" trueSpeed=20
  scrollAmount=3D1 scrollDelay=3D3 behavior=3Dslide loop=3D1 =
border=3D"0"><FONT=20
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
  =
href=3D"http://www.citadelcomputer.com.au">http://www.citadelcomputer.com=
.au</FONT></A></MARQUEE></DIV>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;</DIV>
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> John Paul=20
  [mailto:john@pinoylinux.sytes.net]<BR><B>Sent:</B> Friday, June 13, =
2003 10:12=20
  AM<BR><B>To:</B> <A=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A><BR><B>Subject:</B>=20
  NAT or Proxy?<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>
  <DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Case: My <STRONG><FONT=20
  color=3D#ff0000>"PC"</FONT></STRONG> is configured to have a static IP =
(say=20
  1.2.3.4). My private network is 192.168.0.0/24. I have&nbsp; a =
firewall,=20
  NAT&nbsp;and squid running in my box.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>snip...(iptables)</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>echo "1" &gt;=20
  /proc/sys/net/ipv4/ip_forward</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -o =
ppp0 -j=20
  ACCEPT</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>etc...</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Question: Im trying to establish plug =
and play=20
  connectivity. Can "<STRONG><FONT color=3D#ff0000>PC"</FONT></STRONG> =
surf the=20
  net connected to the private network (i.e. 192.168.0.0/24) w/o =
changing its IP=20
  Address (1.2.3.4)??? Can this be handled by a firewall rule or by=20
  squid???</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Your help/tip/comments is very much=20
  appreciated.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>TIA</FONT></DIV>
  <DIV><FONT face=3DArial=20
size=3D2>//Jpee</FONT></DIV></FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_00B5_01C331AC.25ADF800--


