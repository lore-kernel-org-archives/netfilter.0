From: "Gilles Yue" <gyue@novelgmt.intnet.mu>
Subject: help on  NAT Configuration
Date: Mon, 20 Oct 2003 17:12:21 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83055D4B014C9E478D2F04624B9E82CF39E82A@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Type: multipart/related;
	type="multipart/alternative";
	boundary="----_=_NextPart_001_01C3970B.CBCC2436"
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

------_=_NextPart_001_01C3970B.CBCC2436
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C3970B.CBCC2436"


------_=_NextPart_002_01C3970B.CBCC2436
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

  _____ =20

=20

=20


------_=_NextPart_002_01C3970B.CBCC2436
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
span.EmailStyle18
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
font-family:Arial'>Dear all</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I want to share internet access on my LAN and my
configurations are as below. (see picture)</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Is my NAT configuration correct? I want to allow only =
some
users to access the internet-and check mail using outlook =
express.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks for helping.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Rgds</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>gy</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>iptables &#8211;vnL</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><b><font size=3D3 color=3Dred face=3D"Courier =
New"><span
style=3D'font-size:12.0pt;color:red;font-weight:bold'>&gt; Chain INPUT =
(policy
DROP 485 packets, 51391 bytes)</span></font></b></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; destination</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp
spt:53</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp; 21 &nbsp;4504 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
udp&nbsp;
--&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp
spt:53</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp
spt:80</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp; 813&nbsp; 704K ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
tcp&nbsp;
--&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font=
></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp
spt:80</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp
spt:443</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp; 16&nbsp; 3793 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
tcp&nbsp;
--&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp
spt:443</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp;&nbsp; 0 &nbsp;&nbsp;&nbsp;&nbsp;0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
state RELATED,ESTABLISHED</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
lo&nbsp;&nbsp;&nbsp;&nbsp;
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; 0.0.0.0/0</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font><b><font size=3D3 color=3Dred><span =
style=3D'font-size:
12.0pt;color:red;font-weight:bold'>Chain FORWARD (policy DROP 0 packets, =
0
bytes)</span></font></b></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; destination</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; eth1&nbsp;&nbsp;
eth0&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
state RELATED,ESTABLISHED</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; eth0&nbsp;&nbsp;
eth1&nbsp;&nbsp;&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; 0.0.0.0/0</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font><b><font size=3D3 color=3Dred><span =
style=3D'font-size:
12.0pt;color:red;font-weight:bold'>Chain OUTPUT (policy ACCEPT 3465 =
packets,
286K bytes)</span></font></b></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; destination</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; [root@rh9 root]# iptables -t nat -L</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font><b><font size=3D3 color=3Dred><span =
style=3D'font-size:
12.0pt;color:red;font-weight:bold'>Chain PREROUTING (policy =
ACCEPT)</span></font></b></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; target&nbsp;&nbsp;&nbsp;&nbsp; prot opt =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font><b><font size=3D3 color=3Dred><span =
style=3D'font-size:
12.0pt;color:red;font-weight:bold'>Chain POSTROUTING (policy =
DROP)</span></font></b></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; MASQUERADE&nbsp; all&nbsp; --&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
anywhere</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; </span></font><b><font size=3D3 color=3Dred><span =
style=3D'font-size:
12.0pt;color:red;font-weight:bold'>Chain OUTPUT (policy =
ACCEPT)</span></font></b></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><img width=3D818 height=3D411
src=3D"cid:image001.gif@01C3972D.227596C0"></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter>

</span></font></div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>

------_=_NextPart_002_01C3970B.CBCC2436--

------_=_NextPart_001_01C3970B.CBCC2436
Content-Type: image/gif;
	name="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <image001.gif@01C39718.EC070C40>
Content-Description: image001.gif
Content-Location: image001.gif

