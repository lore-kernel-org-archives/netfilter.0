From: "Michael Johansen" <michael@techmo.co.nz>
Subject: RE: vpn support for 2.4.18 and up
Date: Fri, 21 Jun 2002 19:36:12 +1200
Sender: netfilter-admin@lists.samba.org
Message-ID: <D90F507CEA84634EA750920250FF5442084BDD@aklnsp01.nsp.co.nz>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C218F6.517A5E21"
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C218F6.517A5E21
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The openssl-2.4.16 kernel patch works fine for the late 2.4.x kernels =
with a very minor code change.=20
It works with 2.4.16, 2.4.17, 2.4.18 - even those kernels with various =
other patches applied
The trick is in this line:
=20
+#if LINUX_VERSION_CODE >=3D VERSION(2,1,4)
=20
which is here: linux-2.4.16-openssl-0.9.6b-mppe.patch: unmodified: line =
992 of 3152 [31%]

change that line to read:


+#if LINUX_VERSION_CODE >=3D VERSION(2,18,4)
=20
save the patch, then patch your kernel with cd /usr/src/linux && patch =
-p1 < ../linux-2.4.16-openssl-0.9.6b-mppe.patch
=20
then set up your ppp modules, compile and install the kernel and it =
should all work
=20
of course, you will need the ppp-2.4.1 source and the patches for m$ =
128bit encryption =20
=20
=20
Get the patch here:
http://www.planetmirror.com/pub/mppe/linux-2.4.16-openssl-0.9.6b-mppe.pat=
ch.gz

-----Original Message-----
From: Rowan Reid [mailto:rreid@studio3arc.com]
Sent: Friday, 21 June 2002 11:48 a.m.
To: netfilter@lists.samba.org
Subject: vpn support for 2.4.18 and up=20


=20
=20
I am trying to set up a firewall supporting VPn traffic. Initially my =
thoughts were to get the most up to date kernel 2.4.8 patch it and
set up my firewall. Then i realized in order to support vpn the vpn =
patch only goes up to 2.4.17 (would be nice to find 2.4.18) now I
have to find a 2.4.17 kernel, applie the appropriate iptables patch then =
the appropriate pptp filtering patch.
=20
my questions are
=20
1.) Does anyone know of a pptp filtering patch for 2.4.18 kernels or =
there after.
2.) know what is the latest/stable iptables patch that is compatable =
with 2.4.17 or 2.4.18 kernel
3.) Is there an easier way to build a Firewall that supports pptp
=20
I'm running SuSE8.0 can someone suggest a better distru that will be a =
good firewall and works well with iptables and supports vpn
=20
=20
=20
=20
=20
   <ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html> =
ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html=20
=20
=20
Rowan Reid
Job Captain,=20
Systems Administrator
STUDIO 3 ARCHITECTS
909  982  1717
=20


------_=_NextPart_001_01C218F6.517A5E21
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2>The=20
openssl-2.4.16 kernel patch works fine for the late 2.4.x kernels with a =
very=20
minor code change. </FONT></SPAN></DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2>It=20
works with 2.4.16, 2.4.17, 2.4.18 - even those kernels with various =
other=20
patches applied</FONT></SPAN></DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2>The=20
trick is in this line:</FONT></SPAN></DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2>+#if=20
LINUX_VERSION_CODE &gt;=3D VERSION(2,1,4)</FONT></SPAN></DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2>which=20
is here: linux-2.4.16-openssl-0.9.6b-mppe.patch: unmodified: line 992 of =
3152=20
[31%]<BR></FONT></SPAN></DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2>change=20
that line to read:</FONT></SPAN></DIV>
<DIV><SPAN class=3D076392307-21062002><BR>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2>+#if=20
LINUX_VERSION_CODE &gt;=3D VERSION(2,18,4)</FONT></SPAN></DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2>save=20
the patch, then patch your kernel with cd /usr/src/linux &amp;&amp; =
patch -p1=20
&lt; ../linux-2.4.16-openssl-0.9.6b-mppe.patch</FONT></SPAN></DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2>then=20
set up your ppp modules, compile and install the kernel and it should =
all=20
work</FONT></SPAN></DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial><FONT =
color=3D#0000ff><FONT=20
size=3D2>of course, you will need the ppp-2.4.1 source and the patches =
for m$=20
128bit encrypti<SPAN class=3D644263507-21062002>on&nbsp;</SPAN><SPAN=20
class=3D644263507-21062002>&nbsp;</SPAN></FONT></FONT></FONT></SPAN></DIV=
>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV></DIV></SPAN>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2>Get=20
the patch here:</FONT></SPAN></DIV>
<DIV><SPAN class=3D076392307-21062002><FONT face=3DArial color=3D#0000ff =
size=3D2><A=20
href=3D"http://www.planetmirror.com/pub/mppe/linux-2.4.16-openssl-0.9.6b-=
mppe.patch.gz">http://www.planetmirror.com/pub/mppe/linux-2.4.16-openssl-=
0.9.6b-mppe.patch.gz</A></FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Rowan Reid=20
  [mailto:rreid@studio3arc.com]<BR><B>Sent:</B> Friday, 21 June 2002 =
