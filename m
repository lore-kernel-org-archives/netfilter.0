From: "Richard Bankhead" <rbankhead@texas-adventist.org>
Subject: ip address forwarding
Date: Thu, 13 Mar 2003 07:48:35 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <80FD1A3D95C76849ABCAA7A2FEAC744802286F@is-exchange.texas-adventist.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002F_01C2E934.F3EB23C0"
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

------=_NextPart_000_002F_01C2E934.F3EB23C0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

 

I am trying to set up a one-to-one mapping for selected addresses
through my iptables natted router (i.e. 10.42.0.99 would have a static
map through my iptables router to a valid ip address on the wan side).
The problem I am having is that while I can ping the nat ip I do not
seem to be able to access services beyond the nat router.  Obviously I
am a newbie to iptables.any help/constructive criticism would be greatly
appreciated. Here is the code I am using:

 

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

iptables -A FORWARD -I eth0 -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

route add -net 10.42.0.0 netmask 255.255.0.0 gw 10.42.0.1 dev eth0

iptables -t nat -A PREROUTING  -i eth1 -d 64.x.x.x  -j DNAT
--to-destination 10.42.0.99

iptables -t nat -A POSTROUTING -s 10.42.0.99 -o eth1 -j SNAT --to
64.x.x.x

ip address add 64.x.x.x dev eth1

 

Thanks

 

Richard


------=_NextPart_000_002F_01C2E934.F3EB23C0
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
font-family:Arial'>Hi all,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I am trying to set up a one-to-one mapping for =
selected
addresses through my iptables natted router (i.e. 10.42.0.99 would have =
a
static map through my iptables router to a valid ip address on the wan
side).&nbsp; The problem I am having is that while I can ping the nat ip =
I do
not seem to be able to access services beyond the nat router. =
&nbsp;Obviously I
am a newbie to iptables&#8230;any help/constructive criticism would be =
greatly
appreciated. Here is the code I am using:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>iptables &#8211;t nat &#8211;A POSTROUTING &#8211;o =
eth1 &#8211;j
MASQUERADE</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>iptables &#8211;A FORWARD &#8211;I eth0 &#8211;j =
ACCEPT</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>echo 1 &gt; =
/proc/sys/net/ipv4/ip_forward</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>route add &#8211;net 10.42.0.0 netmask 255.255.0.0 gw
10.42.0.1 dev eth0</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>iptables -t nat -A PREROUTING&nbsp; -i eth1 -d =
64.x.x.x&nbsp;
-j DNAT&nbsp; --to-destination 10.42.0.99</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>iptables -t nat -A POSTROUTING -s 10.42.0.99 -o eth1 =
-j SNAT
--to 64.x.x.x</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>ip address add 64.x.x.x dev eth1</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Richard</span></font></p>

</div>

</body>

</html>

------=_NextPart_000_002F_01C2E934.F3EB23C0--


