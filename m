From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: How to DNAT the only NetBios broadcast traffic (03:00:00:00:00:01)??
Date: Mon, 14 Jun 2004 12:08:23 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c451c5$3c734150$1d01a8c0@palettemm.com>
Reply-To: <bassam@palettemm.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001C_01C45208.4A968150"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_001C_01C45208.4A968150
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Dear All,
   I am implementing a Linux box gateway that lunch my own firewall (I
wrote my own iptables rules). The gateway connects two LANs, LAN1:
192.168.1.0/24 and LAN2: 192.168.0.0/24. LAN1 contains a windows 2000
server domain controller IP: 192.168.1.231 and LAN2 contains my clients
based on windows xp.
=20
In fact I got stuck on how to forward ONLY and ONLY the NETBIOS
broadcast traffic (03:00:00:00:00:01) from any machine on LAN2 to the
domain controller on LAN1. Take note that the NETBIOS traffic is carried
on IEEE 802.3 Ethernet.
=20
I wrote the following iptable rule, but here all the traffic will be
directed from LAN2 to the domain controller on LAN1
Iptables =96t nat =96A PREROUTING =96I eth1 =96j DNAT =96to-destination
192.168.1.231
=20
So can anybody help me on how can I forward the traffic with destination
MAC address 03:00:00:00:00:01 from LAN2 to the domain controller
(192.168.1.231) on LAN1?
=20
Thanks for your support
=20
Regards
Bassam
=20
=20

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.516 / Virus Database: 313 - Release Date: 9/1/2003
=20

------=_NextPart_000_001C_01C45208.4A968150
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C45208.4A2B8A80">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"time"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"stockticker"/>
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:ApplyBreakingRules/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;
	text-underline:single;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Dear All,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span style=3D'mso-spacerun:yes'>&nbsp;&nbsp; =
</span>I am
implementing a Linux box gateway that lunch my own firewall (I wrote my =
own <span
class=3DSpellE>iptables</span> rules). The gateway connects two LANs, =
LAN1:
192.168.1.0/24 and LAN2: 192.168.0.0/24. LAN1 contains a windows 2000 =
server domain
controller IP: 192.168.1.231 and LAN2 contains my clients based on =
windows <span
class=3DSpellE>xp</span>.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>In fact I got stuck on how to forward ONLY and ONLY =
the
NETBIOS broadcast traffic (</span></font><st1:time Hour=3D"15" =
Minute=3D"0"><font
 size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>03:00:00:00:00:01</span></fo=
nt></st1:time><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>) from any
machine on LAN2 to the domain controller on LAN1. Take note that the =
NE</span></font><st1:stockticker><font
 size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>TBIO</span></font></st1:stoc=
kticker><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>S traffic is
carried on IEEE 802.3 Ethernet.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I wrote the following <span =
class=3DSpellE>iptable</span>
rule, but here all the traffic will be directed from LAN2 to the domain
controller on LAN1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Iptables</span></font></span=
><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> =96t <span
class=3DSpellE>nat</span> =96A PREROUTING =96I eth1 =96j =
</span></font><st1:stockticker><font
 size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>DNA</span></font></st1:stock=
ticker><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>T =96to-destination
192.168.1.231<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>So can anybody help me on how can I forward the =
traffic with
destination MAC address </span></font><st1:time Hour=3D"15" =
Minute=3D"0"><font
 size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>03:00:00:00:00:01</span></fo=
nt></st1:time><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> from LAN2
to the domain controller (192.168.1.231) on =
LAN1?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks for your support<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Regards<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Bassam</span></font></span><=
font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>&nbsp;</span><o:p></o:p></span></font></p>

</div>

</body>

</html>
<BR>

<P><FONT SIZE=3D2>---<BR>
Outgoing mail is certified Virus Free.<BR>
Checked by AVG anti-virus system (http://www.grisoft.com).<BR>
Version: 6.0.516 / Virus Database: 313 - Release Date: 9/1/2003<BR>
</FONT> </P>

------=_NextPart_000_001C_01C45208.4A968150--