R0lGODlhMgObAXcAMSH+GlNvZnR3YXJlOiBNaWNyb3NvZnQgT2ZmaWNlACH5BAEAAAAALD8ANADb
AiMBgwAAAAAAAAcGBgwKCwUEBAsJCgoICQYFBQcGBwsKCggHBwMDAwkICAkHCP///wECAwT/EMhJ
q7046827/2AojmRpnmiqrmzrvnAsz25A33iu73zv/8CgcEgsngLIpDLgWC6N0Kh0Sq1ar9is1rN0
eL/gsLip3JrP6LR6zW67N8mxfC5Pvu/4vH7P76/jdIGCYHZ+hoeIiYqLjEiDj5BehYyUlZaXmJkx
gJGdj0iaoaKjpKWHjp6pkaA8Tq6vsLGys7S1tre4ubqspr2+vzOoqsOQvDdMxMnKy8zNzjbA0dLT
I8jO11/GMtbY3d7f4IPQ1OTl5sLhzePb6e3u78zr5vP0pOjwyto1+Pz9/mLy6gkc2OifOnYGEyoE
F5Cgw4d57i1UpU8Ft4kYM6ZqCLGjxzMX/zVSfBFSpMmTYTh+XMlSSkmUq/YR20Wzps2bOGPVacmz
J5SXMGOyACouqNF4Y1T6XMp0E9Gj4pSGeBqIKtSrdZI23coVhlWsVS3OBEv2k9auaNOW+Fp2jlQu
Y9vKTXpWrd27GtjOrbs27t6/Jd/iHbxV71+AR/welhuYsOO7hhenNBGZkOS5jR9r5lr5cra+wzp7
Vph5s+meokc3IZGa6hIBA7J1IYOEQIE61tBxepUyJCokBiTlHu6gQIADXw4EuN2t9OnnH1OPFnyh
tSBUxhHIBogMQYAESYl7MY6E+fbw3IUTEH6ejBcFAYIbCKDgm3Po+AlKV029gvWq4rnX2/949KHH
3nsBCFAgIS9J9BtwAkYozAILDEAhQ3zlp+E8+6m22lSK4daeg7mtl96BDiwQwAABLDCggQwKt8B6
wtRozXwQ2pfhhjxK06GHH37wHx2ozKedcEqgKBFtSRYXgHbemRfhizGSwUB8NrbngHLIYYhYj2Bm
kAsfPwIZZAdDuqWEAFW2uWSWDsAnXwANtEnleY7MCOeUXIZzX5g9NrnKJG6UCWR/AKQponFdojii
iycKSMCKkpjoqJ0HOnLlnsLgGJ+XkwEa6JIbVWSGoWb2p6iBV9Z5qYDG1RepIwm4At6rrz7ohYrW
TJqNpRRaCKk3f4pqGifXELoFqmaemVf/iDCqGNuUB3p3K5WONPCpF/O5Sq2WmSKz6RdXMuBAtwjO
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
1L3yQO+3yg24zF300CsMCzsTC0p/vx+c0hEAADs=

------_=_NextPart_001_01C3970B.CBCC2436
Content-Type: image/gif;
	name="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <image001.gif@01C3971B.BDF6B8C0>
Content-Description: image001.gif
Content-Location: image001-1.gif

