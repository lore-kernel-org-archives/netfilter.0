From: "Rowan Reid" <rreid@studio3arc.com>
Subject: RE: PPTP through masquerading gateway
Date: Mon, 8 Jul 2002 13:54:06 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <000d01c226c1$9a049390$6b01a8c0@s3ac>
References: <000801c226b3$e66ab6f0$3864a8c0@discmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000E_01C22686.EDA5BB90"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000801c226b3$e66ab6f0$3864a8c0@discmail.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: "'Aldo S. Lagana'" <alagana@discmail.com>, 'Marc Riddle' <mriddle@socal.rr.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_000E_01C22686.EDA5BB90
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

 
 
I've been trying to get this to work. with no luck. I've used the POM
module which fails everytime I try to patch my kernel 2.4.4 and up
no luck even on a freshly downloaded kernel. other patches work but pptp
does not. I tried another patch which patched my 2.4.18 kernel
but all my connections fail to make it to my server.  I woudl love to
talk to at least one person who HAS gotten this to work.
 



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


iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 1723 -j DNAT --to
10.1.1.15

iptables -t nat -A PREROUTING -i ppp0 -p 47 -j DNAT --to 10.1.1.15

  


------=_NextPart_000_000E_01C22686.EDA5BB90
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff face=3DArial size=3D2><SPAN =
class=3D423025220-08072002>I've=20
been trying to get this to work. with no luck. I've used the POM module =
which=20
fails everytime I try to patch my kernel 2.4.4 and =
up</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3DArial size=3D2><SPAN =
class=3D423025220-08072002>no=20
luck even on a freshly downloaded kernel. other patches work but pptp =
does not.=20
I tried another patch which patched my 2.4.18 kernel</SPAN></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3DArial size=3D2><SPAN =
class=3D423025220-08072002>but=20
all my connections fail to make it to my server.&nbsp; I woudl love to =
talk to=20
at least one person who HAS gotten this to work.</SPAN></FONT></DIV>
<DIV>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"BORDER-LEFT: #0000ff 2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: =
0px; PADDING-LEFT: 5px">
  <DIV align=3Dleft class=3DOutlookMessageHeader dir=3Dltr =
lang=3Den-us><FONT=20
  face=3DTahoma size=3D2><BR></FONT></DIV>
  <DIV><SPAN class=3D567511319-08072002><FONT color=3D#0000ff =
face=3DArial size=3D2>Are=20
  you using the POM ip_conntrack_pptp module (or compiled into=20
  kernel)?</FONT></SPAN></DIV>
  <DIV><SPAN class=3D567511319-08072002><FONT color=3D#0000ff =
face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D567511319-08072002><FONT color=3D#0000ff =
face=3DArial size=3D2>I am=20
  fairly sure that NAT of any type 'breaks' PPTP connections, and the =
above=20
  module is needed for you to NAT the PPTP =
connections...</FONT></SPAN></DIV>
  <BLOCKQUOTE dir=3Dltr=20
  style=3D"BORDER-LEFT: #0000ff 2px solid; MARGIN-LEFT: 5px; =
MARGIN-RIGHT: 0px; PADDING-LEFT: 5px">
    <DIV></DIV>
    <DIV align=3Dleft class=3DOutlookMessageHeader dir=3Dltr =
lang=3Den-us><FONT=20
    face=3DTahoma size=3D2>-----Original Message-----<BR><B>From:</B>=20
    netfilter-admin@lists.samba.org =
[mailto:netfilter-admin@lists.samba.org]=20
    <B>On Behalf Of </B>Marc Riddle<BR><B>Sent:</B> Monday, July 08, =
2002 2:17=20
    PM<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> PPTP =
through=20
    masquerading gateway<BR><BR></FONT></DIV>
    <DIV><PRE>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 1723 -j DNAT --to =
10.1.1.15
iptables -t nat -A PREROUTING -i ppp0 -p 47 -j DNAT --to 10.1.1.15
<FONT color=3D#0000ff face=3DArial size=3D2><SPAN =
class=3D423025220-08072002>&nbsp;</SPAN></FONT><FONT color=3D#0000ff =
face=3DArial size=3D2><SPAN =
class=3D423025220-08072002>&nbsp;</SPAN></FONT></PRE></DIV></BLOCKQUOTE><=
/BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_000E_01C22686.EDA5BB90--


