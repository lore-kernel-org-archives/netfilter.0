From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: What is the protocol number of NETBIOS over IEEE 802.2 ethernet?
Date: Mon, 14 Jun 2004 16:57:44 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c451ed$a84bb790$1d01a8c0@palettemm.com>
Reply-To: <bassam@palettemm.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C45230.B66EF790"
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

------=_NextPart_000_0001_01C45230.B66EF790
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Guys,
   I am trying to DNAT the netbios broadcast traffic (03:00:00:00:00:01)
over IEEE 802.2 ethernet. So is there any number for this protocol so I
can use it with my iptables rule?
=20
Note: I am asking for netbios protocol over IEEE 802.2 ethernet and not
over Ethernet II
=20
For example:
=20
iptables =96t nat =96A PREROUTING -i eth1 =96p netbios =96j DNAT =
=96to-destination
192.168.1.231
=20
Thanks for your help
=20
Bassam

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.516 / Virus Database: 313 - Release Date: 9/1/2003
=20

------=_NextPart_000_0001_01C45230.B66EF790
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
<link rel=3DFile-List href=3D"cid:filelist.xml@01C45230.B5C6D0B0">
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
font-family:Arial'>Hi Guys,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span style=3D'mso-spacerun:yes'>&nbsp;&nbsp; =
</span>I am
trying to </span></font><st1:stockticker><font size=3D2 =
face=3DArial><span
 =
style=3D'font-size:10.0pt;font-family:Arial'>DNA</span></font></st1:stock=
ticker><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>T the <span
class=3DSpellE>netbios</span> broadcast traffic (</span></font><st1:time =
Hour=3D"15"
Minute=3D"0"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:
 Arial'>03:00:00:00:00:01</span></font></st1:time><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>) over =
</span></font><st1:stockticker><font
 size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>IEE</span></font></st1:stock=
ticker><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>E 802.2 <span
class=3DSpellE>ethernet</span>. So is there any number for this protocol =
so I can
use it with my <span class=3DSpellE>iptables</span> =
rule?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Note: I am asking for <span =
class=3DSpellE>netbios</span>
protocol over </span></font><st1:stockticker><font size=3D2 =
face=3DArial><span
 =
style=3D'font-size:10.0pt;font-family:Arial'>IEE</span></font></st1:stock=
ticker><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>E 802.2 <span
class=3DSpellE>ethernet</span> and not over Ethernet =
II<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>For example:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> =96t <span
class=3DSpellE>nat</span> =96A PREROUTING -<span class=3DSpellE>i</span> =
eth1 =96p
<span class=3DSpellE>netbios</span> =96j =
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
font-family:Arial'>Thanks for your help<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Bassam</span></font></span><=
font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

</body>

</html>
<BR>

<P><FONT SIZE=3D2>---<BR>
Outgoing mail is certified Virus Free.<BR>
Checked by AVG anti-virus system (http://www.grisoft.com).<BR>
Version: 6.0.516 / Virus Database: 313 - Release Date: 9/1/2003<BR>
</FONT> </P>

------=_NextPart_000_0001_01C45230.B66EF790--


