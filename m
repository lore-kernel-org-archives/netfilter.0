From: "Gilles Yue" <gyue@novelgmt.intnet.mu>
Subject: Re: Help on IPTABLES
Date: Tue, 14 Oct 2003 16:50:40 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83055D4B014C9E478D2F04624B9E82CFD47A@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C39251.C6008EFC"
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
To: Joel Newkirk <firewalldude@newkirk.us>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C39251.C6008EFC
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Joel,

Browsing is working now. I have removed all chains in output and forward
and starting with INPUT rules first. (Juat like u told me)

           =20

But I am now trying to check my mail on the box with iptables installed.
Note I have opened ports 25 and 110 and tried with both sport and dport.
Connection with local mail server cannot be made.  Did I miss something?

=20

Sorry to bother you about those basic questions but I am VERY new to
iptables.

=20

Thanks & Best Regards

gy

=20

=20

Chain INPUT (policy DROP 2858 packets, 315K bytes)

pkts bytes target     prot opt in     out     source              =20

destination

=20

0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0           0.0.0.0/0
tcp spt:53

=20

1   456 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

0.0.0.0/0          udp spt:53

=20

0     0 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

0.0.0.0/0          udp spt:80

=20

33  6571 ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

0.0.0.0/0          tcp spt:80

=20

0     0 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

0.0.0.0/0          udp spt:443

=20

0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

0.0.0.0/0          tcp spt:443

=20

0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

0.0.0.0/0          tcp spt:110

=20

0     0 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

0.0.0.0/0          udp spt:110

=20

0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

0.0.0.0/0          tcp spt:25

=20

0     0 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

0.0.0.0/0          udp spt:25

=20

=20

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)

pkts bytes target     prot opt in     out     source              =20

destination

=20

Chain OUTPUT (policy ACCEPT 664 packets, 67152 bytes)

pkts bytes target     prot opt in     out     source              =20

destination

=20


------_=_NextPart_001_01C39251.C6008EFC
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 77.95pt 1.0in 77.95pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Dear Joel,</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:1.0in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>Browsing is working now. I have removed all =
chains in
output and forward and starting with INPUT rules first. (Juat like u =
told me)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; </span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>But I am now trying to check my mail on the =
box with iptables
installed. Note I have opened ports 25 and 110 and tried with both sport =
and dport.
Connection with local mail server cannot be made.&nbsp; Did I miss =
something?</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>Sorry to bother you about those basic =
questions but I am
VERY new to iptables.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Thanks &amp; Best Regards</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>gy</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><b><font size=3D3 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:12.0pt;color:navy;font-weight:bold'>Chain INPUT =
(policy DROP
2858 packets, 315K bytes)</span></font></b></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>destination</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0&nbsp;&nbsp;&nbsp;&nbsp; 0 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tcp spt:53</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>1&nbsp;&nbsp; 456 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; =
--&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
udp spt:53</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0&nbsp;&nbsp;&nbsp;&nbsp; 0 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
udp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
udp spt:80</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>33&nbsp; 6571 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tcp spt:80</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0&nbsp;&nbsp;&nbsp;&nbsp; 0 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
udp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
udp spt:443</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0&nbsp;&nbsp;&nbsp;&nbsp; 0 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
tcp spt:443</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0&nbsp;&nbsp;&nbsp;&nbsp; 0 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
tcp spt:110</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0&nbsp;&nbsp;&nbsp;&nbsp; 0 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
udp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
udp spt:110</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0&nbsp;&nbsp;&nbsp;&nbsp; 0 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
tcp spt:25</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0&nbsp;&nbsp;&nbsp;&nbsp; 0 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
udp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
udp spt:25</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
11.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><b><font size=3D3 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:12.0pt;color:navy;font-weight:bold'>Chain FORWARD =
(policy
ACCEPT 0 packets, 0 bytes)</span></font></b></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>destination</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><b><font size=3D3 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:12.0pt;color:navy;font-weight:bold'>Chain OUTPUT =
(policy
ACCEPT 664 packets, 67152 bytes)</span></font></b></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>destination</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C39251.C6008EFC--

