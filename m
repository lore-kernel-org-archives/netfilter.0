From: "Gilles Yue" <gyue@novelgmt.intnet.mu>
Subject: help on  NAT Configuration
Date: Tue, 21 Oct 2003 08:41:30 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83055D4B014C9E478D2F04624B9E82CF39E82D@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Type: multipart/related;
	type="multipart/alternative";
	boundary="----_=_NextPart_001_01C3978D.98DFE9E0"
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

------_=_NextPart_001_01C3978D.98DFE9E0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C3978D.98DFE9E0"


------_=_NextPart_002_01C3978D.98DFE9E0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear all

=20

I want to share internet access on my LAN and my configurations are as
below. (see picture)

=20

Is my NAT configuration correct? I want to allow only some users to
access the internet-and check mail using outlook express.

=20

Thanks for helping.

=20

Rgds

gy

=20

iptables -vnL

=20

> Chain INPUT (policy DROP 485 packets, 51391 bytes)

=20

> pkts bytes target     prot opt in     out     source              =20

> destination

>    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          tcp spt:53

>   21  4504 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          udp spt:53

>    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          udp spt:80

>  813  704K ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          tcp spt:80

>    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          udp spt:443

>   16  3793 ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          tcp spt:443

>    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =20

> 0.0.0.0/0          state RELATED,ESTABLISHED

>    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0           =20

> 0.0.0.0/0

>

> Chain FORWARD (policy DROP 0 packets, 0 bytes)

> pkts bytes target     prot opt in     out     source              =20

> destination

>    0     0 ACCEPT     all  --  eth1   eth0    0.0.0.0/0           =20

> 0.0.0.0/0          state RELATED,ESTABLISHED

>    0     0 ACCEPT     all  --  eth0   eth1    0.0.0.0/0           =20

> 0.0.0.0/0

>

> Chain OUTPUT (policy ACCEPT 3465 packets, 286K bytes)

> pkts bytes target     prot opt in     out     source              =20

> destination

=20

=20

=20

> [root@rh9 root]# iptables -t nat -L

> Chain PREROUTING (policy ACCEPT)

> target     prot opt source               destination

>

> Chain POSTROUTING (policy DROP)

> target     prot opt source               destination

> MASQUERADE  all  --  anywhere             anywhere

>

> Chain OUTPUT (policy ACCEPT)

> target     prot opt source               destination

 =20

=20

=20

=20

=20

=20

=20

=20

=20

=20

=20

=20

=20

=20

=20


