From: "Gilles Yue" <gyue@novelgmt.intnet.mu>
Subject: RE: Help on IPTABLES
Date: Mon, 13 Oct 2003 16:09:20 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83055D4B014C9E478D2F04624B9E82CFD475@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C39182.D5293C32"
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
To: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C39182.D5293C32
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Leonardo,

                        Thanks for your reply.

=20

I've just allowed port 53/443 as well. Still cannot browse. Do u think =
it's got something to do with the routing of my two network cards.

=20

                        When I change my INPUT chain to accept all, =
browsing works. (Note I am talking about browsing on the host where =
iptables has been installed)

=20

                        Or do I have to insert a new rule to enable NAT. =
Below is my chain rules. Thanks for replying.

=20

gilles

=20

=20

Chain INPUT (policy DROP)

target     prot opt source               destination

RH-Lokkit-0-50-INPUT  all  --  0.0.0.0/0            0.0.0.0/0

ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:80

ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0          udp dpt:80

ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:443

ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0          udp dpt:443

ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp spt:53

ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0          udp spt:53

=20

Chain FORWARD (policy ACCEPT)

target     prot opt source               destination

RH-Lokkit-0-50-INPUT  all  --  0.0.0.0/0            0.0.0.0/0

=20

Chain OUTPUT (policy ACCEPT)

target     prot opt source               destination

=20

Chain RH-Lokkit-0-50-INPUT (2 references)

target     prot opt source               destination

ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0

REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp=20

dpts:0:1023 flags:0x16/0x02 reject-with icmp-port-unreachable

REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:2049 =


flags:0x16/0x02 reject-with icmp-port-unreachable

REJECT     udp  --  0.0.0.0/0            0.0.0.0/0          udp=20

dpts:0:1023 reject-with icmp-port-unreachable

REJECT     udp  --  0.0.0.0/0            0.0.0.0/0          udp dpt:2049 =


reject-with icmp-port-unreachable

REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp=20

dpts:6000:6009 flags:0x16/0x02 reject-with icmp-port-unreachable

REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:7100 =


flags:0x16/0x02 reject-with icmp-port-unreachable

=20

=20

=20

=20

-----Original Message-----
From: Leonardo Rodrigues Magalh=E3es [mailto:leolistas@solutti.com.br]=20
Sent: Saturday, October 11, 2003 6:33 PM
To: info; netfilter@lists.netfilter.org
Subject: Re: Help on IPTABLES

=20

=20

    You'll probably browse with no problems if you use IP addresses. If =
you try to browse using names (www.something.com), you'll need to do a =
DNS request for the IP of that hostname. The request will go out with no =
problems, as OUTPUT is ACCEPT. But DNS reply will be blocked, as INPUT =
only allows port 80 traffic.

=20

    For allowing web browsing ONLY, you'll have to allow AT LEAST =
packets with source port 53 (TCP and UDP - almost all will be UDP but =
TCP can be also used). Dont forget HTTPS too, which is port 443.

=20

    You should also analyse the RH-Lokkit-0-50-INPUT chain. As packets =
are getting to this chain BEFORE reaching your rules, if something gets =
blocked there, it will NEVER reach YOUR rules.

=20

    For static rules, you can create them on /etc/rc.d/rc.local. This =
file will be executed after ALL daemons got UP on the reboot process.

=20

    Sincerily,

    Leonardo Rodrigues

=20

	----- Original Message -----=20

	From: info <mailto:info@novelgmt.intnet.mu> =20

	To: netfilter@lists.netfilter.org=20

	Sent: Thursday, October 09, 2003 9:20 AM

	Subject: Help on IPTABLES

	=20

	hi all,
=09
	 Can somebody explain to me why is when i changed my Chain INPUT Rules =
from ACCEPT to DROP, i cannot browse the internet despite opening port =
80 in the INPUT rule.
	However, when Chain INPUT is changed to ACCEPT, browsing the internet =
works fine. (Note: CHAIN Output is accept for ALL)
=09
=09
	The configurations on my IPTABLES are as follows
