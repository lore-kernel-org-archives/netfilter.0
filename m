From: "Kashif Latif" <mkashif@i2cinc.com>
Subject: ftp configurion in iptables
Date: Wed, 26 Mar 2003 18:11:02 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c2f399$26bcf9e0$2100a8c0@i2c.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;boundary="----=_NextPart_000_0008_01C2F3C3.0F9301E0"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0008_01C2F3C3.0F9301E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Sir,
=20
I am getting problem in ftp. I configured firewall on Linux 8.0 with
Iptables. I did this configuration
=20
iptables -A INPUT     -p tcp --sport 21 -m state --state ESTABLISHED -j
ACCEPT=20
iptables -A OUTPUT -p tcp --dport 21 -m state --state NEW,ESTABLISHED -j
ACCEPT
iptables -A INPUT     -p tcp --sport 1024: --dport 1024:  -m state
--state ESTABLISHED -j ACCEPT=20
iptables -A OUTPUT -p tcp --sport 1024: --dport 1024:  -m state --state
ESTABLISHED,RELATED -j ACCEPT=20
 =20
 For Nat=20
=20
iptables =96t nat -A POSTROUTING -p tcp --dport 21 -m state --state
NEW,ESTABLISHED -j MASQUERADE
iptables =96t nat -A POSTROUTING -p tcp --sport 1024: --dport 1024:  -m
state --state ESTABLISHED,RELATED -j MASQUERADE
=20
Users from NAT are able to connect to remote FTP server but when they
type dir, ls commands. It returns error connection closed by remote
machine.
=20
How can I configure NAT then user from their machine able to FTP  on
remote server.
=20
Please give me solution to solve this problem.
=20
Regards,
=20
=20
****************************************
Kashif Latif
Network Support Officer
Innovative Pvt Ltd.
****************************************
=20