------_=_NextPart_002_01C3978D.98DFE9E0
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
span.emailstyle18
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

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Dear all</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>I want to share internet =
access on
my LAN and my configurations are as below. (see =
picture)</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Is my NAT configuration =
correct? I
want to allow only some users to access the internet-and check mail =
using
outlook express.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Thanks for =
helping.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Rgds</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>gy</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>iptables &#8211;vnL</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><b><font size=3D3 =
color=3Dred
face=3D"Courier New"><span =
style=3D'font-size:12.0pt;color:red;font-weight:bold'>&gt;
Chain INPUT (policy DROP 485 packets, 51391 bytes)</span></font></b></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; pkts bytes =
target&nbsp;&nbsp;&nbsp;&nbsp; prot
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; destination</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
spt:53</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;&nbsp;&nbsp; 21 &nbsp;4504
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp =
spt:53</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;
</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp =
spt:80</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;&nbsp; 813&nbsp; 704K
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font=
></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
spt:80</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp =
spt:443</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;&nbsp;&nbsp; 16&nbsp; 3793
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
spt:443</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;&nbsp;&nbsp;&nbsp; 0 =
&nbsp;&nbsp;&nbsp;&nbsp;0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state
RELATED,ESTABLISHED</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
lo&nbsp;&nbsp;&nbsp;&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; 0.0.0.0/0</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; </span></font><b><font size=3D3 =
color=3Dred><span
style=3D'font-size:12.0pt;color:red;font-weight:bold'>Chain FORWARD =
(policy DROP
0 packets, 0 bytes)</span></font></b></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; pkts bytes =
target&nbsp;&nbsp;&nbsp;&nbsp; prot
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; destination</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; eth1&nbsp;&nbsp;
eth0&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
state RELATED,ESTABLISHED</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; eth0&nbsp;&nbsp;
eth1&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; 0.0.0.0/0</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; </span></font><b><font size=3D3 =
color=3Dred><span
style=3D'font-size:12.0pt;color:red;font-weight:bold'>Chain OUTPUT =
(policy ACCEPT
3465 packets, 286K bytes)</span></font></b></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; pkts bytes =
target&nbsp;&nbsp;&nbsp;&nbsp; prot
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; destination</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; [root@rh9 root]# iptables -t nat =
-L</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; </span></font><b><font size=3D3 =
color=3Dred><span
style=3D'font-size:12.0pt;color:red;font-weight:bold'>Chain PREROUTING =
(policy
ACCEPT)</span></font></b></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; </span></font><b><font size=3D3 =
color=3Dred><span
style=3D'font-size:12.0pt;color:red;font-weight:bold'>Chain POSTROUTING =
(policy
DROP)</span></font></b></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; MASQUERADE&nbsp; all&nbsp; --&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
anywhere</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt;</span></font></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; </span></font><b><font size=3D3 =
color=3Dred><span
style=3D'font-size:12.0pt;color:red;font-weight:bold'>Chain OUTPUT =
(policy
ACCEPT)</span></font></b></p>

<p class=3DMsoPlainText style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>&gt; target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;</span></font></=
p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><img width=3D808 =
height=3D349
src=3D"cid:image001.gif@01C397AE.F6017460" align=3Dleft hspace=3D12 =
alt=3D"Text Box:  "></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal align=3Dcenter =
style=3D'margin-left:.5in;text-align:center'><font
size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_002_01C3978D.98DFE9E0--

------_=_NextPart_001_01C3978D.98DFE9E0
Content-Type: image/gif;
	name="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <image001.gif@01C397AE.F6017460>
Content-Description: image001.gif
Content-Location: image001.gif