=09
	Chain INPUT (policy DROP)
	target     prot opt source               destination
	RH-Lokkit-0-50-INPUT  all  --  anywhere             anywhere
	ACCEPT     tcp  --  anywhere             anywhere           tcp =
spt:http
	ACCEPT     udp  --  anywhere             anywhere           udp =
spt:http
=09
	Note that my OUTPUT Rules are as follows:
=09
	Chain OUTPUT (policy ACCEPT)
	target     prot opt source               destination
=09
	I have two network cards installed on my pc - running Red Hat 9.0
=09
	Routing for static routes are follows:
=09
	xx.yy.zz.aa        0.0.0.0         255.255.255.0       U     0      0   =
     0 eth0
	xx.0.0.0           0.0.0.0         255.0.0.0           U     0      0   =
     0 eth1
	127.0.0.0          0.0.0.0         255.0.0.0           U     0      0   =
     0 lo
	0.0.0.0            zz.zz.zz.zz       0.0.0.0           UG    0      0   =
     0 eth0
	0.0.0.0            zz.zz.zz.zz       0.0.0.0           UG    0      0   =
     0 eth1
=09
	where zz.zz.zz.zz is my gateway to the internet.
	eth0 - Interface with local address
	eth1 - Interface with Internet address.
=09
	By the way, is there a way to save static routes because when i reboot =
my pc, all routes are lost.
=09
	Thanks for any help.
=09
	guy
=09
=09


------_=_NextPart_001_01C39182.D5293C32
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
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
	{color:blue;
	text-decoration:underline;}
span.EmailStyle17
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

<body bgcolor=3Dwhite lang=3DEN-US link=3Dblue vlink=3Dblue>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Dear Leonardo,</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Thanks for your
reply.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in;text-indent:.5in'><font =
size=3D2
color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>I&#8217;ve just allowed port 53/443 as well. Still cannot =
browse. Do
u think it&#8217;s got something to do with the routing of my two =
network
cards.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 When I change my
INPUT chain to accept all, browsing works. (Note I am talking about =
browsing on
the host where iptables has been installed)</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Or do I have to
insert a new rule to enable NAT. Below is my chain rules. Thanks for =
replying.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>gilles</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><b><font size=3D2 =
color=3Dred
face=3D"Courier New"><span =
style=3D'font-size:11.0pt;font-family:"Courier New";
color:red;font-weight:bold'>Chain INPUT (policy =
DROP)</span></font></b></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>target=A0=A0=A0=A0 =
prot opt
source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
destination</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>RH-Lokkit-0-50-INPUT=A0 all=A0
--=A0 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>ACCEPT=A0=A0=A0=A0 =
tcp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp dpt:80</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>ACCEPT=A0=A0=A0=A0 =
udp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 udp dpt:80</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>ACCEPT=A0=A0=A0=A0 =
tcp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp dpt:443</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>ACCEPT=A0=A0=A0=A0 =
udp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 udp dpt:443</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>ACCEPT=A0=A0=A0=A0 =
tcp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp spt:53</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>ACCEPT=A0=A0=A0=A0 =
udp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 udp spt:53</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><b><font size=3D2 =
color=3Dred
face=3D"Courier New"><span =
style=3D'font-size:11.0pt;font-family:"Courier New";
color:red;font-weight:bold'>Chain FORWARD (policy =
ACCEPT)</span></font></b></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>target=A0=A0=A0=A0 =
prot opt
source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
destination</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>RH-Lokkit-0-50-INPUT=A0 all=A0
--=A0 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><b><font size=3D2 =
color=3Dred
face=3D"Courier New"><span =
style=3D'font-size:11.0pt;font-family:"Courier New";
color:red;font-weight:bold'>Chain OUTPUT (policy =
ACCEPT)</span></font></b></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>target=A0=A0=A0=A0 =
prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
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
style=3D'font-size:10.0pt;font-family:"Courier New"'>target=A0=A0=A0=A0 =
prot opt
source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
destination</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>ACCEPT=A0=A0=A0=A0 =
all=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0.0.0.0/0</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>REJECT=A0=A0=A0=A0 =
tcp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>dpts:0:1023 =
flags:0x16/0x02
reject-with icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>REJECT=A0=A0=A0=A0 =
tcp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp dpt:2049 </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>flags:0x16/0x02 =
reject-with icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>REJECT=A0=A0=A0=A0 =
udp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 udp </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>dpts:0:1023 =
reject-with icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>REJECT=A0=A0=A0=A0 =
udp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 udp dpt:2049 </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>reject-with =
icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>REJECT=A0=A0=A0=A0 =
tcp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>dpts:6000:6009
flags:0x16/0x02 reject-with icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>REJECT=A0=A0=A0=A0 =
tcp=A0 --=A0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp dpt:7100 </span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier New"'>flags:0x16/0x02 =
reject-with icmp-port-unreachable</span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;font-family:"Courier =
New"'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Leonardo Rodrigues =
Magalh=E3es
[mailto:leolistas@solutti.com.br] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Saturday, October =
11, 2003
6:33 PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> info;
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Re: Help on =
IPTABLES</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp; You'll =
probably
browse with no problems if you use IP addresses. If you try to browse =
using
names (<a href=3D"http://www.something.com">www.something.com</a>), =
you'll need
to do a DNS request for the IP of that hostname. The request will go out =
with no
problems, as OUTPUT is ACCEPT. But DNS reply will be blocked, as INPUT =
only
allows port 80 traffic.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp; For =
allowing web
browsing ONLY, you'll have to allow AT LEAST packets with source port 53 =
(TCP
and UDP - almost all will be UDP but TCP can be also used). Dont forget =
HTTPS
too, which is port 443.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp; You =
should also
analyse the RH-Lokkit-0-50-INPUT chain. As packets are getting to this
chain&nbsp;BEFORE reaching your rules, if something gets blocked there, =
it will
NEVER reach YOUR rules.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp; For =
static rules,
you can create them on /etc/rc.d/rc.local. This file will be executed =
after ALL
daemons got UP on the reboot process.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp; =
Sincerily,</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp; Leonardo
Rodrigues</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<blockquote style=3D'border:none;border-left:solid black =
1.5pt;padding:0in 0in 0in 4.0pt;
margin-left:3.75pt;margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt'=
>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>----- Original Message =
----- </span></font></p>