11:48=20
  a.m.<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> vpn =
support=20
  for 2.4.18 and up <BR><BR></FONT></DIV>
  <DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D099483923-20062002>I am =
trying to set=20
  up a firewall supporting VPn traffic. Initially my thoughts were to =
get the=20
  most up to date kernel 2.4.8 patch it and</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D099483923-20062002>set =
up my=20
  firewall. Then i realized in order to support vpn the vpn patch only =
goes up=20
  to 2.4.17 (would be nice to find 2.4.18) now I</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D099483923-20062002>have =
to find a=20
  2.4.17 kernel, applie the appropriate iptables patch then the =
appropriate pptp=20
  filtering patch.</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN=20
  class=3D099483923-20062002></SPAN></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D099483923-20062002>my =
questions=20
  are</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN=20
  class=3D099483923-20062002></SPAN></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D099483923-20062002>1.) =
Does anyone=20
  know of a pptp filtering patch for 2.4.18 kernels or there=20
  after.</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D099483923-20062002>2.) =
know what is=20
  the latest/stable iptables patch that is compatable with 2.4.17 or =
2.4.18=20
  kernel</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D099483923-20062002>3.) =
Is there an=20
  easier way to build a Firewall that supports pptp</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN=20
  class=3D099483923-20062002></SPAN></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D099483923-20062002>I'm =
running=20
  SuSE8.0 can someone suggest a better distru that will be a good =
firewall and=20
  works well with iptables and supports vpn</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN=20
  class=3D099483923-20062002></SPAN></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV align=3Dleft>
  <DIV><SPAN class=3D936194817-06022002></SPAN><FONT face=3DArial=20
  size=3D2>&nbsp;</FONT><A=20
  =
href=3D"ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html">=
<FONT=20
  face=3DArial=20
  =
size=3D2>ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html<=
/FONT></A><FONT=20
  face=3DArial><FONT face=3DArial><SPAN =
class=3D936194817-06022002></SPAN></FONT><FONT=20
  size=3D2>&nbsp;</FONT></FONT></DIV>
  <DIV><FONT face=3DArial></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial><FONT color=3D#0000ff=20
  size=3D2></FONT>&nbsp;</DIV></DIV></DIV>
  <DIV align=3Dleft>
  <DIV><FONT face=3DArial size=3D2><SPAN =
class=3D936194817-06022002>Rowan=20
  Reid</SPAN></FONT></DIV>
  <DIV><FONT face=3D"Bookman Old Style" size=3D2><SPAN =
class=3D936194817-06022002>Job=20
  Captain, </SPAN></FONT></DIV>
  <DIV><FONT face=3D"Bookman Old Style" size=3D2><SPAN=20
  class=3D936194817-06022002>Systems Administrator</SPAN></FONT></DIV>
  <DIV><FONT face=3D"Bookman Old Style" size=3D2><SPAN=20
  class=3D936194817-06022002>STUDIO 3 ARCHITECTS</SPAN></FONT></DIV>
  <DIV><SPAN class=3D936194817-06022002></SPAN><FONT face=3D"Bookman Old =
Style"=20
  size=3D2><SPAN class=3D936194817-06022002>909&nbsp; 982&nbsp;=20
  1717</SPAN></FONT></DIV></FONT></DIV>
  <DIV>&nbsp;</DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C218F6.517A5E21--

