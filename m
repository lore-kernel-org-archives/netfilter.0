From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: I need help , please
Date: Fri, 5 Jul 2002 09:49:10 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA238@JUPITER>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C223B5.64EB2520"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: 'david' <david@aid.inf.cu>, "jesse.linux" <jdelima@inq7.net>
Cc: netfilter@lists.samba.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C223B5.64EB2520
Content-Type: text/plain;
	charset="iso-8859-1"

Check using `lsmod` that ipchains isn't loaded. RedHat starts BOTH ipchains
and iptables in the setup so of course ipchains starts first and then
iptables gives errors..
 
rmmod ipchains
/etc/init.d/iptables restart
 

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au <http://www.citadelcomputer.com.au/> 

-----Original Message-----
From: david [mailto:david@aid.inf.cu]
Sent: Thursday, 04 July 2002 6:39 PM
To: jesse.linux
Cc: netfilter@lists.samba.org
Subject: Re: I need help , please


It was a mistake.What I do is
 
# service iptables save
after that  I got a new file in /etc/sysconfig/iptables .
and then :
#/etc/rc.d/init.d/iptables restart 2>salida8
.And here you see all the errors.
 
david
 
 
 
 
 

----- Original Message ----- 
From: jesse.linux <mailto:jdelima@inq7.net>  
To: david@aid.inf.cu <mailto:david@aid.inf.cu>  
Sent: Thursday, July 04, 2002 8:13 AM
Subject: RE: I need help , please

if u want to use iptables, why did u restart ipchains?...
 
pls give more info...
 
From: "david" < david@aid.inf.cu <mailto:david@aid.inf.cu> >
To: < netfilter@lists.samba.org <mailto:netfilter@lists.samba.org> >
Subject:  I need help , please
Date: Wed, 3 Jul 2002 08:47:57 +0200

This is a multi-part message in MIME format.

------=_NextPart_000_0053_01C2226E.542764D0
Content-Type: multipart/alternative;
boundary="----=_NextPart_001_0054_01C2226E.542764D0"


------=_NextPart_001_0054_01C2226E.542764D0
Content-Type: text/plain;
charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi:
=20
I have been using ipchains for a long time , but know i want to turn to =
iptables.
I have a script file in /etc/rc.d/init.d/iptables

What I do is :

# service iptables save
=20
after that  I got a new file in /etc/sysconfig/iptables .
and then :

#/etc/rc.d/init.d/ipchains restart
=20
First I got a lot of errrors and  it does not seem to apply my rules, =
because if for example ,I comment (#) the rules for http client , it =
allow me to get the web anyway.


------_=_NextPart_001_01C223B5.64EB2520
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D624244823-04072002><FONT face=3DArial =
color=3D#0000ff size=3D2>Check=20
using `lsmod` that ipchains isn't loaded. RedHat starts BOTH ipchains =
and=20
iptables in the setup so of course ipchains starts first and then =
iptables gives=20
errors..</FONT></SPAN></DIV>
<DIV><SPAN class=3D624244823-04072002><FONT face=3DArial =
color=3D#0000ff=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D624244823-04072002><FONT face=3DArial =
color=3D#0000ff size=3D2>rmmod=20
ipchains</FONT></SPAN></DIV>
<DIV><SPAN class=3D624244823-04072002><FONT face=3DArial =
color=3D#0000ff=20
size=3D2>/etc/init.d/iptables restart</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<P><FONT size=3D2>thanks,<BR>George Vieira<BR>Systems =
Manager<BR>Citadel Computer=20
Systems P/L<BR><A href=3D"http://www.citadelcomputer.com.au/"=20
target=3D_blank>http://www.citadelcomputer.com.au</A></FONT></P>
<DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
size=3D2>-----Original Message-----<BR><B>From:</B> david=20
[mailto:david@aid.inf.cu]<BR><B>Sent:</B> Thursday, 04 July 2002 6:39=20
PM<BR><B>To:</B> jesse.linux<BR><B>Cc:</B>=20
netfilter@lists.samba.org<BR><B>Subject:</B> Re: I need help ,=20
please<BR><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>It was a mistake.What I do =
is</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># service iptables save<BR>after =
that&nbsp; I got a=20
new file in /etc/sysconfig/iptables .<BR>and then=20
:<BR>#/etc/rc.d/init.d/iptables restart 2&gt;salida8<BR></FONT><FONT =
face=3DArial=20
size=3D2>.And here you see all the errors.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>david</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Djdelima@inq7.net =
href=3D"mailto:jdelima@inq7.net">jesse.linux</A>=20
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Ddavid@aid.inf.cu=20
  href=3D"mailto:david@aid.inf.cu">david@aid.inf.cu</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Thursday, July 04, 2002 =
8:13=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: I need help , =
please</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>if u want to use iptables, why did u =
restart=20
  ipchains?...</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>pls give more info...</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV>From: "david" &lt;<A=20
  href=3D"mailto:david@aid.inf.cu">david@aid.inf.cu</A>&gt;<BR>To: =
&lt;<A=20
  =
href=3D"mailto:netfilter@lists.samba.org">netfilter@lists.samba.org</A>&=
gt;<BR>Subject:&nbsp;=20
  I need help , please<BR>Date: Wed, 3 Jul 2002 08:47:57 =
+0200<BR><BR>This is a=20
  multi-part message in MIME=20
  =
format.<BR><BR>------=3D_NextPart_000_0053_01C2226E.542764D0<BR>Content-=
Type:=20
  =
multipart/alternative;<BR>boundary=3D"----=3D_NextPart_001_0054_01C2226E=
.542764D0"<BR><BR><BR>------=3D_NextPart_001_0054_01C2226E.542764D0<BR>=
Content-Type:=20
  text/plain;<BR>charset=3D"iso-8859-1"<BR>Content-Transfer-Encoding:=20
  quoted-printable<BR><BR>Hi:<BR>=3D20<BR>I have been using ipchains =
for a long=20
  time , but know i want to turn to =3D<BR>iptables.<BR>I have a script =
file in=20
  /etc/rc.d/init.d/iptables<BR><BR>What I do is :<BR><BR># service =
iptables=20
  save<BR>=3D20<BR>after that&nbsp; I got a new file in =
/etc/sysconfig/iptables=20
  .<BR>and then :<BR><BR>#/etc/rc.d/init.d/ipchains =
restart<BR>=3D20<BR>First I=20
  got a lot of errrors and&nbsp; it does not seem to apply my rules,=20
  =3D<BR>because if for example ,I comment (#) the rules for http =
client , it=20
  =3D<BR>allow me to get the web =
anyway.<A></A></DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C223B5.64EB2520--

