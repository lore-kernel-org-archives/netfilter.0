From: "Juan Hernandez" <alucard@kanux.com>
Subject: RE: help with routing/firewall
Date: Thu, 18 Dec 2003 14:08:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007901c3c591$e420f200$3800a8c0@kanux1>
References: <20031218180112.66315.qmail@web20419.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_007A_01C3C570.5D0F5200"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031218180112.66315.qmail@web20419.mail.yahoo.com>
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

------=_NextPart_000_007A_01C3C570.5D0F5200
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mmm im not sure if we are able to help you that way. that would be
making the job for you I guess. correct me if I'm wrong. Read some
manuals, get a grip in netfilter and if you don't understand something,
we'll help you. 
 
Juan
 
 
-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Fred Gurn
Sent: jueves, 18 de diciembre de 2003 14:01
To: netfilter@lists.netfilter.org
Subject: help with routing/firewall
 
Hi,
I have set up suse linux as bridge/firewall.
Simple configuration. 
eth0 internet
eth1 local net
Everything accepted from eth1, nothing from eth0, traffic from eth1 is
routed to internet.
IP forwarding is enabled.
From local net I can ping eth1 and eth0 (that means machine is routing
packets), but I cant go outside eth0. Same happens when ther is no
firewall. What's the problem with routing?
What comands can I use to monitor what is happening with packets?
 
Tahnks in advance.
  _____  

Do you Yahoo!?
New
<http://pa.yahoo.com/*http:/us.rd.yahoo.com/evt=21260/*http:/photos.yaho
o.com>  Yahoo! Photos - easier uploading and sharing

------=_NextPart_000_007A_01C3C570.5D0F5200
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C3C570.5C9CBA10">
<link rel=3DEdit-Time-Data href=3D"cid:editdata.mso@01C3C570.5C9CBA10">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><o:SmartTagType
 namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags" =
name=3D"time"/>
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:553679495 -2147483648 8 0 66047 0;}
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
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
p
	{mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:navy;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;
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

<body lang=3DES link=3Dblue vlink=3Dblue style=3D'tab-interval:35.4pt'>

<div class=3DSection1>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D2 color=3Dnavy =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;color:navy;mso-ansi-language:=

EN-GB'>Mmm</span></font></span><font size=3D2 color=3Dnavy =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;color:navy;mso-ansi-language:=

EN-GB'> <span class=3DSpellE>im</span> not sure if we are able to help =
you that
way&#8230; that would be making the job for you I guess&#8230; correct =
me if
I&#8217;m wrong. Read some <span class=3DGramE>manuals,</span> get a =
grip in <span
class=3DSpellE>netfilter</span> and if you don&#8217;t understand =
something,
we&#8217;ll help you&#8230; <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:navy;mso-ansi-language:=
EN-GB'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:navy;mso-ansi-language:=
EN-GB'>Juan<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DTahoma><span
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:Tahoma;mso-ansi-language:EN-US'>---=
--Original
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b>
netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org]
<b><span style=3D'font-weight:bold'>On Behalf Of </span></b>Fred =
Gurn<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> jueves, 18 de =
diciembre de
2003 </span></font><st1:time Hour=3D"14" Minute=3D"1"><font size=3D2 =
face=3DTahoma><span
 lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:Tahoma;mso-ansi-language:EN-US'>14:=
01</span></font></st1:time><font
size=3D2 face=3DTahoma><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:Tahoma;
mso-ansi-language:EN-US'><br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> help with
routing/firewall</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>Hi,<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>I have set up =
suse linux
as bridge/firewall.<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>Simple =
configuration. <o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>eth0 =
internet<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>eth1 local =
net<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>Everything =
accepted from
eth1, nothing from eth0, traffic from eth1 is routed to =
internet.<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>IP forwarding =
is enabled.<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>From local net =
I can ping
eth1 and eth0 (that means machine is routing packets), but I cant go =
outside
eth0. Same happens when ther is no firewall. What's the problem with =
routing?<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>What comands =
can I use to
monitor what is happening with packets?<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>Tahnks in =
advance.<o:p></o:p></span></font></p>

</div>

<div class=3DMsoNormal align=3Dcenter =
style=3D'margin-left:35.4pt;text-align:center'><font
size=3D3 face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D1 width=3D"100%" align=3Dcenter>

</span></font></div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>Do you =
Yahoo!?<br>
<a
href=3D"http://pa.yahoo.com/*http:/us.rd.yahoo.com/evt=3D21260/*http:/pho=
tos.yahoo.com">New
Yahoo! Photos - easier uploading and =
sharing</a><o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_007A_01C3C570.5D0F5200--


