From: "Kevin Robertson" <kevinr@ieighty.net>
Subject: How to make 1 I/P look as if from many?
Date: Thu, 17 Jun 2004 01:23:46 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c4543c$07655970$c801a8c0@kevinwr01>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C45409.BCCAE970"
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

------=_NextPart_000_0001_01C45409.BCCAE970
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I have a project that requires a kind of reverse NAT. That is, to make one
IP address appear as if it is coming from many IP addresses. 

 

I understand that you can give a range of I/P address such as:

## Change source addresses to 1.2.3.4, 1.2.3.5 or 1.2.3.6
# iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.2.3.4-1.2.3.6

 

however, the other element is I would like it to round robin through the IP
address range and not use the "least currently used" IP algorithm.

 

Does anyone have suggestions on how to accomplish this?

 

 

 


------=_NextPart_000_0001_01C45409.BCCAE970
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
 /* Font Definitions */
 @font-face
	{font-family:Courier;
	panose-1:2 7 4 9 2 2 5 2 4 4;}
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
pre
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{font-family:Courier;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
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

<p class=3DMsoNormal><font size=3D2 face=3DCourier><span =
style=3D'font-size:10.0pt;
font-family:Courier'>I have a project that requires a kind of reverse =
NAT. That
is, to make one IP address appear as if it is coming from many IP =
addresses. </span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DCourier><span =
style=3D'font-size:10.0pt;
font-family:Courier'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DCourier><span =
style=3D'font-size:10.0pt;
font-family:Courier'>I understand that you can give a range of I/P =
address such
as:</span></font></p>

<pre><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>## Change source addresses to 1.2.3.4, =
1.2.3.5 or 1.2.3.6</span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span style=3D'font-size:10.0pt'># =
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to =
1.2.3.4-1.2.3.6</span></font></pre>

<p class=3DMsoNormal><font size=3D2 face=3DCourier><span =
style=3D'font-size:10.0pt;
font-family:Courier'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DCourier><span =
style=3D'font-size:10.0pt;
font-family:Courier'>however, the other element is I would like it to =
round
robin through the IP address range and not use the &#8220;least =
currently used&#8221;
IP algorithm.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DCourier><span =
style=3D'font-size:10.0pt;
font-family:Courier'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DCourier><span =
style=3D'font-size:10.0pt;
font-family:Courier'>Does anyone have suggestions on how to accomplish =
this?</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DCourier><span =
style=3D'font-size:10.0pt;
font-family:Courier'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DCourier><span =
style=3D'font-size:10.0pt;
font-family:Courier'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DCourier><span =
style=3D'font-size:10.0pt;
font-family:Courier'>&nbsp;</span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0001_01C45409.BCCAE970--


