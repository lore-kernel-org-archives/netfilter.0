From: "Morgan" <morgan@ravensoft.nu>
Subject: NAT Problem
Date: Mon, 21 Oct 2002 01:20:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004a01c2788f$554ecfc0$8b1c000a@raven>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004B_01C278A0.18D79FC0"
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

------=_NextPart_000_004B_01C278A0.18D79FC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello.
 
I have a question about NAT.
 
I have a client and three servers.
 
One server which I do a remote connect to, and two application servers.
 
Client IP =                            1.2.3.4
Remote con server IP =          1.2.3.5
App Server 1 IP =                  1.2.3.6
App Server 2 IP =                  1.2.3.7
 
I have the following problem.
When I have connected to the Remote con Server I need to be able to
access App Server 1 port 5555 by entering the name of App Server 2 port
5555. (Why is long story)
 
So if I access Remote Con Server and give the command: AppName
AppServer2 -p 5555 I should really access AppServer1 -p 5555
 
 
I figure this can be done with some NATing.
 
Anyone who have any suggestions?
 
 
 
Thanks
Morgan
 

------=_NextPart_000_004B_01C278A0.18D79FC0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C278A0.1573B440">
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
</xml><![endif]-->
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
span.E-postmall17
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
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;
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
	{mso-style-name:"Normal tabell";
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

<body lang=3DSV link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:65.2pt'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Hello.<o:p></o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I have a question =
about NAT.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I have a client and =
three
servers.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>One server which I do =
a
remote connect to, and two application =
servers.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Client IP =3D <span
style=3D'mso-tab-count:2'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>1.2.3.4<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Remote con server IP =
=3D <span
style=3D'mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; </span>1.2.3.5<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>App</span></font></span><fon=
t
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> Server 1 IP
=3D<span =
style=3D'mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>1.2.3.6<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>App</span></font></span><fon=
t
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> Server 2 IP
=3D<span =
style=3D'mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>1.2.3.7<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I have the following =
problem.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>When I have connected =
to the
Remote con Server I need to be able to access App Server 1 port 5555 by
entering the name of App Server 2 port 5555. (Why is long <span =
class=3DGramE>story</span>)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>So if I access Remote =
Con
Server and give the command: <span class=3DSpellE>AppName</span> =
AppServer2
&#8211;p 5555 I should really access AppServer1 &#8211;p =
5555<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I figure this can be =
done
with some <span =
class=3DSpellE>NATing</span>.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Anyone who have any
suggestions?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Thanks<o:p></o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Morgan<o:p></o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_004B_01C278A0.18D79FC0--



