From: <Josh.Berry@compucom.com>
Subject: IPTables PSD Patch Problem
Date: Mon, 4 Aug 2003 16:54:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0C7C6E1720E8D74FB52EBEF93649730A0116BEB5@2k099exm01.compucom.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C35AD3.0597B44E"
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
To: netfilter@lists.netfilter.org, firewalls@securityfocus.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C35AD3.0597B44E
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry,=20

=20

After going through the Makefile and Config.in file for netfilter I
realized that I had a typo, I had:

obj=3D$(CONFIG_IP_NF_MATCH_PSD) +=3D ipt_psd.o

=20

instead of:

obj-$(CONFIG_IP_NF_MATCH_PSD) +=3D ipt_psd.o

=20

I had an =3D sign where I needed a - .

=20

Josh Berry

Information Security Group

972-856-5402

=20


------_=_NextPart_001_01C35AD3.0597B44E
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

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
span.EmailStyle17
	{font-family:Arial;
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

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Sorry, </span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>After going through the Makefile and Config.in file for =
netfilter I
realized that I had a typo, I had:</span></font></p>

<p class=3DMsoNormal><b><font size=3D3 face=3D"Times New Roman"><span
style=3D'font-size:12.0pt;font-weight:bold'>obj=3D$(CONFIG_IP_NF_MATCH_PS=
D) +=3D ipt_psd.o</span></font></b></p>

<p class=3DMsoNormal><b><font size=3D3 face=3D"Times New Roman"><span
style=3D'font-size:12.0pt;font-weight:bold'>&nbsp;</span></font></b></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>instead of:</span></font></p>

<p class=3DMsoNormal><b><font size=3D3 face=3D"Times New Roman"><span
style=3D'font-size:12.0pt;font-weight:bold'>obj-$(CONFIG_IP_NF_MATCH_PSD)=
 +=3D ipt_psd.o</span></font></b></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>I had an =3D sign where I needed a - .</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Josh Berry</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>Information Security Group</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>972-856-5402</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C35AD3.0597B44E--