R0lGODlhKANdAXcAMSH+GlNvZnR3YXJlOiBNaWNyb3NvZnQgT2ZmaWNlACH5BAEAAAAALAIAAwAj
A1cBhwAAAAAAAAAAMwAAZgAAmQAAzAAA/wAzAAAzMwAzZgAzmQAzzAAz/wBmAABmMwBmZgBmmQBm
zABm/wCZAACZMwCZZgCZmQCZzACZ/wDMAADMMwDMZgDMmQDMzADM/wD/AAD/MwD/ZgD/mQD/zAD/
/zMAADMAMzMAZjMAmTMAzDMA/zMzADMzMzMzZjMzmTMzzDMz/zNmADNmMzNmZjNmmTNmzDNm/zOZ
ADOZMzOZZjOZmTOZzDOZ/zPMADPMMzPMZjPMmTPMzDPM/zP/ADP/MzP/ZjP/mTP/zDP//2YAAGYA
M2YAZmYAmWYAzGYA/2YzAGYzM2YzZmYzmWYzzGYz/2ZmAGZmM2ZmZmZmmWZmzGZm/2aZAGaZM2aZ
ZmaZmWaZzGaZ/2bMAGbMM2bMZmbMmWbMzGbM/2b/AGb/M2b/Zmb/mWb/zGb//5kAAJkAM5kAZpkA
mZkAzJkA/5kzAJkzM5kzZpkzmZkzzJkz/5lmAJlmM5lmZplmmZlmzJlm/5mZAJmZM5mZZpmZmZmZ
zJmZ/5nMAJnMM5nMZpnMmZnMzJnM/5n/AJn/M5n/Zpn/mZn/zJn//8wAAMwAM8wAZswAmcwAzMwA
/8wzAMwzM8wzZswzmcwzzMwz/8xmAMxmM8xmZsxmmcxmzMxm/8yZAMyZM8yZZsyZmcyZzMyZ/8zM
AMzMM8zMZszMmczMzMzM/8z/AMz/M8z/Zsz/mcz/zMz///8AAP8AM/8AZv8Amf8AzP8A//8zAP8z
M/8zZv8zmf8zzP8z//9mAP9mM/9mZv9mmf9mzP9m//+ZAP+ZM/+ZZv+Zmf+ZzP+Z///MAP/MM//M
Zv/Mmf/MzP/M////AP//M///Zv//mf//zP///wECAwECAwECAwECAwECAwECAwECAwECAwECAwEC
AwECAwECAwECAwECAwECAwECAwECAwECAwECAwECAwECAwECAwECAwECAwECAwECAwECAwECAwEC
AwECAwECAwECAwECAwECAwECAwECAwECAwECAwECAwj/AAMIHEiwoMGDCBMqXMiwocOHECNKnEix
osWLGDNq3Mixo8ePIEOKHEmypMmTGLGpXMmypcuXMGPKnEmzps2bOHPq3Mmzp8+fQIMKHUq0qNGj
SJMqXcq0qdOnPQW2bPWSqkurU6tqvbo1K9evXsOyxDq2a1mwZ8WuJLvWbFu0b9WqZDvXbV24d+Vi
o7vXbl+8f/XyHeyXMGDDggsrPrw4MePHjiOnnRyXcl7LgTEj1tyYM2TPkiuLvjw6c2nEUqGqXs26
tevXsGPLnk27tu3buKGmzs27t+/fwIMLH068uHHgu48rX868ufPn0KNLdy518+nO1z9nD026u2nv
1sFj/xevnTz37+jDpx+/vnz78+rjs5fvnj78+fjr57+vvz///6AFuB1myU1n4IEIJqjgggw26FuB
DkYo4YQUVmjhhc1BiOGGHHbo4YcghvhSgfYJaJ6J76FY4oAsnthiii+u6OKMMNIoY4043qjjfiry
GKOPNgKZo5A7+tejkT8imZeGIjbp5JNQRillbUxOaeWVWGap5ZYqVcnll2CGKeaY0FVH5JlKDplm
kQAm2WaQa6L5pppzsnlknXLeqaebe8KJZ5yA/jmnl2QWauihiCbqFKGKNuroo5BGig2jklZq6aWY
Nklinnx26mefdIJqp6ehkjrqp6ZyiuqqpbJ6aquwvv8qq6qx0jorWJRmquuuvPY6Xa6+BivssMRS
GUCxyCar7LKqmRmoqLZG+2yq07oqraDQVlurtrdiS6231nJ7bbbgogcss+imq+66kx7L7rvwxrvs
ufLWa++9ZG4q7r7ldkvuv98CHG6/4wZs8MACb0swvwn7e7DCd9KL78QUV/ykxBZnrPHGEmLM8ccg
h5zhsQ4j/HDJEJ9csMksp9wyyjCv7PLMMTOsss0vs+exyDz37DNuO/8s9NBEL+pu0UgnrXSzR+eM
M80y17zw1A1HbfXTUleN9dVU39z1wEEvLfbYZLcUdtlop0302Wq37fbHzn4N9dZ0y52111rbzXXe
fOP/7bfTetfdN41sv2344fcWjvjijKereOOQRy6svoFXPvjclv+N+eV3A8753pp3vnnooAP+uOSo
p27p6aq37jqirL8u++xcxv254KTj7nnume/u++i/iy586cArjNXwacZO+/LM29TK89BDf4Ug0Uf/
nPLNZ5+9INy3csX3V7AAvvjPi/+9+d93L4hy2Gvvvuvgc889T63IL0j6xVF+e+/FI8+///sLIO8E
GDziAZB356sfXWRUP0GIb31UOeCSmva+ClpwKvVjwfOakkEWUO9BFLygCLXHvQe2xoH14037EnS/
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

------_=_NextPart_001_01C3978D.98DFE9E0--

