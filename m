From: "Chris Miller" <cmiller@compuville.net>
Subject: PPTP reviisted
Date: Sun, 28 Sep 2003 01:56:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1A3UZL-000289-3y@bear.dns-nac-zone.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C38563.AFAEA260"
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

------=_NextPart_000_000D_01C38563.AFAEA260
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I've seen a few things in the netfilter archive about PPTP, but no one has
ever really said anything about getting it to work.

 

Here's the deal: I've got a Windows box (192.168.1.10) sitting behind my
Linux firewall. On the firewall runs Debian Woody with iptables 1.2.6a. The
Linux box acts as a NAT to all the hosts behind it. Currently I forward TCP
port 1723 to 192.168.1.10, but clients cannot connect. I know it's got
something to do with GRE?

 

I saw something on Google about an ip_conntrac_pptp module, or something to
that nature, but I've not been able to find it anywhere. I'd love to compile
it and give it a try if it's made to fix this issue.

 

So could someone fill me in with what my options are as far as getting my
VPN working through my NAT? What exactly is going on?

 

 

Thanks,

 

Chris Miller

Compuville Computers

www.compuville.net

423.276.6692

 


------=_NextPart_000_000D_01C38563.AFAEA260
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
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
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
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
font-family:Arial'>I&#8217;ve seen a few things in the netfilter archive =
about
PPTP, but no one has ever really said anything about getting it to =
work.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Here&#8217;s the deal: I&#8217;ve got a Windows box
(192.168.1.10) sitting behind my Linux firewall. On the firewall runs =
Debian
Woody with iptables 1.2.6a. The Linux box acts as a NAT to all the hosts =
behind
it. Currently I forward TCP port 1723 to 192.168.1.10, but clients =
cannot
connect. I know it&#8217;s got something to do with =
GRE?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I saw something on Google about an ip_conntrac_pptp =
module,
or something to that nature, but I&#8217;ve not been able to find it =
anywhere.
I&#8217;d love to compile it and give it a try if it&#8217;s made to fix =
this
issue.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>So could someone fill me in with what my options are =
as far
as getting my VPN working through my NAT? What exactly is going =
on?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,<o:p></o:p></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Chris Miller<o:p></o:p></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Compuville Computers<o:p></o:p></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>www.compuville.net<o:p></o:p></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>423.276.6692<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_000D_01C38563.AFAEA260--