R0lGODlhMgObAXcAMSH+GlNvZnR3YXJlOiBNaWNyb3NvZnQgT2ZmaWNlACH5BAEAAAAALD8ANADb
AiMBgwAAAAAAAAcGBgwKCwUEBAsJCgoICQYFBQcGBwsKCggHBwMDAwkICAkHCP///wECAwT/EMhJ
q7046827/2AojmRpnmiqrmzrvnAsz25A33iu73zv/8CgcEgsngLIpDLgWC6N0Kh0Sq1ar9is1rN0
eL/gsLip3JrP6LR6zW67N8mxfC5Pvu/4vH7P76/jdIGCYHZ+hoeIiYqLjEiDj5BehYyUlZaXmJkx
gJGdj0iaoaKjpKWHjp6pkaA8Tq6vsLGys7S1tre4ubqspr2+vzOoqsOQvDdMxMnKy8zNzjbA0dLT
I8jO11/GMtbY3d7f4IPQ1OTl5sLhzePb6e3u78zr5vP0pOjwyto1+Pz9/mLy6gkc2OifOnYGEyoE
F5Cgw4d57i1UpU8Ft4kYM6ZqCLGjxzMX/zVSfBFSpMmTYTh+XMlSSkmUq/YR20Wzps2bOGPVacmz
J5SXMGOyACouqNF4Y1T6XMp0E9Gj4pSGeBqIKtSrdZI23coVhlWsVS3OBEv2k9auaNOW+Fp2jlQu
Y9vKTXpWrd27GtjOrbs27t6/Jd/iHbxV71+AR/welhuYsOO7hhenNBGZkOS5jR9r5lr5cra+wzp7
Vph5s+meokc3IZGa6hIBA7J1IYOEQIE61tBxepUyJCokBiTlHu6gQIADXw4EuN2t9OnnH1OPFnyh
tSBUxhHIBogMQYAESYl7MY6E+fbw3IUTEH6ejBcFAYIbCKDgm3Po+AlKV029gvWq4rnX2/949KHH
3nsBCFAgIS9J9BtwAkYozAILDEAhQ3zlp+E8+6m22lSK4daeg7mtl96BDiwQwAABLDCggQwKt8B6
wtRozXwQ2pfhhjxK06GHH37wHx2ozKedcEqgKBFtSRYXgHbemRfhizGSwUB8NrbngHLIYYhYj2Bm
kAsfPwIZZAdDuqWEAFW2uWSWDsAnXwANtEnleY7MCOeUXIZzX5g9NrnKJG6UCWR/AKQponFdojii
iycKSMCKkpjoqJ0HOnLlnsLgGJ+XkwEa6JIbVWSGoWb2p6iBV9Z5qYDG1RepIwm4At6rrz7ohYrW
TJqNpRRaCKk3f4pqGifXELoFqmaemVf/iDCqGNuUB3p3K5WONPCpF/O5Sq2WmSKz6RdXMuBAtwjO
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
1L3yQO+3yg24zF300CsMCzsTC0p/vx+c0hEAADs=

------_=_NextPart_001_01C3970B.CBCC2436
Content-Type: image/gif;
	name="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <image001.gif@01C39723.F0E64C20>
Content-Description: image001.gif
Content-Location: image001-2.gif

R0lGODlhMgObAXcAMSH+GlNvZnR3YXJlOiBNaWNyb3NvZnQgT2ZmaWNlACH5BAEAAAAALD8ANADb
AiMBgwAAAAAAAAcGBgwKCwUEBAsJCgoICQYFBQcGBwsKCggHBwMDAwkICAkHCP///wECAwT/EMhJ
q7046827/2AojmRpnmiqrmzrvnAsz25A33iu73zv/8CgcEgsngLIpDLgWC6N0Kh0Sq1ar9is1rN0
eL/gsLip3JrP6LR6zW67N8mxfC5Pvu/4vH7P76/jdIGCYHZ+hoeIiYqLjEiDj5BehYyUlZaXmJkx
gJGdj0iaoaKjpKWHjp6pkaA8Tq6vsLGys7S1tre4ubqspr2+vzOoqsOQvDdMxMnKy8zNzjbA0dLT
I8jO11/GMtbY3d7f4IPQ1OTl5sLhzePb6e3u78zr5vP0pOjwyto1+Pz9/mLy6gkc2OifOnYGEyoE
F5Cgw4d57i1UpU8Ft4kYM6ZqCLGjxzMX/zVSfBFSpMmTYTh+XMlSSkmUq/YR20Wzps2bOGPVacmz
J5SXMGOyACouqNF4Y1T6XMp0E9Gj4pSGeBqIKtSrdZI23coVhlWsVS3OBEv2k9auaNOW+Fp2jlQu
Y9vKTXpWrd27GtjOrbs27t6/Jd/iHbxV71+AR/welhuYsOO7hhenNBGZkOS5jR9r5lr5cra+wzp7
Vph5s+meokc3IZGa6hIBA7J1IYOEQIE61tBxepUyJCokBiTlHu6gQIADXw4EuN2t9OnnH1OPFnyh
tSBUxhHIBogMQYAESYl7MY6E+fbw3IUTEH6ejBcFAYIbCKDgm3Po+AlKV029gvWq4rnX2/949KHH
3nsBCFAgIS9J9BtwAkYozAILDEAhQ3zlp+E8+6m22lSK4daeg7mtl96BDiwQwAABLDCggQwKt8B6
wtRozXwQ2pfhhjxK06GHH37wHx2ozKedcEqgKBFtSRYXgHbemRfhizGSwUB8NrbngHLIYYhYj2Bm
kAsfPwIZZAdDuqWEAFW2uWSWDsAnXwANtEnleY7MCOeUXIZzX5g9NrnKJG6UCWR/AKQponFdojii
iycKSMCKkpjoqJ0HOnLlnsLgGJ+XkwEa6JIbVWSGoWb2p6iBV9Z5qYDG1RepIwm4At6rrz7ohYrW
TJqNpRRaCKk3f4pqGifXELoFqmaemVf/iDCqGNuUB3p3K5WONPCpF/O5Sq2WmSKz6RdXMuBAtwjO
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
1L3yQO+3yg24zF300CsMCzsTC0p/vx+c0hEAADs=

