From: "Gilles Yue" <gyue@novelgmt.intnet.mu>
Subject: RE: Help on IPTABLES
Date: Fri, 10 Oct 2003 10:43:55 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83055D4B014C9E478D2F04624B9E82CFD46F@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C38EF9.E0439152"
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
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C38EF9.E0439152
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Rob,=20

=20

I have made changes just like you said. And I still I cannot browse!=20

Is there something wrong with my other chain rules or with the routing
with my network cards?(Note I have two network cards) Please help.
Thanks.=20

=20

=20

Chain INPUT (policy DROP)

=20

target     prot opt source               destination

=20

RH-Lokkit-0-50-INPUT  all  --  0.0.0.0/0            0.0.0.0/0

ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:80

ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0          udp dpt:80

=20

Chain FORWARD (policy ACCEPT)

=20

target     prot opt source               destination

RH-Lokkit-0-50-INPUT  all  --  0.0.0.0/0            0.0.0.0/0

=20

Chain OUTPUT (policy ACCEPT)

=20

target     prot opt source               destination

=20

Chain RH-Lokkit-0-50-INPUT (2 references)

target     prot opt source               destination

ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0

REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp=20

dpts:0:1023 flag                                            s:0x16/0x02=20

reject-with icmp-port-unreachable

REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:2049


flags:0                                            x16/0x02 reject-with=20

icmp-port-unreachable

REJECT     udp  --  0.0.0.0/0            0.0.0.0/0          udp=20

dpts:0:1023 reje                                            ct-with=20

icmp-port-unreachable

REJECT     udp  --  0.0.0.0/0            0.0.0.0/0          udp dpt:2049


reject-                                            with=20

icmp-port-unreachable

REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp=20

dpts:6000:6009 f                                           =20

lags:0x16/0x02 reject-with icmp-port-unreachable

REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:7100


flags:0                                            x16/0x02 reject-with=20

icmp-port-unreachable

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

-----Original Message-----
From: Rob Sterenborg [mailto:rob@sterenborg.info]=20
Sent: Thursday, October 09, 2003 5:55 PM
To: Gilles Yue; netfilter@lists.netfilter.org
Subject: RE: Help on IPTABLES

=20

> Can somebody explain to me why is when i changed my Chain=20

> INPUT Rules from ACCEPT to DROP, i cannot browse the internet=20

> despite opening port 80 in the INPUT rule.

...

> Chain INPUT (policy DROP)

> target     prot opt source               destination

> RH-Lokkit-0-50-INPUT  all  --  anywhere             anywhere

> ACCEPT     tcp  --  anywhere             anywhere          =20

> tcp spt:http

> ACCEPT     udp  --  anywhere             anywhere          =20

> udp spt:http

=20

Because you used sport. You are trying to reach servers that are

*listening* on port 80/443 so you should use dport (destination =3D port

80/443). You are most likely not sending from port 80/443.

=20

=20

Gr,

Rob

=20


------_=_NextPart_001_01C38EF9.E0439152
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
10.0pt'>Hi Rob, </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>I have made changes just like you said. And I still I cannot =
browse! </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Is there something wrong with my other chain rules or with the =
routing
with my network cards?(Note I have two network cards) Please help. =
Thanks. </span></font></p>

<p class=3DMsoPlainText><b><font size=3D2 face=3D"Courier New"><span
style=3D'font-size:11.0pt;font-weight:bold'>&nbsp;</span></font></b></p>

