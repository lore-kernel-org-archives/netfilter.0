From: "Stanislav Puffler DiS." <stanislav.puffler@seznam.cz>
Subject: tcp packets on 25 port FORWARDING
Date: Fri, 12 Mar 2004 10:46:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1B1jEu-0002TS-U9@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0041_01C4081F.4DB6F1E0"
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

------=_NextPart_000_0041_01C4081F.4DB6F1E0
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi there,

I need to forward all tcp packets with port 25 (SMTP) from Internet to
machine in my network. My settings (eth0 =3D internet IP, eth1 =3D =
192.168.200.1
- dmz IP connected to another machine with Postfix, eth2 =3D 192.168.0.1 =
-
gateway - LAN). Have opened port 25 and setup rule :

=20

iptables -t nat -A PREROUTING -p tcp -dport 25 - i eth0 -j DNAT -to
192.168.200.2:85

=20

iptables -A FORWARD -i eth0 -p tcp -d 192:168.200.2 -dport 25 -m state
-state NEW,ESTABLISHED,RELATED -j ACCEPT

=20

But it still doesn=B4t route tcp packets on port 25 to my Postfix =
computer :o(
If I try telnet 192.168.200.2 25 from FW it works, if I try this from
Internet, it doesn=B4t work :o( Any ideas ? Thanks a lot.

Stan.

=20


------=_NextPart_000_0041_01C4081F.4DB6F1E0
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-2">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.StylE-mailovZprvy17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DCS link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hi there,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I need to forward all tcp packets with port 25 (SMTP) =
from
Internet to machine in my network. My settings (eth0 =3D internet IP, =
eth1 =3D
192.168.200.1 - dmz IP connected to another machine with Postfix, eth2 =
=3D
192.168.0.1 &#8211; gateway - LAN). Have opened port 25 and setup rule =
:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>iptables &#8211;t nat &#8211;A PREROUTING &#8211;p =
tcp
&#8211;dport 25 &#8211; i eth0 &#8211;j DNAT &#8211;to =
192.168.200.2:85<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>iptables &#8211;A FORWARD &#8211;i eth0 &#8211;p tcp
&#8211;d 192:168.200.2 &#8211;dport 25 &#8211;m state &#8211;state
NEW,ESTABLISHED,RELATED &#8211;j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>But it still doesn=B4t route tcp packets on port 25 =
to my
Postfix computer :o( If I try telnet 192.168.200.2 25 from FW it works, =
if I
try this from Internet, it doesn=B4t work :o( Any ideas ? Thanks a =
lot&#8230;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Stan.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0041_01C4081F.4DB6F1E0--


