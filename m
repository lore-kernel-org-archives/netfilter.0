From: "Brei, Matt" <mbrei@medclaiminc.com>
Subject: port 25 & 110 forward
Date: Mon, 14 Jul 2003 14:43:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <091A6DF13847F44395B31658ED61C19C63A449@yellowstone.medclaim.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C34A37.D46D4D82"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C34A37.D46D4D82
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm trying to forward smtp and pop3 from my router to my mail server at
10.13.110.1.  I've tried both of the following iptables commands,
neither has worked.

=20

$IPTABLES -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT --to
10.13.110.1

$IPTABLES -t nat -A PREROUTING -i eth1 -p tcp --dport 110 -j DNAT --to
10.13.110.1

$IPTABLES -A FORWARD -p tcp -d 10.13.110.1 --dport 25 -j ACCEPT

$IPTABLES -A FORWARD -p tcp -d 10.13.110.1 --dport 110 -j ACCEPT

=20

=20

$IPTABLES -t nat -A PREROUTING -d <public_ip> -p tcp --dport 25 -j DNAT
--to 10.13.110.1:25

$IPTABLES -A FORWARD -p tcp --dport 25 -j ACCEPT

$IPTABLES -t nat -A PREROUTING -d <public_ip> -p tcp --dport 110 -j DNAT
--to 10.13.110.1:110

$IPTABLES -A FORWARD -p tcp --dport 110 -j ACCEPT

=20

The later works great for ftp and http forwards.  Why won't it work for
25 and 110?

=20

eth0=3D 10.13.110.1

eth2=3D <public_ip>

=20

Matt Brei

=20


------_=_NextPart_001_01C34A37.D46D4D82
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
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

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;m trying to forward smtp and pop3 from my =
router to
my mail server at 10.13.110.1.&nbsp; I&#8217;ve tried both of the =
following
iptables commands, neither has worked.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -t nat -A PREROUTING -i eth1 -p tcp --dport =
25 -j
DNAT --to 10.13.110.1</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -t nat -A PREROUTING -i eth1 -p tcp --dport =
110 -j
DNAT --to 10.13.110.1</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A FORWARD -p tcp -d 10.13.110.1 --dport 25 =
-j
ACCEPT</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A FORWARD -p tcp -d 10.13.110.1 --dport =
110 -j
ACCEPT</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -t nat -A PREROUTING -d <i><span =
style=3D'font-style:
italic'>&lt;public_ip&gt;</span></i> -p tcp --dport 25 -j DNAT --to
10.13.110.1:25</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A FORWARD -p tcp --dport 25 -j =
ACCEPT</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -t nat -A PREROUTING -d <i><span =
style=3D'font-style:
italic'>&lt;public_ip&gt;</span></i> -p tcp --dport 110 -j DNAT --to
10.13.110.1:110</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>$IPTABLES -A FORWARD -p tcp --dport 110 -j =
ACCEPT</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>The later works great for ftp and http =
forwards.&nbsp; Why
won&#8217;t it work for 25 and 110?</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>eth0=3D 10.13.110.1</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>eth2=3D <i><span =
style=3D'font-style:italic'>&lt;public_ip&gt;</span></i></span></font></p=
>

<p class=3DMsoNormal><strong><b><font size=3D2 color=3D"#0000a0" =
face=3D"Comic Sans MS"><span
style=3D'font-size:10.0pt;font-family:"Comic Sans =
MS";color:#0000A0'>&nbsp;</span></font></b></strong></p>

<p class=3DMsoNormal><strong><b><font size=3D2 color=3D"#0000a0" =
face=3D"Comic Sans MS"><span
style=3D'font-size:10.0pt;font-family:"Comic Sans =
MS";color:#0000A0'>Matt Brei</span></font></b></strong></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C34A37.D46D4D82--

