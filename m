From: "Michael Brown" <Michael.Brown@intercept.net>
Subject: how to allow multiple -d flags?
Date: Wed, 25 Feb 2004 17:40:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <66425557D80D6448A99C4BAFFE9874030CA661@icptex02.corp.icpt.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3FBF0.51293DE6"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

------_=_NextPart_001_01C3FBF0.51293DE6
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

How can I specify a SNAT rule to exclude multiple destination networks?
=20
=20
/sbin/iptables -t nat -A POSTROUTING -o eth0 -s
172.28.22.0/255.255.255.0 -d ! 172.0.0.0/8 -j SNAT --to-source
64.243.144.209
/sbin/iptables -t nat -A POSTROUTING -o eth0 -s
172.28.22.0/255.255.255.0 -d ! 10.0.0.0/8 -j SNAT --to-source
64.243.144.209
=20
Is there a way to do something like
=20
/sbin/iptables -t nat -A POSTROUTING -o eth0 -s
172.28.22.0/255.255.255.0 -d ! 172.0.0.0/8,10.0.0.0/8,192.168.0.0/16 -j
SNAT --to-source 64.243.144.209
=20
I 've tried spaces between the networks, commas, semi-colon, nada
=20
Thanks,
Michael Brown, CISSP
InterCept
Corporate Security Analyst
O: 770.840.3918
C: 404.483.1394
2-Way: michael_brown@imcingular.com

Director of Communications
Metro Atlanta ISSA - www.gaissa.org <http://www.gaissa.org>=20
=20

------_=_NextPart_001_01C3FBF0.51293DE6
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40"
xmlns:ns0=3D"urn:schemas-microsoft-com:office:smarttags">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 11">
<meta name=3DOriginator content=3D"Microsoft Word 11">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C3FBC6.68489730">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PersonName" downloadurl=3D"http://www.microsoft.com"/>
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:DisplayBackgroundShape/>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:UseWord2002TableStyleRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState=3D"false" LatentStyleCount=3D"156">
 </w:LatentStyles>
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Courier New";
	mso-fareast-font-family:"Times New Roman";}
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
	font-family:"Times New Roman";
	mso-ansi-language:#0400;
	mso-fareast-language:#0400;
	mso-bidi-language:#0400;}
</style>
<![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>How can I specify a SNAT rule to exclude multiple =
destination
networks?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/<span class=3DSpellE>sbin/iptables</span> -t <span
class=3DSpellE>nat</span> -A POSTROUTING -o eth0 -s =
172.28.22.0/255.255.255.0 -<span
class=3DGramE>d !</span> 172.0.0.0/8 -j SNAT --to-source =
64.243.144.209<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/<span class=3DSpellE>sbin/iptables</span> -t <span
class=3DSpellE>nat</span> -A POSTROUTING -o eth0 -s =
172.28.22.0/255.255.255.0 -<span
class=3DGramE>d !</span> 10.0.0.0/8 -j SNAT --to-source =
64.243.144.209<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Is there a way to do something <span =
class=3DGramE>like</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/<span class=3DSpellE>sbin/iptables</span> -t <span
class=3DSpellE>nat</span> -A POSTROUTING -o eth0 -s =
172.28.22.0/255.255.255.0 -<span
class=3DGramE>d !</span> 172.0.0.0/8,10.0.0.0/8,192.168.0.0/16 -j SNAT
--to-source 64.243.144.209<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>I &#8216;<span =
class=3DSpellE>ve</span></span></font></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> tried
spaces between the networks, commas, semi-colon, =
nada<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoPlainText><font size=3D1 face=3D"Courier New"><span =
style=3D'font-size:
9.0pt;mso-no-proof:yes'>Thanks,</span></font><span =
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p class=3DMsoPlainText><font size=3D1 face=3D"Courier New"><span =
style=3D'font-size:
9.0pt;mso-no-proof:yes'><ns0:PersonName w:insAuthor=3D"Michael Brown"
 w:insDate=3D"2004-02-25T17:29:00Z" w:endInsAuthor=3D"Michael Brown"
 w:endInsDate=3D"2004-02-25T17:29:00Z">Michael Brown, =
CISSP</ns0:PersonName></span></font><span
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p class=3DMsoPlainText><font size=3D1 face=3D"Courier New"><span =
style=3D'font-size:
9.0pt;mso-no-proof:yes'>InterCept</span></font><span =
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p class=3DMsoPlainText><font size=3D1 face=3D"Courier New"><span =
style=3D'font-size:
9.0pt;mso-no-proof:yes'>Corporate Security Analyst</span></font><font
face=3D"Times New Roman"><span style=3D'font-family:"Times New =
Roman";mso-no-proof:
yes'><o:p></o:p></span></font></p>

<p class=3DMsoPlainText><font size=3D1 face=3D"Courier New"><span =
style=3D'font-size:
9.0pt;mso-no-proof:yes'>O: 770.840.3918</span></font><span =
style=3D'mso-no-proof:
yes'><o:p></o:p></span></p>

<p class=3DMsoPlainText><font size=3D1 face=3D"Courier New"><span =
style=3D'font-size:
9.0pt;mso-no-proof:yes'>C: 404.483.1394</span></font><span =
style=3D'mso-no-proof:
yes'><o:p></o:p></span></p>

<p class=3DMsoPlainText><font size=3D1 face=3D"Courier New"><span =
style=3D'font-size:
9.0pt;mso-no-proof:yes'>2-Way: <st1:PersonName =
w:st=3D"on">michael_brown@imcingular.com</st1:PersonName></span></font><s=
pan
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p class=3DMsoPlainText><font size=3D1 face=3D"Courier New"><span =
style=3D'font-size:
9.0pt;mso-no-proof:yes'><br>
Director of Communications</span></font><span =
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p class=3DMsoPlainText><font size=3D1 face=3D"Courier New"><span =
style=3D'font-size:
9.0pt;mso-no-proof:yes'>Metro <st1:City w:st=3D"on"><st1:place =
w:st=3D"on">Atlanta</st1:place></st1:City>
ISSA - </span></font><span style=3D'mso-no-proof:yes'><a
href=3D"http://www.gaissa.org"><font size=3D1><span =
style=3D'font-size:9.0pt'>www.gaissa.org</span></font></a></span><o:p></o=
:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C3FBF0.51293DE6--

