From: "Montreuil, Scott NALG-CA" <Scott.Montreuil@mytravel.ca>
Subject: iptables rules do not work
Date: Mon, 5 Apr 2004 11:51:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B1A93958FC04D311B0240008C7F9DD2416227399@nalgexc1.nalg>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C41B25.CC4A2E50"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C41B25.CC4A2E50
Content-Type: text/plain

Hello,
 
I have the exact same rules here for the exact same machine.
 
I can connect internal to this machine on the ports specified but the rules
are not working for the IMAP server, they work no problem for the SMTP
server.
 
ACCEPT     tcp  --  anywhere             10.10.10.2         tcp dpt:smtp
DNAT       tcp  --  anywhere             static-89-102.dsl.tht.nettcp
dpt:smtp to:10.10.10.2:25
DNAT       udp  --  anywhere             static-89-103.dsl.tht.netudp
dpt:smtp to:10.10.10.2:25
DNAT       tcp  --  anywhere             static-89-103.dsl.tht.nettcp
dpt:smtp to:10.10.10.2:25
SNAT       tcp  --  10.10.10.0/24        10.10.10.2         tcp dpt:smtp
to:10.10.10.1
 
ACCEPT     tcp  --  anywhere             10.10.10.2         tcp dpt:imap
DNAT       tcp  --  anywhere             static-89-102.dsl.tht.nettcp
dpt:imap to:10.10.10.2:143
DNAT       tcp  --  anywhere             static-89-103.dsl.tht.nettcp
dpt:imap to:10.10.10.2:143
DNAT       udp  --  anywhere             static-89-103.dsl.tht.netudp
dpt:imap to:10.10.10.2:143
SNAT       tcp  --  10.10.10.0/24        10.10.10.2         tcp dpt:imap
to:10.10.10.1
 
 
Any dieas why I can't connet to IMAP?
Scott Montreuil  Enterprise Systems Analyst
MyTravel Canada   <mailto:scott.montreuil@mytravel.ca>
scott.montreuil@mytravel.ca 
130 Merton Street Ph: (416) 485-1481x6612
Toronto ON, M4S 1A4     Fa: (416) 482-5909
 

------_=_NextPart_001_01C41B25.CC4A2E50
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C41B04.F26522F0">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PostalCode"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"State"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"country-region"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
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
  =
<w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEv=
ery>
  =
