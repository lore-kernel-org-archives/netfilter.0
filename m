From: "Martin Leduc" <marled3@hotmail.com>
Subject: Re: Problem behind my DMZ
Date: Mon, 12 Jan 2004 07:08:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c3d904$c73e20a0$0296a8c0@martin>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0003_01C3D8DA.DE6818A0"
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
To: ramin@cannon.eng.us.uu.net, Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0003_01C3D8DA.DE6818A0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Good morning folks,
 
I resend you my last message using corrected design.  Hope this time, it
will be ok!
 
How can I built that using route and ip?
 
            LAN1            ----------
192.168.1.1---- 192.168.1.2 |  BOX 1 |  192.168.1.3
                            ----------             
                                           |
                                           |  LAN 2
                                           |
                                      192.168.1.4
 
 
I know I can use Ramin solution, but can we? it is possible?
 
It is possible to create this topology using Linux BOX?  I have already
do 
it using CISCO Router with the IGRP protocol.  I know I can use RIP too.
 
           LAN            ----------
192.168.1.X---192.168.1.1 |  BOX 1 |----10.0.0.1 |
                          ----------             |   
                                                 |
                                                 |
                                            NET  |

                                                 |
           LAN            ----------             |          
192.168.2.X---192.168.2.1 |  BOX 2 |----10.0.0.2 |
                          ----------             |
                                                 |
                                                 |
                                             10.0.0.3
                                           -----------
                                           | BOX  3  |
                                           -----------
                                                 |
                                                 |
                                             INTERNET 
                                             PUBLIC IP
 
192.168.1.X PING 192.168.2.X PING INTERNET PUBLIC IP
192.168.2.X PING 192.168.1.X PING INTERNET PUBLIC IP
 
I guess I need routed deamon to do that, no? RIP is supported by routed?
 
Thanks in advance
 
Martin

------=_NextPart_000_0003_01C3D8DA.DE6818A0
Content-Type: text/html;
	charset="us-ascii"
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
<link rel=3DFile-List href=3D"cid:filelist.xml@01C3D8DA.DE4B68E0">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"Street"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"address"/>
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
  <w:HyphenationZone>21</w:HyphenationZone>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
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
	margin:0cm;
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
pre
	{margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Courier New";
	mso-fareast-font-family:"Times New Roman";}
span.StyleCourrierlectronique17
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	mso-header-margin:35.4pt;
	mso-footer-margin:35.4pt;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Tableau Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<body lang=3DFR-CA link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:35.4pt'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-CA =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-CA'>Good morning =
folks,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-CA =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-CA'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-CA =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-CA'>I resend you my last =
message
using corrected design. <span =
style=3D'mso-spacerun:yes'>&nbsp;</span>Hope this
time, it will be ok!<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-CA
style=3D'font-size:12.0pt;mso-ansi-language:EN-CA'><o:p>&nbsp;</o:p></spa=
n></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-CA
style=3D'font-size:12.0pt;mso-ansi-language:EN-CA'>How can I <span =
class=3DGramE>built</span>
that using route and <span =
class=3DSpellE>ip</span>?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-CA
style=3D'font-size:12.0pt;mso-ansi-language:EN-CA'><o:p>&nbsp;</o:p></spa=
n></font></p>

<pre><font size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;
mso-ansi-language:EN-CA'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span></span>LAN1<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span><span =
style=3D'mso-spacerun:yes'>&nbsp;</span>----------<o:p></o:p></font></pre=
><pre><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>192.168.1.1---- 192.168.1.2 |<span =
style=3D'mso-spacerun:yes'>&nbsp; </span>BOX 1 |<span =
style=3D'mso-spacerun:yes'>&nbsp; =
</span>192.168.1.3<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;</span>----------<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;</span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>|<o:p></o:p>=
</span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>|<span =
style=3D'mso-spacerun:yes'>&nbsp; </span>LAN =
2<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>|<o:p></o:p>=
</span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'> <span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>192.168.1.4<o:p></o:p></span></font>=
</pre><pre><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></pre>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-CA
style=3D'font-size:12.0pt;mso-ansi-language:EN-CA'><o:p>&nbsp;</o:p></spa=
n></font></p>

