From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: PPTP through masquerading gateway
Date: Mon, 8 Jul 2002 15:15:47 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <000801c226b3$e66ab6f0$3864a8c0@discmail.com>
References: <001a01c226ab$9b5e3220$d4524b42@winxp>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01C22692.5F5916F0"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001a01c226ab$9b5e3220$d4524b42@winxp>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: 'Marc Riddle' <mriddle@socal.rr.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0009_01C22692.5F5916F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Are you using the POM ip_conntrack_pptp module (or compiled into
kernel)?
 
I am fairly sure that NAT of any type 'breaks' PPTP connections, and the
above module is needed for you to NAT the PPTP connections...

-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of Marc Riddle
Sent: Monday, July 08, 2002 2:17 PM
To: netfilter@lists.samba.org
Subject: PPTP through masquerading gateway


I have read everything I can find on the subject and can't seem to find
a working solution anywhere. I have an NT 4.0 server running a PPTP
server inside a private network that is connected to the internet via a
linux 2.4 box running ip masquerading using iptables. the masquerading
works fine for clients to get out, but I'm trying to enable external
connections in to the PPTP server. currently I have the following rules
set up, as far as I can tell they should work, but I am unable to
establish a connection. The PPTP server is running on 10.1.1.15, and I
am able to connect to it from inside the router so I know that it is
running fine. I've been banging my head against a desk for about a week
now and nothing I've tried seems to work. Any advice would be greatly
appreciated. Thanks in advance. Oh yeah, currently the rules below are
the only rules set up for testing, so no incoming packets are being
filtered that I know of.
 
Thanks again,
 
Marc Riddle
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 1723 -j DNAT --to
10.1.1.15

iptables -t nat -A PREROUTING -i ppp0 -p 47 -j DNAT --to 10.1.1.15


------=_NextPart_000_0009_01C22692.5F5916F0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D567511319-08072002><FONT face=3DArial color=3D#0000ff =
size=3D2>Are=20
you using the POM ip_conntrack_pptp module (or compiled into=20
kernel)?</FONT></SPAN></DIV>
<DIV><SPAN class=3D567511319-08072002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D567511319-08072002><FONT face=3DArial color=3D#0000ff =
size=3D2>I am=20
fairly sure that NAT of any type 'breaks' PPTP connections, and the =
above module=20
is needed for you to NAT the PPTP connections...</FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2>-----Original Message-----<BR><B>From:</B>=20
  netfilter-admin@lists.samba.org =
[mailto:netfilter-admin@lists.samba.org] <B>On=20
  Behalf Of </B>Marc Riddle<BR><B>Sent:</B> Monday, July 08, 2002 2:17=20
  PM<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> PPTP =
through=20
  masquerading gateway<BR><BR></FONT></DIV>
  <DIV><FONT size=3D2><FONT face=3DArial>I have read everything I can =
find on the=20
  subject and can't seem to find a working solution anywhere. I have an =
NT 4.0=20
  server running a PPTP server inside a private network that is =
connected to the=20
  internet via a linux 2.4 box running ip masquerading using iptables. =
the=20
  masquerading works fine for clients to get out, but I'm trying to =
enable=20
  external connections in to the PPTP server. currently I have the =
following=20
  rules set up, as far as I can tell they should work, but I am unable =
to=20
  establish a connection. The PPTP server is running on 10.1.1.15, and I =
am able=20
  to connect to it from inside the router so I know that it is running =
fine.=20
  I've been banging my head against a desk for about a week now and =
nothing I've=20
  tried seems to work. Any advice would be greatly appreciated. Thanks =
in=20
  advance. Oh yeah, currently the rules below are the only rules set up =
for=20
  testing, so no incoming packets&nbsp;are being filtered that I know=20
  of.</FONT></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Thanks again,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Marc Riddle</FONT></DIV>
  <DIV><PRE>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 1723 -j DNAT --to =
10.1.1.15
iptables -t nat -A PREROUTING -i ppp0 -p 47 -j DNAT --to 10.1.1.15
</PRE></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0009_01C22692.5F5916F0--


