From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: Snuffing out hackers
Date: Wed, 16 Jul 2003 11:58:28 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DF6@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C34BCC.3E1AF0FC"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C34BCC.3E1AF0FC
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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


------_=_NextPart_001_01C34BCC.3E1AF0FC
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

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I am getting some disturbing packet traffic hitting =
my
firewall. Here goes:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>IN=3Deth4 OUT=3Deth5 SRC=3D24.87.243.251 =
DST=3D24.57.108.11 LEN=3D76
TOS=3D0x00 PREC=3D0xC0 TTL=3D25</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>4 ID=3D17431 PROTO=3DICMP TYPE=3D3 CODE=3D3 =
[SRC=3D24.57.108.11
DST=3D24.87.243.251 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D117 ID=3D15860 =
DF PROTO=3DTCP SPT=3D</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>3161 DPT=3D80 WINDOW=3D16384 RES=3D0x00 SYN URGP=3D0 =
]</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>None of the addresses listed in the packets are from =
my
networks, but what is more disturbing is that eth4 is my internal =
network
interface. Can anyone see (baring an internal intrusion has occurred) =
how this
can happen?</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>It definitely appears to be an exploit on my =
configuration
or something.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C34BCC.3E1AF0FC--

