From: "Omar Castaneda Acosta" <omar@idea.com.mx>
Subject: RE: Transparent Proxy server
Date: Wed, 5 Jun 2002 09:25:23 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <3A5DC36EC1506C40825C05BE65E62AEF0E79EB@neptuno.idea.com.mx>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C20CA5.36122F36"
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Eugene Joubert <eugenej@centratel.co.za>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C20CA5.36122F36
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The Transparent Proxy HOW-TO explains the setup properly
=20
http://www.tldp.org/HOWTO/mini/TransparentProxy.html
=20
the only rule you need is a REDIRECT and access from the local interface
to the outside world on port 80.
=20
-----Original Message-----
From: Eugene Joubert [mailto:eugenej@centratel.co.za]
Sent: Wednesday, June 05, 2002 7:26 AM
To: 'netfilter@lists.samba.org'
Subject: Transparent Proxy server
=20
Hi,=20
I have the following scenario: My default policy for INPUT and FORWARD
is drop. My default policy for OUTPUT is ACCEPT.=20
I am using transparent proxy server in my firewall rules.=20
When I try and access the Internet with proxy setting enabled on my
browser I can't get anywhere. When I make the default policy for INPUT
ACCEPT my proxy server settings work....
If I disable my proxy server on my browser, add the necessary rule in my
FORWARD chain I can access the Internet just fine...
My question is this, do you need to allow anything in the INPUT chain if
your default policy is DROP for squid to work?=20
Thanks in advance....=20
PS : If you need any other info please let me know=20
=20

------_=_NextPart_001_01C20CA5.36122F36
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 9">
<meta name=3DOriginator content=3D"Microsoft Word 9">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C20C72.EB72A780">
<title>Transparent Proxy server</title>
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:Zoom>0</w:Zoom>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
 </w:WordDocument>
</xml><![endif]-->
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
p
	{margin-right:0in;
	mso-margin-top-alt:auto;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.EmailStyle16
	{mso-style-type:personal-reply;
	mso-ansi-font-size:10.0pt;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:navy;}
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

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>Th=
e
Transparent Proxy HOW-TO explains the setup =
properly</span></font></span><span
class=3DEmailStyle16><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial;color:navy;mso-color-a=
lt:
windowtext'><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><!=
[if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><a=

href=3D"http://www.tldp.org/HOWTO/mini/TransparentProxy.html">http://www.=
tldp.org/HOWTO/mini/TransparentProxy.html</a><o:p></o:p></span></font></s=
pan></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><!=
[if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>th=
e only
rule you need is a REDIRECT and access from the local interface to the =
outside
world on port 80.<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><!=
[if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma;color:black'>-----Original
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Eugene Joubert
[mailto:eugenej@centratel.co.za]<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Wednesday, June 05, =
2002
7:26 AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
'netfilter@lists.samba.org'<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Transparent =
Proxy server</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></p>

<p style=3D'margin-left:.5in'><font size=3D2 color=3Dblack =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:black'>Hi,</span></font=
><font
color=3Dblack><span style=3D'color:black'> </span></font><font =
color=3Dblack><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p style=3D'margin-left:.5in'><font size=3D2 color=3Dblack =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:black'>I have the =
following
scenario: My default policy for INPUT and FORWARD is drop. My default =
policy
for OUTPUT is ACCEPT.</span></font><font color=3Dblack><span =
style=3D'color:black'>
<br>
</span></font><font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;color:black'>I am using transparent proxy server in my
firewall rules.</span></font><font color=3Dblack><span =
style=3D'color:black'> <br>
</span></font><font size=3D2 color=3Dblack face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;color:black'>When I try and access the Internet with =
proxy
setting enabled on my browser I can't get anywhere. When I make the =
default
policy for INPUT ACCEPT my proxy server settings =
work....</span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p style=3D'margin-left:.5in'><font size=3D2 color=3Dblack =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:black'>If I disable my =
proxy
server on my browser, add the necessary rule in my FORWARD chain I can =
access
the Internet just fine...</span></font><font color=3Dblack><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p style=3D'margin-left:.5in'><font size=3D2 color=3Dblack =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:black'>My question is =
this, do
you need to allow anything in the INPUT chain if your default policy is =
DROP
for squid to work?</span></font><font color=3Dblack><span =
style=3D'color:black'> </span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p style=3D'margin-left:.5in'><font size=3D2 color=3Dblack =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:black'>Thanks in =
advance....</span></font><font
color=3Dblack><span style=3D'color:black'> </span></font><font =
color=3Dblack><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p style=3D'margin-left:.5in'><font size=3D2 color=3Dblack =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:black'>PS : If you =
need any other
info please let me know</span></font><font color=3Dblack><span =
style=3D'color:black'>
</span></font><font color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3Dblack
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:black'><![if =
!supportEmptyParas]>&nbsp;<![endif]></span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

</div>

</body>

</html>

------_=_NextPart_001_01C20CA5.36122F36--