<pre><font size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;
mso-ansi-language:EN-CA'>I know I can use <span =
class=3DSpellE>Ramin</span> solution, but can we? <span
class=3DGramE>it</span> is =
possible?<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'><o:p>&nbsp;</o:p></span></font></pre><pre><font size=3D2 =
face=3D"Courier New"><span
lang=3DEN-CA style=3D'font-size:10.0pt;mso-ansi-language:EN-CA'>It is =
possible to create this topology using Linux BOX?<span =
style=3D'mso-spacerun:yes'>&nbsp; </span>I have already <span
class=3DGramE>do</span> <o:p></o:p></span></font></pre><pre><span =
class=3DGramE><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'>it</span></font></span><span lang=3DEN-CA =
style=3D'mso-ansi-language:EN-CA'> using CISCO Router with the IGRP =
protocol.<span style=3D'mso-spacerun:yes'>&nbsp; </span>I know I can use =
RIP too.<o:p></o:p></span></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'><o:p>&nbsp;</o:p></span></font></pre><pre><font size=3D2 =
face=3D"Courier New"><span
lang=3DEN-CA style=3D'font-size:10.0pt;mso-ansi-language:EN-CA'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; </span>LAN<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;</span>----------<o:p>=
</o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'>192.168.1<span class=3DGramE>.X</span>---192.168.1.1 |<span =
style=3D'mso-spacerun:yes'>&nbsp; =
</span></span></font><st1:address><st1:Street><span
  lang=3DEN-CA =
style=3D'mso-ansi-language:EN-CA'>BOX</span></st1:Street><span
 lang=3DEN-CA style=3D'mso-ansi-language:EN-CA'> =
1</span></st1:address><span
lang=3DEN-CA style=3D'mso-ansi-language:EN-CA'> |----10.0.0.1 =
|<o:p></o:p></span></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;</span>----------<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;</span>|<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp; =
</span><o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'><span =
style=3D'mso-tab-count:6'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; </span><span style=3D'mso-spacerun:yes'>&nbsp;&nbsp;</span><span =
style=3D'mso-spacerun:yes'>&nbsp;</span>|<o:p></o:p></span></font></pre><=
pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'><span style=3D'mso-spacerun:yes'>&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;</span>|<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span><span
class=3DGramE>NET<span style=3D'mso-spacerun:yes'>&nbsp; =
</span>|</span><i><span
style=3D'font-style:italic'> </span></i><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;</span><o:p></o:p></span></font></pre><pre><fon=
t
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'><span style=3D'mso-spacerun:yes'>&nbsp;&nbsp;</span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;</span>|<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; </span>LAN<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;</span>----------<span style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp; =
</span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;</span>|<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; </span><o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>192.168.2<span
class=3DGramE>.X</span>---192.168.2.1 |<span =
style=3D'mso-spacerun:yes'>&nbsp; </span>BOX 2 |----10.0.0.2 =
|<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>----------<span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>|<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;</span>|<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;</span>|<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;</span>10.0.0.3<o:p></o:p></span><=
/font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>-----------<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>| =
BOX <span style=3D'mso-spacerun:yes'>&nbsp;</span>3<span =
style=3D'mso-spacerun:yes'>&nbsp; =
</span>|<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span
style=3D'mso-tab-count:2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>-----------<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; </span>|<i><span
style=3D'font-style:italic'><o:p></o:p></span></i></span></font></pre><pr=
e><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; </span>|<i><span
style=3D'font-style:italic'><o:p></o:p></span></i></span></font></pre><pr=
e><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>INTERNET <o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'><span =
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;</span>PUBLIC IP<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></pre><pre><fon=
t
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'>192.168.1<span class=3DGramE>.X</span> =
</span></font><st1:place><span
 lang=3DEN-CA =
style=3D'mso-ansi-language:EN-CA'>PING</span></st1:place><span
lang=3DEN-CA style=3D'mso-ansi-language:EN-CA'> 192.168.2.X PING =
INTERNET PUBLIC IP<o:p></o:p></span></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'>192.168.2<span class=3DGramE>.X</span> =
</span></font><st1:place><span
 lang=3DEN-CA =
style=3D'mso-ansi-language:EN-CA'>PING</span></st1:place><span
lang=3DEN-CA style=3D'mso-ansi-language:EN-CA'> 192.168.1.X PING =
INTERNET PUBLIC IP<o:p></o:p></span></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-CA =
style=3D'font-size:10.0pt;mso-ansi-language:
EN-CA'><o:p>&nbsp;</o:p></span></font></pre><pre><font size=3D2 =
face=3D"Courier New"><span
lang=3DEN-CA style=3D'font-size:10.0pt;mso-ansi-language:EN-CA'>I guess =
I need routed <span
class=3DSpellE>deamon</span> to do that, no? RIP is supported by =
routed?<o:p></o:p></span></font></pre>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-CA
style=3D'font-size:12.0pt;mso-ansi-language:EN-CA'><o:p>&nbsp;</o:p></spa=
n></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-CA
style=3D'font-size:12.0pt;mso-ansi-language:EN-CA'>Thanks in =
advance<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-CA
style=3D'font-size:12.0pt;mso-ansi-language:EN-CA'><o:p>&nbsp;</o:p></spa=
n></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-CA
style=3D'font-size:12.0pt;mso-ansi-language:EN-CA'>Martin<o:p></o:p></spa=
n></font></p>

</div>

</body>

</html>

------=_NextPart_000_0003_01C3D8DA.DE6818A0--

