From: "Victor Batista" <vbatista@present-technologies.com>
Subject: NEW Packets without the SYN flag
Date: Tue, 28 Jan 2003 12:36:01 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005c01c2c6c9$d11a40c0$6501a8c0@mzecas>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_005D_01C2C6C9.D11A40C0"
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

------=_NextPart_000_005D_01C2C6C9.D11A40C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
            My firewall is blocking NEW Packets which haven=92t the SYN
flag Active on the FORWARD chain, with the following rule:
$IPTABLES -A FORWARD -p tcp ! --syn -m state --state NEW -j LOG
--log-prefix "FW -NEW-WITHOUT-SYN-"
$IPTABLES -A FORWARD -p tcp ! --syn -m state --state NEW -j DROP
=20
            Although I am watching a lot of these Logs on the firewall
with origin on one of my servers (Which id DNATed):
=20
Jan 28 06:36:01 firewall kernel: FW -NEW-WITHOUT-SYN-IN=3Deth1 =
OUT=3Deth0
SRC=3D192.168.1.253 DST=3DXXX.XXX.XXX.XXX LEN=3D1500 TOS=3D0x00 =
PREC=3D0x00 TTL=3D63
ID=3D15003 DF PROTO=3DTCP SPT=3D80 DPT=3D33710 WINDOW=3D32120 RES=3D0x00 =
ACK PSH
URGP=3D0
=20
            If I stop the HTTP server, this packets stop. Notice that
the Source Port is 80. Why is Apache making these requests? Is it really
Apache, or can it be any other Application? One connection is identified
by: SourceIP+SourcePort + DestIP+DestPort=85
=20
            The Desktops (work places running windows) also originate
some of these packets, with a different SPT=85.Why?
=20
            I have another question. My servers are DNATed, and all
outgoing traffic is SNATed. This way, all the traffic whose destiny is
one of the DNATed servers will go through the FORWARD chain. Although in
my case I am also doing IP Aliasing on the firewall, i=E9, the firewall
answers for a few Public IP addresses. These packets are also traversing
my FORWARD chain. Can any one tell me if the Aliasing changes any thing
on the firewall behavior?=20
            The Packet arrives to the machine with one of the aliased
IPs, enters on the firewall, DNAT is executed and the packet is sent to
the FORWARD chain, is this true? The fact of having a packet arriving
with an aliased IP or not has any influence?=20
=20
            Any help would be welcome.
            Thanks in advance,
                        Victor Batista

------=_NextPart_000_005D_01C2C6C9.D11A40C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C2C6C9.D0660BF0">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PlaceType"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PlaceName"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"time"/>
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
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
	mso-fareast-font-family:"Times New Roman";
	mso-ansi-language:PT;}
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

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DPT =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DPT =
style=3D'font-size:10.0pt;
font-family:Arial'><span style=3D'mso-spacerun:yes'>=A0</span><span
style=3D'mso-tab-count:1'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span></span></font><font size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:
EN-US'>My firewall is blocking NEW Packets which haven&#8217;t the SYN =
flag
Active on the FORWARD chain, with the following =
rule:<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in;text-indent:.5in'><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:
EN-US'>$IPTABLES -A FORWARD -p tcp ! --syn -m state --state NEW -j LOG
--log-prefix &quot;FW =
-NEW-WITHOUT-SYN-&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in;text-indent:.5in'><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:
EN-US'>$IPTABLES -A FORWARD -p tcp ! --syn -m state --state NEW -j =
DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><o:p>&nbsp;</o:p></span></font=
></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><span =
style=3D'mso-tab-count:1'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>Although
I am watching a lot of these Logs on the firewall with origin on one of =
my
servers (Which id DNATed):<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><o:p>&nbsp;</o:p></span></font=
></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'>Jan 28 =
</span></font><st1:time
Hour=3D"6" Minute=3D"36"><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
 =
font-family:Arial;mso-ansi-language:EN-US'>06:36:01</span></font></st1:ti=
me><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:
EN-US'> firewall kernel: FW -NEW-WITHOUT-SYN-IN=3Deth1 OUT=3Deth0 =
SRC=3D192.168.1.253
DST=3DXXX.XXX.XXX.XXX LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TTL=3D63 =
ID=3D15003 DF PROTO=3DTCP
SPT=3D80 DPT=3D33710 WINDOW=3D32120 RES=3D0x00 ACK PSH =
URGP=3D0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><o:p>&nbsp;</o:p></span></font=
></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><span =
style=3D'mso-tab-count:1'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 </span>If
I stop the HTTP server, this packets stop. Notice that the =
</span></font><st1:place><st1:PlaceName><font
  size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:
  EN-US'>Source</span></font></st1:PlaceName><font size=3D2 =
face=3DArial><span
 style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:EN-US'> =
</span></font><st1:PlaceType><font
  size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:
  EN-US'>Port</span></font></st1:PlaceType></st1:place><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:EN-US'> is =
80. Why
is Apache making these requests? Is it really Apache, or can it be any =
other
Application? One connection is identified by: SourceIP+SourcePort +
DestIP+DestPort&#8230;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><o:p>&nbsp;</o:p></span></font=
></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><span =
style=3D'mso-tab-count:1'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 </span>The
Desktops (work places running windows) also originate some of these =
packets,
with a different SPT&#8230;.Why?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><o:p>&nbsp;</o:p></span></font=
></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><span =
style=3D'mso-tab-count:1'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 </span>I
have another question. My servers are DNATed, and all outgoing traffic =
is
SNATed. This way, all the traffic whose destiny is one of the DNATed =
servers will
go through the FORWARD chain. Although in my case I am also doing IP =
Aliasing
on the firewall, i=E9, the firewall answers for a few Public IP =
addresses. These
packets are also traversing my FORWARD chain. Can any one tell me if the
Aliasing changes any thing on the firewall behavior? =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><span =
style=3D'mso-tab-count:1'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 </span>The
Packet arrives to the machine with one of the aliased IPs, enters on the
firewall, DNAT is executed and the packet is sent to the FORWARD chain, =
is this
true? The fact of having a packet arriving with an aliased IP or not has =
any
influence? <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><o:p>&nbsp;</o:p></span></font=
></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><span =
style=3D'mso-tab-count:1'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 </span>Any
help would be welcome.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><span =
style=3D'mso-tab-count:1'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
</span>Thanks
in advance,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;mso-ansi-language:EN-US'><span =
style=3D'mso-tab-count:2'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 </span>Victor
Batista<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_005D_01C2C6C9.D11A40C0--