<w:DisplayVerticalDrawingGridEvery>0</w:DisplayVerticalDrawingGridEvery>=

  <w:UseMarginsForDrawingGridOrigin/>
  <w:Compatibility>
   <w:FootnoteLayoutLikeWW8/>
   <w:ShapeLayoutLikeWW8/>
   <w:AlignTablesRowByRow/>
   <w:ForgetLastTabAlignment/>
   <w:DoNotUseHTMLParagraphAutoSpacing/>
   <w:LayoutRawTableWidth/>
   <w:LayoutTableRowsApart/>
   <w:UseWord97LineBreakingRules/>
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
 /* Font Definitions */
 @font-face
	{font-family:"Century Gothic";
	panose-1:2 11 5 2 2 2 2 2 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:647 0 0 0 159 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
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
font-family:Arial'>Hello,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have the exact same rules here for the exact same =
machine.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I can connect internal to this machine on the ports
specified but the rules are not working for the IMAP server, they work =
no
problem for the SMTP server.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>ACCEPT<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span><span
class=3DSpellE><span class=3DGramE>tcp</span></span><span =
class=3DGramE><span
style=3D'mso-spacerun:yes'>&nbsp; </span>--</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>anywhere<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>10.10.10.2<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; </span><span
class=3DSpellE>tcp</span> <span =
class=3DSpellE>dpt:smtp</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>DNAT<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span
class=3DSpellE><span class=3DGramE>tcp</span></span><span =
class=3DGramE><span
style=3D'mso-spacerun:yes'>&nbsp; </span>--</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>anywhere<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>static-89-102.dsl.tht.nettcp <span =
class=3DSpellE>dpt:smtp</span>
to:10.10.10.2:25<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>DNAT<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span
class=3DSpellE><span class=3DGramE>udp</span></span><span =
class=3DGramE><span
style=3D'mso-spacerun:yes'>&nbsp; </span>--</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>anywhere<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>static-89-103.dsl.tht.netudp <span =
class=3DSpellE>dpt:smtp</span>
to:10.10.10.2:25<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>DNAT<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span
class=3DSpellE><span class=3DGramE>tcp</span></span><span =
class=3DGramE><span
style=3D'mso-spacerun:yes'>&nbsp; </span>--</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>anywhere<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>static-89-103.dsl.tht.nettcp <span =
class=3DSpellE>dpt:smtp</span>
to:10.10.10.2:25<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>SNAT<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span
class=3DSpellE><span class=3DGramE>tcp</span></span><span =
class=3DGramE><span
style=3D'mso-spacerun:yes'>&nbsp; </span>--</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>10.10.10.0/24<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>10.10.10.2<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; </span><span
class=3DSpellE>tcp</span> <span class=3DSpellE>dpt:smtp</span> =
to:10.10.10.1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>ACCEPT<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp; </span><span
class=3DSpellE><span class=3DGramE>tcp</span></span><span =
class=3DGramE><span
style=3D'mso-spacerun:yes'>&nbsp; </span>--</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>anywhere<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>10.10.10.2<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; </span><span
class=3DSpellE>tcp</span> <span =
class=3DSpellE>dpt:imap</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>DNAT<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span
class=3DSpellE><span class=3DGramE>tcp</span></span><span =
class=3DGramE><span
style=3D'mso-spacerun:yes'>&nbsp; </span>--</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>anywhere<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>static-89-102.dsl.tht.nettcp <span =
class=3DSpellE>dpt:imap</span>
to:10.10.10.2:143<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>DNAT<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span
class=3DSpellE><span class=3DGramE>tcp</span></span><span =
class=3DGramE><span
style=3D'mso-spacerun:yes'>&nbsp; </span>--</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>anywhere<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>static-89-103.dsl.tht.nettcp <span =
class=3DSpellE>dpt:imap</span>
to:10.10.10.2:143<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>DNAT<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span
class=3DSpellE><span class=3DGramE>udp</span></span><span =
class=3DGramE><span
style=3D'mso-spacerun:yes'>&nbsp; </span>--</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>anywhere<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>static-89-103.dsl.tht.netudp <span =
class=3DSpellE>dpt:imap</span>
to:10.10.10.2:143<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>SNAT<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span
class=3DSpellE><span class=3DGramE>tcp</span></span><span =
class=3DGramE><span
style=3D'mso-spacerun:yes'>&nbsp; </span>--</span><span =
style=3D'mso-spacerun:yes'>&nbsp;
</span>10.10.10.0/24<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>10.10.10.2<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; </span><span
class=3DSpellE>tcp</span> <span class=3DSpellE>dpt:imap</span> =
to:10.10.10.1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Any <span class=3DSpellE>dieas</span> why I can't =
<span
class=3DSpellE>connet</span> to IMAP?<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
mso-layout-grid-align:none'><em><b><i><font size=3D2 color=3D"#004080"
face=3D"Century Gothic"><span =
style=3D'font-size:10.0pt;font-family:"Century Gothic";
mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
mso-no-proof:yes'>Scott =
Montreuil&nbsp;&nbsp;</span></font></i></b></em><st1:City><st1:place><em=
><b><i><font
  color=3D"#004080" face=3D"Century Gothic"><span style=3D'font-family:"=
Century Gothic";
  mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
  =
mso-no-proof:yes'>Enterprise</span></font></i></b></em></st1:place></st1=
:City><em><b><i><font
color=3D"#004080" face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
mso-no-proof:yes'> Systems =
Analyst</span></font></i></b></em><b><i><font
color=3D"#004080" face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
font-style:italic;mso-no-proof:yes'><br>
<em><i><font face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
mso-bidi-font-family:"Century Gothic"'>MyTravel =
</span></font></i></em></span></font></i></b><st1:country-region><st1:pl=
ace><em><b><i><font
  color=3D"#004080" face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
  mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
  =
mso-no-proof:yes'>Canada</span></font></i></b></em></st1:place></st1:cou=
ntry-region><em><b><i><font
color=3D"#004080" face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
mso-no-proof:yes'>&nbsp;&nbsp;</span></font></i></b></em><em><b><i><font=

color=3Dnavy face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
mso-bidi-font-family:"Century =
Gothic";color:navy;font-weight:bold;mso-no-proof:
yes'><a href=3D"mailto:scott.montreuil@mytravel.ca"><font =
color=3D"#004080"><span
style=3D'color:#004080'>scott.montreuil@mytravel.ca</span></font></a></s=
pan></font></i></b></em><em><b><i><font
color=3D"#004080" face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
mso-no-proof:yes'>&nbsp;</span></font></i></b></em><b><i><font =
color=3D"#004080"
face=3D"Century Gothic"><span style=3D'font-family:"Century =
Gothic";mso-bidi-font-family:
"Century =
Gothic";color:#004080;font-weight:bold;font-style:italic;mso-no-proof:
yes'><br>
<em><i><font face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
mso-bidi-font-family:"Century Gothic"'>130 Merton =
Street&nbsp;Ph:&nbsp;(416)
485-1481x6612</span></font></i></em><br>
</span></font></i></b><st1:place><st1:City><em><b><i><font =
color=3D"#004080"
  face=3D"Century Gothic"><span style=3D'font-family:"Century =
Gothic";mso-bidi-font-family:
  "Century =
Gothic";color:#004080;font-weight:bold;mso-no-proof:yes'>Toronto</span><=
/font></i></b></em></st1:City><em><b><i><font
 color=3D"#004080" face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
 mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
 mso-no-proof:yes'> =
</span></font></i></b></em><st1:State><em><b><i><font
  color=3D"#004080" face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
  mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
  =
mso-no-proof:yes'>ON</span></font></i></b></em></st1:State><em><b><i><fo=
nt
 color=3D"#004080" face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
 mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
 mso-no-proof:yes'>, =
</span></font></i></b></em><st1:PostalCode><em><b><i><font
  color=3D"#004080" face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
  mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
  mso-no-proof:yes'>M4S =
1A4</span></font></i></b></em></st1:PostalCode></st1:place><em><b><i><fo=
nt
color=3D"#004080" face=3D"Century Gothic"><span =
style=3D'font-family:"Century Gothic";
mso-bidi-font-family:"Century Gothic";color:#004080;font-weight:bold;
mso-no-proof:yes'>&nbsp;&nbsp;&nbsp; &nbsp;Fa:&nbsp;(416) =
482-5909</span></font></i></b></em><span
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Times New Roman"><span =
style=3D'font-size:
10.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C41B25.CC4A2E50--

