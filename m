From: "Sowmya Manjanatha" <Sowmya@bluesocket.com>
Subject: Regarding targeting user defined chains to NAT rules!
Date: Thu, 21 Nov 2002 15:42:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E9E0883EC39C7A498783D8C721F0073813815C@mail01.bluesocket.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2919E.82E4BDD7"
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

------_=_NextPart_001_01C2919E.82E4BDD7
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hi all,

=20

I am trying to source NAT connections based on a user-defined chain.
For example,=20

=20

Let us say, the following rules were in my user-defined chain.

=20

User_chain_1:

=20

1)       Accept all HTTP requests=20

2)       Reject all FTP requests

3)       Reject all ICMP requests

4)       Accept all DNS requests

5)       Accept all DHCP requests

=20

If an incoming connection met all the criterion above, then change the
source address of the packet to

50.2.1.2.

=20

Currently, the filter table TARGET cannot be cross-referenced to a NAT
table rule.  Therefore, I could not

connect the above user-defined chain and NAT rule that way.  Is this
possible using the new ROUTE patch

i.e is it possible for me to ROUTE all packets matching the above
criteria to a specific interface (let's say a=20

virtual interface) that will NAT all the incoming packets to its
address.

=20

I would greatly appreciate it if someone can tell me if it's possible at
all to NAT based on a user-defined chain

without any extra kernel hacking at this point in time.

=20

Thanks,

Sowmya.

=20

=20


------_=_NextPart_001_01C2919E.82E4BDD7
Content-Type: text/html;
	charset="US-ASCII"
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
 /* List Definitions */
 ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
font-family:Arial'>I am trying to source NAT connections based on a
user-defined chain.&nbsp; For example, </span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Let us say, the following rules were in my =
user-defined
chain.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>User_chain_1:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:33.0pt;text-indent:-.25in'><font size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'>1)<font =
size=3D1
face=3D"Times New Roman"><span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></span></font><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>Accept all HTTP requests </span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:33.0pt;text-indent:-.25in'><font size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'>2)<font =
size=3D1
face=3D"Times New Roman"><span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></span></font><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>Reject all FTP requests</span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:33.0pt;text-indent:-.25in'><font size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'>3)<font =
size=3D1
face=3D"Times New Roman"><span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></span></font><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>Reject all ICMP requests</span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:33.0pt;text-indent:-.25in'><font size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'>4)<font =
size=3D1
face=3D"Times New Roman"><span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></span></font><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>Accept all DNS requests</span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:33.0pt;text-indent:-.25in'><font size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'>5)<font =
size=3D1
face=3D"Times New Roman"><span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></span></font><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>Accept all DHCP requests</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>If an incoming connection met all the criterion =
above, then
change the source address of the packet to</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>50.2.1.2.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Currently, the filter table TARGET cannot be
cross-referenced to a NAT table rule.&nbsp; Therefore, I could =
not</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>connect the above user-defined chain and NAT rule =
that
way.&nbsp; Is this possible using the new ROUTE patch</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>i.e is it possible for me to ROUTE all packets =
matching the
above criteria to a specific interface (let&#8217;s say a =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>virtual interface) that will NAT all the incoming =
packets to
its address.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I would greatly appreciate it if someone can tell me =
if it&#8217;s
possible at all to NAT based on a user-defined chain</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>without any extra kernel hacking at this point in =
time.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Sowmya.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C2919E.82E4BDD7--

