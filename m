From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: How to update IPTABLES from 1.2.7a to 1.2.8
Date: Tue, 15 Jul 2003 10:29:43 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DF4@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C34AF6.AD885921"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Mario E. Ries" <mario@imecogroup.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C34AF6.AD885921
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That is a patch file. Since you don't have the sources for 1.2.7a that
patch does nothing for you. Download the full 1.2.8 sources and build
them as you would for any other package under the sun.

=20

Requirements to build:

- You need the kernel sources for the kernel you are using

- Know where Redhat packaged everything and emulate that. EG.
SBIN_DIR=3D/sbin or something like that and LIB_DIR=3D/lib. Otherwise,
everything goes in /usr/local/* which may or may not be what you are
looking for

=20

-----Original Message-----
From: Mario E. Ries [mailto:mario@imecogroup.com]=20
Sent: Tuesday, July 15, 2003 10:07 AM
To: netfilter@lists.netfilter.org
Subject: How to update IPTABLES from 1.2.7a to 1.2.8

=20

I have looked on the Internet and I cannot find any documentation on how
to update my IPTABLES.  I run RedHat 9.0 with the 2.4.20-8 kernel.  I
downloaded the patch-iptables-1.2.7a-1.2.8.bz2 file and uncompressed it
to get a single file.  I don't know what to do with this file now that I
have it.  Please help if you can.

=20

Mario

=20


------_=_NextPart_001_01C34AF6.AD885921
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:PMingLiU;
	panose-1:2 2 3 0 0 0 0 0 0 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 2 3 0 0 0 0 0 0 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{font-family:Arial;
	color:windowtext;}
span.EmailStyle18
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>That is a patch file. Since you =
don&#8217;t
have the sources for 1.2.7a that patch does nothing for you. Download =
the full
1.2.8 sources and build them as you would for any other package under =
the sun.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Requirements to =
build:</span></font></p>

<p class=3DMsoNormal style=3D'text-indent:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>- You need the =
kernel
sources for the kernel you are using</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>- Know where =
Redhat packaged
everything and emulate that. EG. SBIN_DIR=3D/sbin or something like that =
and
LIB_DIR=3D/lib. Otherwise, everything goes in /usr/local/* which may or =
may not
be what you are looking for</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Mario E. Ries
[mailto:mario@imecogroup.com] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> </span></font><font =
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>Tuesday, July
 15, 2003</span></font><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'> </span></font><font size=3D2 face=3DTahoma><span
 style=3D'font-size:10.0pt;font-family:Tahoma'>10:07 =
AM</span></font><font
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'><br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> How to update =
IPTABLES
from 1.2.7a to 1.2.8</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>I have looked on the =
Internet and I
cannot find any documentation on how to update my IPTABLES.&nbsp; I run =
RedHat
9.0 with the 2.4.20-8 kernel.&nbsp; I downloaded the
patch-iptables-1.2.7a-1.2.8.bz2 file and uncompressed it to get a single
file.&nbsp; I don&#8217;t know what to do with this file now that I have
it.&nbsp; Please help if you can.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Mario</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C34AF6.AD885921--

