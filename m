From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Quick Question
Date: Thu, 13 Jun 2002 13:37:40 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <018701c21301$04655500$c764a8c0@aldoxp>
References: <AIEOIGGABAHAAIOAILIDCEDECGAA.matlas@vistainnovation.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0188_01C212DF.7D53B500"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <AIEOIGGABAHAAIOAILIDCEDECGAA.matlas@vistainnovation.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: 'Mike Atlas' <matlas@vistainnovation.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0188_01C212DF.7D53B500
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

It is fairly easy - 
 
The redirect to squid is done in the PREROUTING chain and
SNAT is done in POSTROUTING...
 
so if it is port 80 it will get picked up first, otherwise it will be
SNAT'ted in the POSTROUTING chain:
 
iptables -t nat -A PREROUTING -i $INTERNAL_INTERFACE -p tcp --dport 80
-j REDIRECT --to-port 3128
 
iptables -t nat -A POSTROUTING -o $INTERNET_INTERFACE -j SNAT
--to-source $INTERNET_IP


-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of Mike Atlas
Sent: Thursday, May 30, 2002 4:10 PM
To: netfilter@lists.samba.org
Subject: Quick Question


Hello Everyone. I hope you all can help me, I'm sure you can (it seems
like a pretty simple problem).
 
I am setting up a Squid proxy server to run in transparent mode. To do
this, I need to forward all port 80 and 443 traffic to squids' port,
3128. Additionally, I would like all other traffic on all other ports to
forward on to the router. 
 
I have found a script to forward port 80 to squid (note: eth1 is my
internal interface, eth0 is external):
 
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT
--to-port 3128
 
I assume I can run the same line for 443:
 
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 443 -j REDIRECT
--to-port 3128
 
 
However, what can I use to forward EVERYTHING that is not port 80 out of
the eth0 interface, to our router (192.168.0.2)?
I know it has something to do with --dport ! 80, but I can't figure it
out.
 
Thanks for your help.
BTW, this is RedHat 72. if that makes any difference. Linux kernel
2.4.9-31.
 
-mike

______________________________________________
Mike Atlas                          703.385.8362(v)
Senior System Engineer    703.385.3674(f)
Vista Innovation                www.vistainnovation.com 

 


------=_NextPart_000_0188_01C212DF.7D53B500
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D199123017-13062002><FONT face=3DArial color=3D#0000ff =
size=3D2>It is=20
fairly easy - </FONT></SPAN></DIV>
<DIV><SPAN class=3D199123017-13062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D199123017-13062002><FONT face=3DArial color=3D#0000ff =
size=3D2>The=20
redirect to squid is done in the PREROUTING chain =
and</FONT></SPAN></DIV>
<DIV><SPAN class=3D199123017-13062002><FONT face=3DArial color=3D#0000ff =
size=3D2>SNAT=20
is done in POSTROUTING...</FONT></SPAN></DIV>
<DIV><SPAN class=3D199123017-13062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D199123017-13062002><FONT face=3DArial color=3D#0000ff =
size=3D2>so if=20
it&nbsp;is port 80 it will get picked up first, otherwise it will be =
SNAT'ted in=20
the POSTROUTING chain:</FONT></SPAN></DIV>
<DIV><SPAN class=3D199123017-13062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D199123017-13062002><FONT face=3DArial color=3D#0000ff =

size=3D2>iptables -t nat -A PREROUTING -i $INTERNAL_INTERFACE -p tcp =
--dport 80 -j=20
REDIRECT --to-port 3128</FONT></SPAN></DIV>
<DIV><SPAN class=3D199123017-13062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D199123017-13062002><FONT face=3DArial color=3D#0000ff =

size=3D2>iptables -t nat -A POSTROUTING -o $INTERNET_INTERFACE -j SNAT =
--to-source=20
$INTERNET_IP<BR></FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2>-----Original Message-----<BR><B>From:</B>=20
  netfilter-admin@lists.samba.org =
[mailto:netfilter-admin@lists.samba.org] <B>On=20
  Behalf Of </B>Mike Atlas<BR><B>Sent:</B> Thursday, May 30, 2002 4:10=20
  PM<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> Quick=20
  Question<BR><BR></FONT></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2>Hello Everyone. I=20
  hope you all can help me, I'm sure you can (it seems like a pretty =
simple=20
  problem).</FONT></SPAN></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2>I am =
setting up a=20
  Squid proxy server to run in transparent mode. To do this, I need to =
forward=20
  all port 80 and 443 traffic to squids' port, 3128. Additionally, I =
would like=20
  all other traffic on all other ports to forward on to the router.=20
  </FONT></SPAN></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2>I =
have found a=20
  script to forward port 80 to squid (note: eth1 is my internal =
interface, eth0=20
  is external):</FONT></SPAN></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2>iptables -t nat -A=20
  PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT --to-port=20
  3128</FONT></SPAN></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2>I =
assume I can run=20
  the same line for 443:</FONT></SPAN></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
  size=3D2></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
  class=3D316570420-30052002><FONT face=3DArial size=3D2>iptables -t nat =
-A PREROUTING=20
  -i eth1 -p tcp --dport&nbsp;443 -j REDIRECT --to-port=20
  3128</FONT></SPAN></FONT></SPAN></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
  class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
  class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
  class=3D316570420-30052002>However, what can I use to forward =
EVERYTHING that is=20
  not port 80 out of the eth0 interface, to our router=20
  (192.168.0.2)?</SPAN></FONT></SPAN></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
  class=3D316570420-30052002>I know it has something to do with --dport =
! 80, but=20
  I can't figure it out.</SPAN></FONT></SPAN></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
  class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
  class=3D316570420-30052002>Thanks for your =
help.</SPAN></FONT></SPAN></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
  class=3D316570420-30052002>BTW, this is RedHat 72. if that makes any =
difference.=20
  Linux kernel 2.4.9-31.</SPAN></FONT></SPAN></DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
  class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
  <DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2><SPAN=20
  class=3D316570420-30052002>-mike</SPAN></FONT></SPAN></DIV>
  <P><FONT =
size=3D2>______________________________________________<BR>Mike=20
  =
Atlas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
  703.385.8362(v)<BR>Senior System Engineer&nbsp;&nbsp;&nbsp;=20
  703.385.3674(f)<BR>Vista=20
  =
Innovation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  www.vistainnovation.com </FONT></P>
  <DIV>&nbsp;</DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0188_01C212DF.7D53B500--


