From: "Ben" <nigma@nigma.info>
Subject: extreme rDNS lag with iptables
Date: Tue, 4 Nov 2003 15:27:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1AH7km-00008y-AB@aphex.cyberpixels.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001F_01C3A2E8.1AF6CC40"
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

------=_NextPart_000_001F_01C3A2E8.1AF6CC40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

I'm new to this list, so forgive me is I seem newbish :-)

 

The problem I am having that when I turn on iptables, I see rDNS lag to
about 30 seconds.  I see this happen with two programs I am using, proftpd
and uwimap.  Both work fine with flush tables, but when I run the following

 

IPTABLES="/sbin/iptables"

 

#Flush everything, start from scratch

$IPTABLES -F

 

#Set default policies to DROP

$IPTABLES -P INPUT DROP

$IPTABLES -P FORWARD DROP

 

#Set default OUTPUT policy to ACCEPT

$IPTABLES -P OUTPUT ACCEPT

 

# Open ports for server/services

$IPTABLES -A INPUT -p tcp --dport 20 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 21 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 25 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 37 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 43 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT 

$IPTABLES -A INPUT -p udp --dport 53 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 80 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 110 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 113 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 143 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 443 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 465 -j ACCEPT 

$IPTABLES -A INPUT -p udp --dport 465 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 873 -j ACCEPT 

$IPTABLES -A INPUT -p udp --dport 873 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 993 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 995 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 2082 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 2083 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 2086 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 2087 -j ACCEPT 

$IPTABLES -A INPUT -p tcp --dport 2089 -j ACCEPT

 

I see login request spike from almost instant to upwards of 30 seconds.
This of course causes timeouts with most client software.

 

Has anyone run into this before? Does anyone know how I might go about
fixing it?


------=_NextPart_000_001F_01C3A2E8.1AF6CC40
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUS-ASCII">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
font-family:Arial'>Hello,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;m new to this list, so forgive me is I seem =
newbish </span></font><font
size=3D2 face=3DWingdings><span =
style=3D'font-size:10.0pt;font-family:Wingdings'>J</span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>The problem I am having that when I turn on iptables, =
I see
rDNS lag to about 30 seconds.&nbsp; I see this happen with two programs =
I am using,
proftpd and uwimap.&nbsp; Both work fine with flush tables, but when I =
run the
following<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>IPTABLES=3D&quot;/sbin/iptables&quot;<o:p></o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>#Flush everything, start from =
scratch<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -F<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>#Set default policies to =
DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -P INPUT DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -P FORWARD =
DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>#Set default OUTPUT policy to =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -P OUTPUT =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'># Open ports for =
server/services<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 20 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 21 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 25 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 37 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 43 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p udp --dport 53 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 80 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 110 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 113 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 143 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 443 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 465 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p udp --dport 465 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 873 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p udp --dport 873 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 993 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 995 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 2082 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 2083 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 2086 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 2087 -j ACCEPT =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 2089 -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I see login request spike from almost instant to =
upwards of
30 seconds.&nbsp; This of course causes timeouts with most client =
software.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Has anyone run into this before? Does anyone know how =
I
might go about fixing it?<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_001F_01C3A2E8.1AF6CC40--



