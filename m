From: "Derek Storvik" <dstorvik@consultech.net>
Subject: NAT and VPN
Date: Thu, 3 Jun 2004 11:53:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <CBBC84AC3E18304C98492272A68D61117C5917@thor.envisagenow.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4498B.4492909C"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

------_=_NextPart_001_01C4498B.4492909C
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm having trouble with NAT and VPN  =20

=20

I have a linux server running Fedora core 1   that is a
NAT/FIREWALL/VLAN/DHCP server for a large client network.

=20

Internet

  |

  |

Linux

  |

  |

Large network with many vlans and 1000 nodes or so.

=20

=20

 The internal network is natted to the 10.0.0.0 network and my clients
can not VPN out to the internet.   Specifically they get back an error
619

What has to be done to allow VPN to traverse through the firewall and
NAT?   at the moment the firewall rules are wide open to make sure that
isn't my issue.=20

=20

Any help would be appreciated.

----------------------------------

Derek Storvik

Network & Systems Administrator

ConsulTech, LLC

=20

=20

Phone: 812.323.8324

Fax: 812.323.1272

E-mail: dstorvik@consultech.net <mailto:dstorvik@consultech.net>=20

=20

1441 Fenbrook Lane

Bloomington, IN 47401

----------------------------------

=20


------_=_NextPart_001_01C4498B.4492909C
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
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PostalCode"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"State"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"Street"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"address"/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
p
	{mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;m having trouble with NAT and VPN&nbsp;&nbsp; =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have a linux server running Fedora core =
1&nbsp;&nbsp; that is a NAT/FIREWALL/VLAN/DHCP
server for a large client network.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Internet<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; |<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; |<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Linux<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; |<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; |<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Large network with many vlans and 1000 nodes or =
so.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;The
internal network is natted to the 10.0.0.0 network and my clients can =
not VPN
out to the internet.&nbsp;&nbsp; Specifically they get back an error =
619<o:p></o:p></span></font></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>What
has to be done to allow VPN to traverse through the firewall and =
NAT?&nbsp;&nbsp; at the
moment the firewall rules are wide open to make sure that isn&#8217;t my =
issue.
<o:p></o:p></span></font></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></fo=
nt></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Any
help would be appreciated.<o:p></o:p></span></font></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>----------------------------=
------<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Derek Storvik<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Network&nbsp;&amp; Systems =
Administrator<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>ConsulTech, LLC<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Phone: 812.323.8324<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Fax: 812.323.1272<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>E-mail: <a href=3D"mailto:dstorvik@consultech.net"><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>dstorvik@consultech.net</spa=
n></font></a><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><st1:Street w:st=3D"on"><st1:address =
w:st=3D"on"><font size=3D3
  face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>1441 =
Fenbrook Lane</span></font></st1:address></st1:Street><o:p></o:p></p>

<p class=3DMsoNormal><st1:place w:st=3D"on"><st1:City w:st=3D"on"><font =
size=3D3
  face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>Bloomington</span></font></st1:City>,
 <st1:State w:st=3D"on">IN</st1:State> <st1:PostalCode =
w:st=3D"on">47401</st1:PostalCode></st1:place><o:p></o:p></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>----------------------------=
------</span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C4498B.4492909C--

