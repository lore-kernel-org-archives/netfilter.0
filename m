From: "Alvin Wu" <wualvin@eternalit.com>
Subject: Can't use hostname instead of ip address in the nat table
Date: Sun, 8 Sep 2002 01:40:33 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NJEIKNJBEABDOAFIFLOOOEBFCBAA.wualvin@eternalit.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0000_01C256D8.B8B109D0"
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

------=_NextPart_000_0000_01C256D8.B8B109D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gw1.eternalit.com id g87HgXt12973

Hello there,

My server is PC base Athlon  600MHz CPU, Redhat distribution 7.3
[linux-2.4.18-10] [iptables-1.2.5-3].

I=92m setting up a Linux gateway/server using split DNS, DHCP, HTTP, Samb=
a in
one server box. Basically I have the eth0 connect to the Internet and eth=
1
to internal network and various IP aliases (eth1:x) to simulate those
servers as stated above. My basic /etc/hosts, /etc/sysconfig/network,
/etc/nsswitch.conf are point (or base) on those internally configure serv=
er
services.

My problem is:

I try to nat incoming HTTP requests to be re-directed to internal address=
es
like 192.168.1.2; but fail by capturing destination HOSTNAME (from the
internet interface eth0) instead of ip address. The command I use for thi=
s
purpose is:

iptables =96t nat =96A PREROUTING -i eth0 =96d www.mydomain.com
<http://www.mydomain.com/>  -p =96tcp - -dport 80 =96j DNAT  - - to 192.1=
68.1.2

{please ignore the syntax since my email auto-correct software may make i=
t
somehow differently.}

I have test with different parameters such as interface, chains..etc and
found that I cannot match a packet by using destination HOSTNAME.

If I use IP address nat, then it works fine.

Can anyone help me what would be the problem is? Can iptables identify
HOSTNAME in such environment? Is there any critical pre-requisite for thi=
s
to work in a single server box?

Yours truly.

Alvin Wu
General Manager
Eternalit Company Limited

Mobile: 98789427
PRC mobile: 13530591855
Tel: 21872397
Fax: 28569930
e-Mail: wualvin@eternalit.com


------=_NextPart_000_0000_01C256D8.B8B109D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 9">
<meta name=3DOriginator content=3D"Microsoft Word 9">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C256D8.B543F690">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:UseFELayout/>
  </w:Compatibility>
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
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.EmailStyle15
	{mso-style-type:personal-compose;
	mso-ansi-font-size:10.0pt;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:black;}
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
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>Hello there,<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>My server is PC base Athlon <span style=3D"mso-spacerun:
yes">&nbsp;</span>600MHz CPU, Redhat distribution 7.3 [linux-2.4.18-10]
[iptables-1.2.5-3]. <o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>I&#8217;m setting up a Linux gateway/server using split DNS, =
DHCP, HTTP, Samba
in one server box. Basically I have the eth0 connect to the Internet and =
eth1
to internal network and various IP aliases (eth1:x) to simulate those =
servers
as stated above. My basic /etc/hosts, /etc/sysconfig/network,
/etc/nsswitch.conf are point (or base) on those internally configure =
server
services. <span style=3D"mso-spacerun: =
yes">&nbsp;</span><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>My problem is: <o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>I try to nat incoming HTTP requests to be re-directed to internal
addresses like 192.168.1.2; but fail by capturing destination HOSTNAME =
(from
the internet interface eth0) instead of ip address. The command I use =
for this
purpose is:<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>iptables &#8211;t nat &#8211;A PREROUTING -i eth0 &#8211;d <a
href=3D"http://www.mydomain.com/">www.mydomain.com</a> -p &#8211;tcp - =
-dport 80 &#8211;j DNAT
<span style=3D"mso-spacerun: yes">&nbsp;</span>- - to =
192.168.1.2<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>{please ignore the syntax since my email auto-correct software =
may make
it somehow differently.}<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>I have test with different parameters such as interface, =
chains..etc and
found that I cannot match a packet by using destination =
HOSTNAME.<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>If I use IP address nat, then it works =
fine.<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'>Can anyone help me what would be the problem is? Can iptables =
identify
HOSTNAME in such environment? Is there any critical pre-requisite for =
this to
work in a single server box?<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial'><span style=3D"mso-spacerun: =
yes">&nbsp;</span><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><!--[if supportFields]><font color=3Dblack><span=20
style=3D'color:black'><span =
style=3D'mso-element:field-begin'></span><span=20
style=3D"mso-spacerun: yes">&nbsp;</span>AUTOTEXTLIST \s &quot;E-mail=20
Signature&quot; <span =
style=3D'mso-element:field-separator'></span></span></font><![endif]--><f=
ont
size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:
12.0pt;font-family:Arial;color:black;mso-color-alt:windowtext'><o:p></o:p=
></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:
10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;color:black'>Yours =
truly.</span></font><font
size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:
12.0pt;font-family:Arial;color:black;mso-color-alt:windowtext'><o:p></o:p=
></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:
10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;color:black'><![if =
!supportEmptyParas]>&nbsp;<![endif]></span></font><font
size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:
12.0pt;font-family:Arial;color:black;mso-color-alt:windowtext'><o:p></o:p=
></span></font></p>