------=_NextPart_000_0008_01C2F3C3.0F9301E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C2F3C3.0F4E30B0">
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
p
	{mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.EmailStyle18
	{mso-style-type:personal;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:black;
	mso-text-animation:none;
	font-weight:normal;
	font-style:normal;
	text-decoration:none;
	text-underline:none;
	text-decoration:none;
	text-line-through:none;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:black;
	font-weight:normal;
	font-style:normal;
	text-decoration:none;
	text-underline:none;
	text-decoration:none;
	text-line-through:none;}
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

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Hello =
Sir,<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>I am getting problem in =
ftp. I
configured firewall on Linux 8.0 with Iptables. I did this =
configuration<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3D"#cc0000"
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:#CC0000'>iptables -A
</span></font><font color=3D"#3333ff"><span =
style=3D'color:#3333FF'>INPUT</span></font><font
color=3D"#cc0000"><span style=3D'color:#CC0000'>&nbsp;&nbsp;&nbsp;&nbsp; =
-p tcp
--sport 21 -m state --state </span></font><font color=3D"#33cc00"><span
style=3D'color:#33CC00'>ESTABLISHED</span></font><font =
color=3D"#cc0000"><span
style=3D'color:#CC0000'> -j ACCEPT</span></font> <br>
<font color=3D"#cc0000"><span style=3D'color:#CC0000'>iptables -A =
</span></font><font
color=3D"#3333ff"><span =
style=3D'color:#3333FF'>OUTPUT</span></font><font
color=3D"#cc0000"><span style=3D'color:#CC0000'> -p tcp --dport 21 -m =
state --state
</span></font><font color=3D"#33cc00"><span =
style=3D'color:#33CC00'>NEW,ESTABLISHED</span></font><font
color=3D"#cc0000"><span style=3D'color:#CC0000'> -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3D"#cc0000"
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:#CC0000'>iptables -A
</span></font><font color=3D"#3333ff"><span =
style=3D'color:#3333FF'>INPUT</span></font><font
color=3D"#cc0000"><span style=3D'color:#CC0000'>&nbsp;&nbsp;&nbsp;&nbsp; =
-p tcp
--sport 1024: --dport 1024:&nbsp; -m state --state </span></font><font
color=3D"#33cc00"><span =
style=3D'color:#33CC00'>ESTABLISHED</span></font><font
color=3D"#cc0000"><span style=3D'color:#CC0000'> -j ACCEPT</span></font> =
<br>
<font color=3D"#cc0000"><span style=3D'color:#CC0000'>iptables -A =
</span></font><font
color=3D"#3333ff"><span =
style=3D'color:#3333FF'>OUTPUT</span></font><font
color=3D"#cc0000"><span style=3D'color:#CC0000'> -p tcp --sport 1024: =
--dport
1024:&nbsp; -m state --state </span></font><font color=3D"#33cc00"><span
style=3D'color:#33CC00'>ESTABLISHED,RELATED</span></font><font =
color=3D"#cc0000"><span
style=3D'color:#CC0000'> -j ACCEPT</span></font> <br>
&nbsp; <br>
&nbsp;For Nat <o:p></o:p></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3D"#cc0000"
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:#CC0000'>iptables
&#8211;t nat -A </span></font><font color=3D"#3366ff"><span =
style=3D'color:#3366FF'>POSTROUTING</span></font><font
color=3D"#cc0000"><span style=3D'color:#CC0000'> -p tcp --dport 21 -m =
state --state
</span></font><font color=3D"#33cc00"><span =
style=3D'color:#33CC00'>NEW,ESTABLISHED</span></font><font
color=3D"#cc0000"><span style=3D'color:#CC0000'> -j =
MASQUERADE<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3D"#cc0000"
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:#CC0000'>iptables
&#8211;t nat -A </span></font><font color=3D"#3333ff"><span =
style=3D'color:#3333FF'>POSTROUTING</span></font><font
color=3D"#cc0000"><span style=3D'color:#CC0000'> -p tcp --sport 1024: =
--dport
1024:&nbsp; -m state --state </span></font><font color=3D"#33cc00"><span
style=3D'color:#33CC00'>ESTABLISHED,RELATED</span></font><font =
color=3D"#cc0000"><span
style=3D'color:#CC0000'> -j MASQUERADE<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3D"#cc0000"
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:#CC0000'><o:p>&nbsp;</o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>Users from NAT are able to connect to remote =
FTP
server but when they type <font color=3D"#3366ff"><span =
style=3D'color:#3366FF'>dir,
ls</span></font> commands. It returns error <font =
color=3D"#3366ff"><span
style=3D'color:#3366FF'>connection closed by remote =
machine.<o:p></o:p></span></font></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>How can I configure NAT then user from their =
machine
able to FTP<span style=3D'mso-spacerun:yes'>=A0 </span>on remote =
server.<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Please give me solution to =
solve
this problem.<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Regards,<o:p></o:p></span></=
font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;mso-no-proof:yes'>***********=
*****************************</span></font><span
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D3 =
color=3Dred
face=3DArial><span =
style=3D'font-size:12.0pt;font-family:Arial;color:red;
font-weight:bold;mso-no-proof:yes'>Kashif Latif</span></font></b><span
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D3 =
color=3Dred
face=3DArial><span =
style=3D'font-size:12.0pt;font-family:Arial;color:red;
font-weight:bold;mso-no-proof:yes'>Network Support =
Officer</span></font></b><span
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p =
style=3D'mso-margin-top-alt:1.5pt;margin-right:0in;margin-bottom:1.5pt;
margin-left:.5in'><b><font size=3D3 color=3Dred face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;color:red;font-weight:bold;mso-no-proof:yes'>Inn=
ovative
Pvt Ltd.</span></font></b><span =
style=3D'mso-no-proof:yes'><o:p></o:p></span></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;mso-no-proof:yes'>***********=
*****************************</span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0008_01C2F3C3.0F9301E0--