<p class=3DMsoPlainText><b><font size=3D2 face=3D"Courier New"><span
style=3D'font-size:11.0pt;font-weight:bold'>&nbsp;</span></font></b></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><b><font size=3D3 =
color=3Dred
face=3D"Courier New"><span =
style=3D'font-size:12.0pt;font-family:"Courier New";
color:red;font-weight:bold'>Chain INPUT (policy =
DROP)</span></font></b></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>target&nbsp;&nbsp;&nbsp;&nbsp;
prot opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>RH-Lokkit-0-50-INPUT&nbsp;
all&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp;
tcp&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tcp dpt:80</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp;
udp&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
udp dpt:80</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><b><font size=3D3 =
color=3Dred
face=3D"Courier New"><span =
style=3D'font-size:12.0pt;font-family:"Courier New";
color:red;font-weight:bold'>Chain FORWARD (policy =
ACCEPT)</span></font></b></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>target&nbsp;&nbsp;&nbsp;&nbsp;
prot opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>RH-Lokkit-0-50-INPUT&nbsp;
all&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><b><font size=3D3 =
color=3Dred
face=3D"Courier New"><span =
style=3D'font-size:12.0pt;font-family:"Courier New";
color:red;font-weight:bold'>Chain OUTPUT (policy =
ACCEPT)</span></font></b></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>target&nbsp;&nbsp; =
&nbsp;&nbsp;prot
opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>Chain =
RH-Lokkit-0-50-INPUT
(2 references)</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>target&nbsp;&nbsp;&nbsp;&nbsp;
prot opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp;
all&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>REJECT&nbsp;&nbsp;&nbsp;&nbsp;
tcp&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tcp </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>dpts:0:1023
flag&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
s:0x16/0x02 </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>reject-with =
icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>REJECT&nbsp;&nbsp;&nbsp;&nbsp;
tcp&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tcp dpt:2049 </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>flags:0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
x16/0x02 reject-with </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>REJECT&nbsp;&nbsp;&nbsp;&nbsp;
udp&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
udp </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>dpts:0:1023 =
reje&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
ct-with </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>REJECT&nbsp;&nbsp;&nbsp;&nbsp;
udp&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
udp dpt:2049 </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>reject-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
with </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>REJECT&nbsp;&nbsp;&nbsp;&nbsp;
tcp&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tcp </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>dpts:6000:6009
f&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>lags:0x16/0x02 =
reject-with icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>REJECT&nbsp;&nbsp;&nbsp;&nbsp;
tcp&nbsp; --&nbsp;
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tcp dpt:7100 </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>flags:0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
x16/0x02 reject-with </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><b><font size=3D2 face=3D"Courier New"><span
style=3D'font-size:11.0pt;font-weight:bold'>&nbsp;</span></font></b></p>

<p class=3DMsoPlainText><b><font size=3D2 face=3D"Courier New"><span
style=3D'font-size:11.0pt;font-weight:bold'>&nbsp;</span></font></b></p>

<p class=3DMsoPlainText><b><font size=3D2 face=3D"Courier New"><span
style=3D'font-size:11.0pt;font-weight:bold'>&nbsp;</span></font></b></p>

<p class=3DMsoPlainText><b><font size=3D2 face=3D"Courier New"><span
style=3D'font-size:11.0pt;font-weight:bold'>&nbsp;</span></font></b></p>

<p class=3DMsoPlainText><b><font size=3D2 face=3D"Courier New"><span
style=3D'font-size:11.0pt;font-weight:bold'>&nbsp;</span></font></b></p>

<p class=3DMsoPlainText><b><font size=3D2 face=3D"Courier New"><span
style=3D'font-size:11.0pt;font-weight:bold'>&nbsp;</span></font></b></p>

<p class=3DMsoPlainText><b><font size=3D2 face=3D"Courier New"><span
style=3D'font-size:11.0pt;font-weight:bold'>&nbsp;</span></font></b></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>-----Original Message-----<br>
From: Rob Sterenborg [mailto:rob@sterenborg.info] <br>
Sent: </span></font>Thursday, October 09, 2003 5:55 PM<br>
To: Gilles Yue; netfilter@lists.netfilter.org<br>
Subject: RE: Help on IPTABLES</p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; Can somebody explain to me why is when i changed my Chain =
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; INPUT Rules from ACCEPT to DROP, i cannot browse the =
internet </span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; despite opening port 80 in the INPUT =
rule.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>...</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; Chain INPUT (policy DROP)</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
destination</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; RH-Lokkit-0-50-INPUT&nbsp; all&nbsp; --&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
anywhere</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; tcp spt:http</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&gt; udp spt:http</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Because you used sport. You are trying to reach servers that =
are</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>*listening* on port 80/443 so you should use dport (destination =
=3D port</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>80/443). You are most likely not sending from port =
80/443.</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Gr,</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>Rob</span></font></p>

<p class=3DMsoPlainText><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:
10.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C38EF9.E0439152--