------_=_NextPart_001_01C3970B.CBCC2436
Content-Type: image/gif;
	name="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <image001.gif@01C3972D.227596C0>
Content-Description: image001.gif
Content-Location: image001-3.gif

R0lGODlhMgObAXcAMSH+GlNvZnR3YXJlOiBNaWNyb3NvZnQgT2ZmaWNlACH5BAEAAAAALD8ANADb
AiMBgwAAAAAAAAcGBgwKCwUEBAsJCgoICQYFBQcGBwsKCggHBwMDAwkICAkHCP///wECAwT/EMhJ
q7046827/2AojmRpnmiqrmzrvnAsz25A33iu73zv/8CgcEgsngLIpDLgWC6N0Kh0Sq1ar9is1rN0
eL/gsLip3JrP6LR6zW67N8mxfC5Pvu/4vH7P76/jdIGCYHZ+hoeIiYqLjEiDj5BehYyUlZaXmJkx
gJGdj0iaoaKjpKWHjp6pkaA8Tq6vsLGys7S1tre4ubqspr2+vzOoqsOQvDdMxMnKy8zNzjbA0dLT
I8jO11/GMtbY3d7f4IPQ1OTl5sLhzePb6e3u78zr5vP0pOjwyto1+Pz9/mLy6gkc2OifOnYGEyoE
F5Cgw4d57i1UpU8Ft4kYM6ZqCLGjxzMX/zVSfBFSpMmTYTh+XMlSSkmUq/YR20Wzps2bOGPVacmz
J5SXMGOyACouqNF4Y1T6XMp0E9Gj4pSGeBqIKtSrdZI23coVhlWsVS3OBEv2k9auaNOW+Fp2jlQu
Y9vKTXpWrd27GtjOrbs27t6/Jd/iHbxV71+AR/welhuYsOO7hhenNBGZkOS5jR9r5lr5cra+wzp7
Vph5s+meokc3IZGa6hIBA7J1IYOEQIE61tBxepUyJCokBiTlHu6gQIADXw4EuN2t9OnnH1OPFnyh
tSBUxhHIBogMQYAESYl7MY6E+fbw3IUTEH6ejBcFAYIbCKDgm3Po+AlKV029gvWq4rnX2/949KHH
3nsBCFAgIS9J9BtwAkYozAILDEAhQ3zlp+E8+6m22lSK4daeg7mtl96BDiwQwAABLDCggQwKt8B6
wtRozXwQ2pfhhjxK06GHH37wHx2ozKedcEqgKBFtSRYXgHbemRfhizGSwUB8NrbngHLIYYhYj2Bm
kAsfPwIZZAdDuqWEAFW2uWSWDsAnXwANtEnleY7MCOeUXIZzX5g9NrnKJG6UCWR/AKQponFdojii
iycKSMCKkpjoqJ0HOnLlnsLgGJ+XkwEa6JIbVWSGoWb2p6iBV9Z5qYDG1RepIwm4At6rrz7ohYrW
TJqNpRRaCKk3f4pqGifXELoFqmaemVf/iDCqGNuUB3p3K5WONPCpF/O5Sq2WmSKz6RdXMuBAtwjO
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
1L3yQO+3yg24zF300CsMCzsTC0p/vx+c0hEAADs=

------_=_NextPart_001_01C3970B.CBCC2436--