</div>

<div style=3D'font-color:black'>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;background:#E4E4E4'><b><font size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>From:</span=
></font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> <a
href=3D"mailto:info@novelgmt.intnet.mu" =
title=3D"info@novelgmt.intnet.mu">info</a> </span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>To:</span><=
/font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> <a
href=3D"mailto:netfilter@lists.netfilter.org"
title=3D"netfilter@lists.netfilter.org">netfilter@lists.netfilter.org</a>=
 </span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>Sent:</span=
></font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> Thursday,
October 09, 2003 9:20 AM</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>Subject:</s=
pan></font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> Help on
IPTABLES</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<p class=3DMsoNormal =
style=3D'margin-right:0in;margin-bottom:12.0pt;margin-left:
.5in'><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>hi
all,<br>
<br>
&nbsp;Can somebody explain to me why is when i changed my Chain INPUT =
Rules
from ACCEPT to DROP, i cannot browse the internet despite opening port =
80 in
the INPUT rule.<br>
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
target&nbsp;&nbsp;&nbsp;&nbsp; prot opt
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
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp
spt:http<br>
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp
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
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
255.255.255.0&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
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
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
zz.zz.zz.zz &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0 eth0<br>
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
zz.zz.zz.zz &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0 eth1</span></font><br>
<br>
where zz.zz.zz.zz is my gateway to the internet.<br>
eth0 - Interface with local address<br>
eth1 - Interface with Internet address.<br>
<br>
By the way, is there a way to save static routes because when i reboot =
my pc,
all routes are lost.<br>
<br>
Thanks for any help.<br>
<br>
guy<br>
<br>
</p>

</blockquote>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C39182.D5293C32--

