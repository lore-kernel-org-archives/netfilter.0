From: "George Hong" <george@chinanetcenter.com>
Subject: ip_conntrack entry: possible potential virus cost connection full
Date: Thu, 22 Apr 2004 15:30:31 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005501c4283b$b245b1f0$bc14a8c0@IBMGeorge>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0056_01C4287E.C068F1F0"
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

------=_NextPart_000_0056_01C4287E.C068F1F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi there,
  I have a firewall capable of handling more than 30,000 connections.
Normally the connection number is around 3,000. But sometimes it got
maxed out. And I can't tell what cost it. So I put in the Linux with
iptables to debug it. The Linux box is doing NAT. 
  Let's assume that a lan PC source address and port is 1.1.1.1:1000 and
the destination address and port is 100.100.100.100:80. And the lan
address for the Linux box is 2.2.2.2 and WAN address is 90.90.90.90. 
  I noticed that about 40% of the entries in my ip_conntrack table look
like this:
Tcp SYN src=1.1.1.1 dst=100.100.100.100 sport=1000 dport=80 [UNREPLIED] 
Src=100.100.100.100 dst=90.90.90.90 sport=80 dport=1000
 
  What concerned me is the portion "dst=90.90.90.90". Isn't it supposed
to be "1.1.1.1"? O.W., how could the connection be completed? 
  If this is an attack or virus, what kind of attack is it? Any
suggestion to stop it? 
Thanks.
George Hong 

------=_NextPart_000_0056_01C4287E.C068F1F0
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
<link rel=3DFile-List href=3D"cid:filelist.xml@01C4287E.BF01C0D0">
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
  <w:PunctuationKerning/>
  <w:DrawingGridVerticalSpacing>7.8 pt</w:DrawingGridVerticalSpacing>
  =
<w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEve=
ry>
  =
<w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>
  <w:Compatibility>
   <w:SpaceForUL/>
   <w:BalanceSingleByteDoubleByteWidth/>
   <w:DoNotLeaveBackslashAlone/>
   <w:ULTrailSpace/>
   <w:DoNotExpandShiftReturn/>
   <w:AdjustLineHeightInTable/>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:UseFELayout/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-alt:SimSun;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 135135232 16 0 262145 0;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;
	mso-font-charset:134;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:3 135135232 16 0 262145 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	mso-pagination:none;
	font-size:10.5pt;
	mso-bidi-font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:SimSun;
	mso-font-kerning:1.0pt;}
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
	mso-ansi-font-size:9.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-fareast-font-family:SimSun;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
 /* Page Definitions */
 @page
	{mso-page-border-surround-header:no;
	mso-page-border-surround-footer:no;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	mso-header-margin:36.0pt;
	mso-footer-margin:36.0pt;
	mso-paper-source:0;
	layout-grid:15.6pt;}
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
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<body lang=3DZH-CN link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:21.0pt;text-justify-trim:
punctuation'>

<div class=3DSection1 style=3D'layout-grid:15.6pt'>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'>Hi =
there,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp; </span>I have a firewall capable of =
handling
more than 30,000 connections. Normally the connection number is around =
3,000.
But sometimes it got maxed out. And I can&#8217;t tell what cost it. So =
I put
in the Linux with <span class=3DSpellE>iptables</span> to debug it. The =
Linux box
is doing NAT. <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp; </span>Let&#8217;s assume that a <span
class=3DSpellE><span class=3DGramE>lan</span></span> PC source address =
and port is
1.1.1.1:1000 and the destination address and port is 100.100.100.100:80. =
And
the <span class=3DSpellE><span class=3DGramE>lan</span></span> address =
for the
Linux box is 2.2.2.2 and WAN address is 90.90.90.90. =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp; </span>I noticed that about 40% of the =
entries in
my <span class=3DSpellE>ip_conntrack</span> table look like =
this:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D1 =
face=3DArial><span lang=3DEN-US
style=3D'font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'>Tcp=
</span></font></span><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:Arial'> SYN <span class=3DSpellE>src</span>=3D1.1.1.1 =
<span
class=3DSpellE><span class=3DGramE>dst</span></span><span =
class=3DGramE>=3D</span>100.100.100.100
sport=3D1000 <span class=3DSpellE>dport</span>=3D80 [UNREPLIED] =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D1 =
face=3DArial><span lang=3DEN-US
style=3D'font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'>Src=
</span></font></span><font
size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:Arial'>=3D100.100.100.100 <span class=3DSpellE><span
class=3DGramE>dst</span></span><span class=3DGramE>=3D</span>90.90.90.90 =
sport=3D80 <span
class=3DSpellE>dport</span>=3D1000<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></spa=
n></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp; </span>What concerned me is the =
portion &#8220;<span
class=3DSpellE><span class=3DGramE>dst</span></span><span =
class=3DGramE>=3D</span>90.90.90.90&#8221;.
Isn&#8217;t it supposed to be &#8220;1.1.1.1&#8221;? O.W., how could the
connection be completed? <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp; </span>If this is an attack or virus, =
what kind
of attack is it? Any suggestion to stop it? =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'>Thanks.<o:p></o:p></sp=
an></font></p>

<p class=3DMsoNormal><font size=3D1 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:Arial'>George Hong =
<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0056_01C4287E.C068F1F0--


