From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: PPTP through masquerading gateway
Date: Mon, 8 Jul 2002 17:06:33 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <001901c226c3$573f4e40$3864a8c0@discmail.com>
References: <000d01c226c1$9a049390$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001A_01C226A1.D02DAE40"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000d01c226c1$9a049390$6b01a8c0@s3ac>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: 'Rowan Reid' <rreid@studio3arc.com>, 'Marc Riddle' <mriddle@socal.rr.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_001A_01C226A1.D02DAE40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I am in the process of using that module to allow 'outgoing' from behind
a Linux firewall - which is a little different than your situation.  
 
I have gotten the POM module to patch cleanly against 2.4.16 with
iptables 1.2.5,  now I just need to get that test box out on the wire to
give it a go...
 
I'l let you know if my scenario works out...

-----Original Message-----
From: Rowan Reid [mailto:rreid@studio3arc.com] 
Sent: Monday, July 08, 2002 4:54 PM
To: 'Aldo S. Lagana'; 'Marc Riddle'; netfilter@lists.samba.org
Subject: RE: PPTP through masquerading gateway


 
 
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

  


------=_NextPart_000_001A_01C226A1.D02DAE40
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
<DIV><SPAN class=3D190300321-08072002><FONT face=3DArial color=3D#0000ff =
size=3D2>I am=20
in the process of using that module to allow 'outgoing' from behind a =
Linux=20
firewall - which is a little different than your situation.&nbsp;=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D190300321-08072002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D190300321-08072002><FONT face=3DArial color=3D#0000ff =
size=3D2>I have=20
gotten the POM module to patch cleanly against 2.4.16 with iptables =
1.2.5,&nbsp;=20
now I just need to get that test box out on the wire to give it a=20
go...</FONT></SPAN></DIV>
<DIV><SPAN class=3D190300321-08072002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D190300321-08072002><FONT face=3DArial color=3D#0000ff =
size=3D2>I'l=20
let you know if my scenario works out...</FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2>-----Original Message-----<BR><B>From:</B> =
Rowan Reid=20
  [mailto:rreid@studio3arc.com] <BR><B>Sent:</B> Monday, July 08, 2002 =
4:54=20
  PM<BR><B>To:</B> 'Aldo S. Lagana'; 'Marc Riddle';=20
  netfilter@lists.samba.org<BR><B>Subject:</B> RE: PPTP through =
masquerading=20
  gateway<BR><BR></FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D423025220-08072002>I've=20
  been trying to get this to work. with no luck. I've used the POM =
module which=20
  fails everytime I try to patch my kernel 2.4.4 and =
up</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D423025220-08072002>no=20
  luck even on a freshly downloaded kernel. other patches work but pptp =
does=20
  not. I tried another patch which patched my 2.4.18 =
kernel</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D423025220-08072002>but=20
  all my connections fail to make it to my server.&nbsp; I woudl love to =
talk to=20
  at least one person who HAS gotten this to work.</SPAN></FONT></DIV>
  <DIV>&nbsp;</DIV>
  <BLOCKQUOTE dir=3Dltr=20
  style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
    <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
    face=3DTahoma size=3D2><BR></FONT></DIV>
    <DIV><SPAN class=3D567511319-08072002><FONT face=3DArial =
color=3D#0000ff=20
    size=3D2>Are you using the POM ip_conntrack_pptp module (or compiled =
into=20
    kernel)?</FONT></SPAN></DIV>
    <DIV><SPAN class=3D567511319-08072002><FONT face=3DArial =
color=3D#0000ff=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D567511319-08072002><FONT face=3DArial =
color=3D#0000ff size=3D2>I=20
    am fairly sure that NAT of any type 'breaks' PPTP connections, and =
the above=20
    module is needed for you to NAT the PPTP =
connections...</FONT></SPAN></DIV>
    <BLOCKQUOTE dir=3Dltr=20
    style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff =
2px solid; MARGIN-RIGHT: 0px">
      <DIV></DIV>
      <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
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
<FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D423025220-08072002>&nbsp;</SPAN></FONT><FONT face=3DArial =
color=3D#0000ff size=3D2><SPAN =
class=3D423025220-08072002>&nbsp;</SPAN></FONT></PRE></DIV></BLOCKQUOTE><=
/BLOCKQUOTE></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_001A_01C226A1.D02DAE40--


