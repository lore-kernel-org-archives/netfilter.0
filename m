From: "Geoff Mulligan" <geoff@mulligan.com>
Subject: transparent bridging and redirection?
Date: Sat, 17 Jan 2004 00:21:32 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01f501c3dcca$88b93710$0e5ce9c7@sony>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01F6_01C3DC8F.DC5BE5B0"
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

------=_NextPart_000_01F6_01C3DC8F.DC5BE5B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is it possible to set up an Ethernet-bridge-netfilter so that it doesn't
have an IP address except localhost 127.0.0.1 or a non routable address =
such
as 192.168.xx.xx and use the netfilter iptables or ebtables target =
REDIRECT
to "intercept" connections to port 22 and handle them on the bridge =
device
itself and transparent pass all other traffic across the bridge.

=20

I was thinking that I could use the REDIRECT target to redirect port 22 =
with
the dest ip address getting rewritten to 127.0.0.1 or even a 192.168 =
address
coming in on one interface and then have the bridge respond and have it
rewrite the source address on the outbound side to the original dest =
addr.

=20

This way I could plug in this transparent bridge without having to =
configure
or know the ipaddress of the external router or the ipaddress of the =
machine
on the internal lan and still be able to intercept certain =
ports/services.

=20

=20

            Thanks,

                        Geoff

=20

=20

=20


------=_NextPart_000_01F6_01C3DC8F.DC5BE5B0
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

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Is it possible to set up an Ethernet-bridge-netfilter =
so
that it doesn&#8217;t have an IP address except localhost 127.0.0.1 or a =
non
routable address such as 192.168.xx.xx and use the netfilter iptables or =
ebtables
target REDIRECT to &#8220;intercept&#8221; connections to port 22 and =
handle
them on the bridge device itself and transparent pass all other traffic =
across
the bridge.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I was thinking that I could use the REDIRECT target =
to
redirect port 22 with the dest ip address getting rewritten to 127.0.0.1 =
or
even a 192.168 address coming in on one interface and then have the =
bridge
respond and have it rewrite the source address on the outbound side to =
the
original dest addr.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>This way I could plug in this transparent bridge =
without
having to configure or know the ipaddress of the external router or the =
ipaddress
of the machine on the internal lan and still be able to intercept =
certain
ports/services.</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;
Thanks,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
Geoff</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

</div>

</body>

</html>

------=_NextPart_000_01F6_01C3DC8F.DC5BE5B0--