<p class=3DMsoAutoSig><i><font size=3D2 color=3Dblack face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;col=
or:black;
font-style:italic'>Alvin Wu</span></font></i><i><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:
Arial;color:black;mso-color-alt:windowtext;font-style:italic'><o:p></o:p>=
</span></font></i></p>

<p class=3DMsoAutoSig><i><font size=3D2 color=3Dblack face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;col=
or:black;
font-style:italic'>General Manager</span></font></i><i><font size=3D2
color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:Arial;color:black;mso-color-alt:windowtext;font-style:italic'=
><o:p></o:p></span></font></i></p>

<p class=3DMsoAutoSig><b><font size=3D2 color=3Dblack face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;col=
or:black;
font-weight:bold'>Eternalit Company Limited</span></font></b><b><font =
size=3D1
color=3Dblack face=3DArial><span =
style=3D'font-size:9.0pt;mso-bidi-font-size:12.0pt;
font-family:Arial;color:black;mso-color-alt:windowtext;font-weight:bold'>=
<o:p></o:p></span></font></b></p>

<p class=3DMsoAutoSig><font size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:
9.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;color:black'><![if =
!supportEmptyParas]>&nbsp;<![endif]></span></font><font
size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:9.0pt;mso-bidi-font-size:
12.0pt;font-family:Arial;color:black;mso-color-alt:windowtext'><o:p></o:p=
></span></font></p>

<p class=3DMsoAutoSig><font size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:
9.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;color:black'>Mobile: =
98789427</span></font><font
size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:9.0pt;mso-bidi-font-size:
12.0pt;font-family:Arial;color:black;mso-color-alt:windowtext'><o:p></o:p=
></span></font></p>

<p class=3DMsoAutoSig><font size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:
9.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;color:black'>PRC =
mobile:
13530591855</span></font><font size=3D1 color=3Dblack face=3DArial><span
style=3D'font-size:9.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;colo=
r:black;
mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=3DMsoAutoSig><font size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:
9.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;color:black'>Tel: =
21872397</span></font><font
size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:9.0pt;mso-bidi-font-size:
12.0pt;font-family:Arial;color:black;mso-color-alt:windowtext'><o:p></o:p=
></span></font></p>

<p class=3DMsoAutoSig><font size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:
9.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;color:black'>Fax: =
28569930</span></font><font
size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:9.0pt;mso-bidi-font-size:
12.0pt;font-family:Arial;color:black;mso-color-alt:windowtext'><o:p></o:p=
></span></font></p>

<p class=3DMsoAutoSig><font size=3D1 color=3Dblack face=3DArial><span =
style=3D'font-size:
9.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;color:black'>e-Mail:
wualvin@eternalit.com</span></font><font size=3D1 color=3Dblack =
face=3DArial><span
style=3D'font-size:9.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;colo=
r:black;
mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=3DMsoNormal><!--[if supportFields]><font color=3Dblack><span=20
style=3D'color:black'><span =
style=3D'mso-element:field-end'></span></span></font><![endif]--><font
color=3Dblack><span style=3D'color:black'><![if =
!supportEmptyParas]>&nbsp;<![endif]></span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

</div>

</body>

</html>

------=_NextPart_000_0000_01C256D8.B8B109D0--


