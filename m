From: "Det Buaklee" <det@dss.go.th>
Subject: iptables: invalid arguement with kernel 2.6.5
Date: Tue, 4 May 2004 18:00:40 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002e01c431c7$09cfe910$440997cb@GINA>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002F_01C43201.B62EC110"
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

------=_NextPart_000_002F_01C43201.B62EC110
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi
 
I am very new in configuring iptables with bridge software. I want to do
a transparent proxy with iptables and squid and running a firewall
bridge on the squid box. I have upgraded my kernel to 2.6.5 (to get the
firewall-bridge) and I have already tried compiled iptables 1.2.9 with
the kernel src directory. My problem is when I tried something like 
 
/sbin/iptables -A PREROUTING -t mangle -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 8080
 
or 
 
/sbin/iptables -t mangle -A PREROUTING -m physdev --physdev-in eth0 -p
tcp --dport 80 -j REDIRECT --to-port 8080
 
and iptables just return 
 
iptables: invalid argument
 
Any help or pointer to some documents would be much appreciated. 
 
Det Buaklee

------=_NextPart_000_002F_01C43201.B62EC110
Content-Type: text/html;
	charset="US-ASCII"
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
<link rel=3DFile-List href=3D"cid:filelist.xml@01C43201.B603E080">
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
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Angsana New";
	panose-1:2 2 6 3 5 4 5 2 3 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:16777219 0 0 0 65537 0;}
@font-face
	{font-family:"Cordia New";
	panose-1:2 11 3 4 2 2 2 2 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:16777219 0 0 0 65537 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:14.0pt;
	font-family:"Angsana New";
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
	mso-bidi-font-size:11.5pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:"Cordia New";
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:1.0in 1.25in 1.0in 1.25in;
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
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'>Hi<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'>I
am very new in configuring <span class=3DSpellE>iptables</span> with =
bridge
software. I want to do a transparent proxy with <span =
class=3DSpellE>iptables</span>
and squid and running a firewall bridge on the squid box. I have =
upgraded my
kernel to 2.6.5 (to get the firewall-bridge) and I have already tried =
compiled <span
class=3DSpellE>iptables</span> 1.2.9 with the kernel <span =
class=3DSpellE>src</span>
directory. My problem is when I tried something like =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'>/<span
class=3DSpellE>sbin/iptables</span> -A PREROUTING -t mangle -<span =
class=3DSpellE>i</span>
eth0 -p <span class=3DSpellE>tcp</span> --<span =
class=3DSpellE>dport</span> 80 -j
REDIRECT --to-port 8080<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:11.5pt;font-family:Arial;mso=
-bidi-font-family:
"Cordia New"'>or</span></font></span><font size=3D2 face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:11.5pt;font-family:Arial;mso=
-bidi-font-family:
"Cordia New"'> <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'>/<span
class=3DSpellE>sbin/iptables</span> -t mangle -A PREROUTING -m <span
class=3DSpellE>physdev</span> --<span class=3DSpellE>physdev</span>-in =
eth0 -p <span
class=3DSpellE>tcp</span> --<span class=3DSpellE>dport</span> 80 -j =
REDIRECT --to-port
8080<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:11.5pt;font-family:Arial;mso=
-bidi-font-family:
"Cordia New"'>and</span></font></span><font size=3D2 face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:11.5pt;font-family:Arial;mso=
-bidi-font-family:
"Cordia New"'> <span class=3DSpellE>iptables</span> just return =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:11.5pt;font-family:
Arial;mso-bidi-font-family:"Cordia =
New"'>iptables</span></font></span></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:11.5pt;
font-family:Arial;mso-bidi-font-family:"Cordia New"'>: invalid =
argument<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'>Any
help or pointer to some documents would be much appreciated. =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
mso-bidi-font-size:11.5pt;font-family:Arial;mso-bidi-font-family:"Cordia =
New"'>Det
<span class=3DSpellE>Buaklee</span><o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_002F_01C43201.B62EC110--


