From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: extreme rDNS lag with iptables
Date: Tue, 4 Nov 2003 15:39:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311042040.hA4KeeGJ022103@discmail.com>
References: <E1AH7km-00008y-AB@aphex.cyberpixels.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_01C3A2E9.D4D1BA20"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1AH7km-00008y-AB@aphex.cyberpixels.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'Ben' <nigma@nigma.info>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0012_01C3A2E9.D4D1BA20
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

I think you may need a FORWARD rule for DNS requests - INPUT and OUTPUT
rules only affect locally generated traffic.

 

  _____  

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ben
Sent: Tuesday, November 04, 2003 3:27 PM
To: netfilter@lists.netfilter.org

 

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


------=_NextPart_000_0012_01C3A2E9.D4D1BA20
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
span.EmailStyle18
	{font-family:Arial;
	color:windowtext;}
span.EmailStyle19
	{font-family:Arial;
	color:navy;}
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

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>I think you may need a FORWARD rule =
for
DNS requests &#8211; INPUT and OUTPUT rules only affect locally =
generated
traffic.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org]
<b><span style=3D'font-weight:bold'>On Behalf Of </span></b>Ben<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Tuesday, November =
04, 2003 3:27 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org</span></font></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;m new to this list, so forgive me is I seem =
newbish </span></font><font
size=3D2 face=3DWingdings><span =
style=3D'font-size:10.0pt;font-family:Wingdings'>J</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>The problem I am having that when I turn on iptables, =
I see
rDNS lag to about 30 seconds.&nbsp; I see this happen with two programs =
I am
using, proftpd and uwimap.&nbsp; Both work fine with flush tables, but =
when I
run the following</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>IPTABLES=3D&quot;/sbin/iptables&quot;</span></font></p=
>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>#Flush everything, start from =
scratch</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -F</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>#Set default policies to DROP</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -P INPUT DROP</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -P FORWARD DROP</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>#Set default OUTPUT policy to =
ACCEPT</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -P OUTPUT ACCEPT</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'># Open ports for server/services</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 20 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 21 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 25 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 37 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 43 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p udp --dport 53 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 80 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 110 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 113 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 143 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 443 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 465 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p udp --dport 465 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 873 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p udp --dport 873 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 993 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 995 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 2082 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 2083 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 2086 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 2087 -j ACCEPT =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A INPUT -p tcp --dport 2089 -j =
ACCEPT</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I see login request spike from almost instant to =
upwards of
30 seconds.&nbsp; This of course causes timeouts with most client =
software.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Has anyone run into this before? Does anyone know how =
I
might go about fixing it?</span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0012_01C3A2E9.D4D1BA20--


