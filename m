From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Snuffing out hackers
Date: Wed, 16 Jul 2003 13:21:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DF7@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C34BD7.E6BB5D6E"
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
To: "Aldo S. Lagana" <alagana@discmail.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C34BD7.E6BB5D6E
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am on Shaw, but none of these addresses are used for anything to do
with my network.

=20

I am doing some pretty anal filtering, but then again, I may be missing
something pretty obvious. I have rp_filter at 2 and source routing
disabled.

=20

PS: I am getting MANY of these packets. These packets are not getting
through to their targets, but if someone is persistent enough to keep
trying, I assume they must be able to do something malicious.

=20

-----Original Message-----
From: Aldo S. Lagana [mailto:alagana@discmail.com]=20
Sent: Wednesday, July 16, 2003 12:32 PM
To: Daniel Chemko; netfilter@lists.netfilter.org
Subject: RE: Snuffing out hackers

=20

Both IP addresses are assigned to cable ISPs...

=20

Name:    h24-87-243-251.vc.shawcable.net

Address:  24.87.243.251

=20

Name:    d57-108-11.home.cgocable.net

Address:  24.57.108.11

=20

Not sure if either of them are your ISP?  But I would contact both ISPs
with your log data if you really cared.  Are you running squid?  A
webserver?

=20

  _____ =20

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Daniel Chemko
Sent: Wednesday, July 16, 2003 2:58 PM
To: netfilter@lists.netfilter.org

=20

I am getting some disturbing packet traffic hitting my firewall. Here
goes:

=20

IN=3Deth4 OUT=3Deth5 SRC=3D24.87.243.251 DST=3D24.57.108.11 LEN=3D76 =
TOS=3D0x00
PREC=3D0xC0 TTL=3D25

4 ID=3D17431 PROTO=3DICMP TYPE=3D3 CODE=3D3 [SRC=3D24.57.108.11 =
DST=3D24.87.243.251
LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D117 ID=3D15860 DF PROTO=3DTCP =
SPT=3D

3161 DPT=3D80 WINDOW=3D16384 RES=3D0x00 SYN URGP=3D0 ]

=20

None of the addresses listed in the packets are from my networks, but
what is more disturbing is that eth4 is my internal network interface.
Can anyone see (baring an internal intrusion has occurred) how this can
happen?

=20

It definitely appears to be an exploit on my configuration or something.

=20

=20


------_=_NextPart_001_01C34BD7.E6BB5D6E
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
h1
	{margin-top:12.0pt;
	margin-right:0in;
	margin-bottom:3.0pt;
	margin-left:0in;
	page-break-after:avoid;
	font-size:16.0pt;
	font-family:Arial;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.emailstyle17
	{font-family:Arial;
	color:windowtext;}
span.emailstyle19
	{font-family:Arial;
	color:navy;}
span.EmailStyle190
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
10.0pt;font-family:Arial;color:navy'>I am on Shaw, but none of these =
addresses
are used for anything to do with my network.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>I am doing some pretty anal =
filtering, but
then again, I may be missing something pretty obvious. I have rp_filter =
at 2
and source routing disabled.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>PS: I am getting MANY of these =
packets. These
packets are not getting through to their targets, but if someone is =
persistent
enough to keep trying, I assume they must be able to do something =
malicious.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Aldo S. Lagana
[mailto:alagana@discmail.com] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Wednesday, July 16, =
2003
12:32 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> Daniel Chemko;
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> RE: Snuffing out =
hackers</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>Both IP =
addresses are
assigned to cable ISPs&#8230;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>&nbsp;</span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>Name:&nbsp;&nbsp;=
&nbsp;
h24-87-243-251.vc.shawcable.net</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>Address:&nbsp;
24.87.243.251</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>&nbsp;</span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>Name:&nbsp;&nbsp;=
&nbsp;
d57-108-11.home.cgocable.net</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>Address:&nbsp;
24.57.108.11</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>&nbsp;</span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>Not sure if =
either of
them are your ISP?&nbsp; But I would contact both ISPs with your log =
data if
you really cared.&nbsp; Are you running squid?&nbsp; A =
webserver?</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>&nbsp;</span></fo=
nt></p>

<div>

<div class=3DMsoNormal align=3Dcenter =
style=3D'margin-left:.5in;text-align:center'><font
size=3D3 face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter>

</span></font></div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma;font-weight:bold'>From:</spa=
n></font></b><font
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>
netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] <b><span =
style=3D'font-weight:bold'>On
Behalf Of </span></b>Daniel Chemko<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Wednesday, July 16, =
2003
2:58 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org</span></font></p>

</div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>I am getting some =
disturbing packet
traffic hitting my firewall. Here goes:</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>IN=3Deth4 OUT=3Deth5 =
SRC=3D24.87.243.251
DST=3D24.57.108.11 LEN=3D76 TOS=3D0x00 PREC=3D0xC0 =
TTL=3D25</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>4 ID=3D17431 PROTO=3DICMP =
TYPE=3D3 CODE=3D3
[SRC=3D24.57.108.11 DST=3D24.87.243.251 LEN=3D48 TOS=3D0x00 PREC=3D0x00 =
TTL=3D117 ID=3D15860
DF PROTO=3DTCP SPT=3D</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>3161 DPT=3D80 =
WINDOW=3D16384 RES=3D0x00
SYN URGP=3D0 ]</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>None of the addresses =
listed in the
packets are from my networks, but what is more disturbing is that eth4 =
is my
internal network interface. Can anyone see (baring an internal intrusion =
has
occurred) how this can happen?</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>It definitely appears to be =
an
exploit on my configuration or something.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C34BD7.E6BB5D6E--

