From: "Gilles Yue" <gyue@novelgmt.intnet.mu>
Subject: Help on IPTABLES
Date: Thu, 9 Oct 2003 16:24:03 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83055D4B014C9E478D2F04624B9E82CF39E7D2@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C38E60.39AD946C"
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

------_=_NextPart_001_01C38E60.39AD946C
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Can somebody explain to me why is when i changed my Chain INPUT Rules
from ACCEPT to DROP, i cannot browse the internet despite opening port
80 in the INPUT rule.
However, when Chain INPUT is changed to ACCEPT, browsing the internet
works fine. (Note: CHAIN Output is accept for ALL)


The configurations on my IPTABLES are as follows

Chain INPUT (policy DROP)
target     prot opt source               destination
RH-Lokkit-0-50-INPUT  all  --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:http
ACCEPT     udp  --  anywhere             anywhere           udp spt:http

Note that my OUTPUT Rules are as follows:

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

I have two network cards installed on my pc - running Red Hat 9.0

Routing for static routes are follows:

xx.yy.zz.aa        0.0.0.0         255.255.255.0       U     0      0
0 eth0
xx.0.0.0           0.0.0.0         255.0.0.0           U     0      0
0 eth1
127.0.0.0          0.0.0.0         255.0.0.0           U     0      0
0 lo
0.0.0.0            zz.zz.zz.zz       0.0.0.0           UG    0      0
0 eth0
0.0.0.0            zz.zz.zz.zz       0.0.0.0           UG    0      0
0 eth1

Where zz.zz.zz.zz is my gateway to the internet.
eth0 - Interface with local address
eth1 - Interface with Internet address.

By the way, is there a way to save static routes because when i reboot
my pc, all routes are lost.

Thanks for any help.

gilles



=20

  _____ =20

=20

=20


------_=_NextPart_001_01C38E60.39AD946C
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
12.0pt'>Hi all,<br>
<br>
Can somebody explain to me why is when i changed my Chain INPUT Rules =
from
ACCEPT to DROP, i cannot browse the internet despite opening port 80 in =
the
INPUT rule.<br>
However, when Chain INPUT is changed to ACCEPT, browsing the internet =
works
fine. (Note: CHAIN Output is accept for ALL)<br>
<br>
<br>
The configurations on my IPTABLES are as follows<br>
<br>
<b><u><font color=3D"#ff6600"><span =
style=3D'color:#FF6600;font-weight:bold'>Chain
INPUT (policy DROP)</span></font></u></b><br>
target&nbsp;&nbsp;&nbsp;&nbsp; prot opt =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination<br>
RH-Lokkit-0-50-INPUT&nbsp; all&nbsp; --&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
anywhere<br>
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
spt:http<br>
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp =
spt:http<br>
<br>
Note that my OUTPUT Rules are as follows:<br>
<font color=3D"#ff6600"><span style=3D'color:#FF6600'><br>
<b><u><span style=3D'font-weight:bold'>Chain OUTPUT (policy =
ACCEPT)</span></u></b></span></font><br>
target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination<br>
<br>
I have two network cards installed on my pc - running Red Hat 9.0<br>
<br>
Routing for static routes are follows:<br>
<br>
</span></font><font face=3D"Courier New"><span =
style=3D'font-family:"Courier New"'>xx.yy.zz.aa
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
255.255.255.0&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth0<br>
xx.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0 eth1<br>
127.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0 lo<br>
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; =
zz.zz.zz.zz
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth0<br>
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; =
zz.zz.zz.zz
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth1</span></font><br>
<br>
Where zz.zz.zz.zz is my gateway to the internet.<br>
eth0 - Interface with local address<br>
eth1 - Interface with Internet address.<br>
<br>
By the way, is there a way to save static routes because when i reboot =
my pc,
all routes are lost.<br>
<br>
Thanks for any help.<br>
<br>
gilles<br>
<br>
</p>

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
=00
------_=_NextPart_001_01C38E60.39AD946C--

