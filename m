From: "John Paul" <john@pinoylinux.sytes.net>
Subject: Re: Problem Found! - Firewall Rule
Date: Mon, 9 Jun 2003 11:35:46 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005c01c32e38$380565f0$1500a8c0@expi>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019266@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0059_01C32E7B.448A8650"
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

------=_NextPart_000_0059_01C32E7B.448A8650
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks George. I have modified my network to (10.10.0.0/24).=20

Now, I'am able to ping the machines inside the network after connected =
to the VPN. The problem now is, I'm not able to map/see machines in =
Network Neighborhood except the VPN server.

Any clue?      =20


  ----- Original Message -----=20
  From: George Vieira=20
  To: John Paul ; netfilter@lists.netfilter.org=20
  Sent: Friday, June 06, 2003 8:56 AM
  Subject: RE: Problem Found! - Firewall Rule


  Your local IP is the same as the remote networks IP.. so how is the =
local machine to know that 192.168.0.55 or 66 or 32 is on the VPN!?

  The only way I know is to proxyarp the ppp device that the vpn is =
running on.. I'm assuming it's PPTP so you could try this command when =
the VPN comes up :
  echo 1 > /proc/sys/net/ipv4/conf/$VPNDEV/proxy_arp

  and this must be done on the VPN server too..
  I've never done it this way with a VPN.. but you can only try it..

  I'm surprised that anything really works properly the way you've done =
it because the firewall has 2 network devices with the same IP range.
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
  Sent: Friday, June 06, 2003 9:56 AM
  To: netfilter@lists.netfilter.org
  Subject: Problem Found! - Firewall Rule


  Hello Folks, its me again :(

  Below is my config. My problem is, I can connect to VPN but for some =
reason, I cannot see machines inside the network after being connected. =
Can somebody give me the simpliest firewall rule on this? just for me to =
see the machines inside the network.

  Thanks!
  /JP


------=_NextPart_000_0059_01C32E7B.448A8650
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#edfefc>
<DIV><FONT face=3DArial size=3D2>Thanks George. I have modified my =
network to=20
(10.10.0.0/24). </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now, I'am able to ping the machines =
inside the=20
network after connected to the VPN. The problem now is, I'm not able to =
map/see=20
machines in Network Neighborhood except the VPN server.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any clue?</FONT><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
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
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Friday, June 06, 2003 =
8:56 AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: Problem Found! - =
Firewall=20
  Rule</DIV>
  <DIV><BR></DIV>
  <DIV><SPAN class=3D560554800-06062003><FONT face=3DArial =
color=3D#0000ff size=3D2>Your=20
  local IP is the same as the remote networks IP.. so how is the local =
machine=20
  to know that 192.168.0.55 or 66 or 32 is on the =
VPN!?</FONT></SPAN></DIV>
  <DIV><SPAN class=3D560554800-06062003><FONT face=3DArial =
color=3D#0000ff=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D560554800-06062003><FONT face=3DArial =
color=3D#0000ff size=3D2>The=20
  only way I know is to proxyarp the ppp device that the vpn is running =
on.. I'm=20
  assuming it's PPTP so you could try this command when the VPN comes up =

  :</FONT></SPAN></DIV>
  <DIV><SPAN class=3D560554800-06062003><FONT face=3DArial =
color=3D#0000ff size=3D2>echo=20
  1 &gt; /proc/sys/net/ipv4/conf/$VPNDEV/proxy_arp</FONT></SPAN></DIV>
  <DIV><SPAN class=3D560554800-06062003><FONT face=3DArial =
color=3D#0000ff=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D560554800-06062003></SPAN><FONT face=3DArial =
color=3D#0000ff=20
  size=3D2><SPAN class=3D560554800-06062003>and this must be done on the =
VPN server=20
  too..</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D560554800-06062003>I've=20
  never done it this way with a VPN.. but you can only try=20
  it..</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
  class=3D560554800-06062003></SPAN></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D560554800-06062003>I'm=20
  surprised that anything really works properly the way you've done it =
because=20
  the firewall has 2 network devices with the same IP =
range.</SPAN></FONT></DIV>
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
href=3D"http://www.citadelcomputer.com.au/">http://www.citadelcomputer.co=
m.au</FONT></A></MARQUEE></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> John Paul=20
  [mailto:john@pinoylinux.sytes.net]<BR><B>Sent:</B> Friday, June 06, =
2003 9:56=20
  AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> =
Problem=20
  Found! - Firewall Rule<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>
  <DIV><FONT face=3DArial size=3D2>Hello Folks, its me again =
:(</FONT></DIV>
  <DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
  <DIV>Below is my config. My problem is, I can connect to VPN but for =
some=20
  reason, I cannot see machines inside the network after being =
connected. Can=20
  somebody give me&nbsp;the simpliest&nbsp;firewall rule on this? just =
for me to=20
  see the machines inside the network.</DIV>
  <DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
  <DIV>Thanks!</DIV>
  <DIV>/JP</DIV>
  <DIV><FONT=20
color=3D#0000ff></FONT>&nbsp;</DIV></FONT></DIV></BLOCKQUOTE></BODY></HTM=
L>

------=_NextPart_000_0059_01C32E7B.448A8650--


