From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: IPTABLES & POLICYS
Date: Tue, 10 Jun 2003 11:34:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DCF@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C32F7E.E0B4DC01"
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
To: ENGEL Gerald <aon.912164494.engel@aon.at>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C32F7E.E0B4DC01
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The three tables are to be used for different purposes.

=20

The filter table is the ONLY table you should be blocking traffic on.
With the standard 3 chains, you should be able to do any type of
non-trivial blocking under the sun. If you need different match rules,
use ebtables or iptables extensions.

=20

The NAT table is only supposed to manipulate the source and destinations
of the traffic coming into and out of the firewall. Blocking input and
forward is still 100% coverage of inbound traffic, so blocking NAT just
makes an unnecessary rule that system was not designed for.

=20

The Mangle table changes everything else not relating to address
redirection or filtering traffic. I have about 100 rules defined, and I
don't have 1 mangle. I think it is more of a specialized table better
suited for tricky situations.

=20

In conclusion, yes iptables is good in that you don't have to hack
around with a bunch of different tables/chains to get things to work,
but you do need to know which ones to do what you want things to do it
in.

=20

-----Original Message-----
From: ENGEL Gerald [mailto:aon.912164494.engel@aon.at]=20
Sent: Sunday, June 08, 2003 6:14 AM
To: netfilter@lists.netfilter.org
Subject: IPTABLES & POLICYS

=20

Hi,

hope my English is ok, i have some questions;

=20

Starting situation: I use red hat 9 Linux as a gateway firewall to route
my private LAN via ADSL to the internet;

Gateway has 2 network interfaces, one for internal, and one for the
connection to the alcatel modem;

=20

I built up my firewall very similar to the firewall in Robert Zieglers
book "Linux Firewalls 2 nd edition"=20

All policies for the 3 tables are set to DROP, I allow only special
protocols and services;

I don't use a rule for the mangle table and just one rule for the Nat
table > masquerade rule for snat;

=20

When I start my firewall script I even can not ping the lo interface but
actually I have the rules in the filter table to allow a ping to=20

this interface (this rules stand bevor the policy rules in the my
firewallscript) ;

When I set only the policies of the Nat and mangle table to ACCEPT and
let the filter table policies on DROP, then the firewall works very
well(I have internet connection from al pc of the private LAN and I can
ping everything) ;

=20

How comes?

What has the Mangle and Nat table to do with pinging the local host, I
thought the advantage of iptables is the fact, that every packet passes
just one

chain and only local host packets need to go via 2 chains;

=20

And that is the point, when I put the policies of Nat chains and Mangle
chains to DROP nothing is allowed any more > it seems that I lost rules
in this chain, but why does packets go to the chains of Mangle and
Nat(exception is the postrouting chain of Nat, were masquerade take
place)

=20

If anyone knows were the problem is, please let me know.

=20

Thank you

=20

Gerald

=20

=20


------_=_NextPart_001_01C32F7E.E0B4DC01
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
 /* Font Definitions */
 @font-face
	{font-family:PMingLiU;
	panose-1:2 2 3 0 0 0 0 0 0 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 2 3 0 0 0 0 0 0 0;}
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
span.EmailStyle19
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 56.7pt 70.85pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>The three tables are to be used for
different purposes.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>The filter table is the ONLY table =
you
should be blocking traffic on. With the standard 3 chains, you should be =
able
to do any type of non-trivial blocking under the sun. If you need =
different
match rules, use ebtables or iptables extensions.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>The NAT table is only supposed to
manipulate the source and destinations of the traffic coming into and =
out of
the firewall. Blocking input and forward is still 100% coverage of =
inbound traffic,
so blocking NAT just makes an unnecessary rule that system was not =
designed
for.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>The Mangle table changes everything =
else
not relating to address redirection or filtering traffic. I have about =
100 rules
defined, and I don&#8217;t have 1 mangle. I think it is more of a =
specialized
table better suited for tricky situations.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>In conclusion, yes iptables is good =
in
that you don&#8217;t have to hack around with a bunch of different =
tables/chains
to get things to work, but you do need to know which ones to do what you =
want
things to do it in.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> ENGEL Gerald
[mailto:aon.912164494.engel@aon.at] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> </span></font><font =
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>Sunday, June
 08, 2003</span></font><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'> </span></font><font size=3D2 face=3DTahoma><span
 style=3D'font-size:10.0pt;font-family:Tahoma'>6:14 =
AM</span></font><font size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'><br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> IPTABLES &amp; =
POLICYS</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>Hi,</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>hope my =
English is ok, i
have some questions;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>Starting =
situation: I use
red hat 9 Linux as a gateway firewall to route my private LAN via ADSL =
to the
internet;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>Gateway has 2 =
network
interfaces, one for internal, and one for the connection to the alcatel =
modem;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>I built up my =
firewall
very similar to the firewall in Robert Zieglers book &#8220;Linux =
Firewalls 2
nd edition&#8221; </span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>All policies =
for the 3
tables are set to DROP, I allow only special protocols and =
services;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>I don&#8217;t =
use a rule
for the mangle table and just one rule for the Nat table &gt; masquerade =
rule
for snat;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>When I start =
my firewall
script I even can not ping the lo interface but actually I have the =
rules in
the filter table to allow a ping to </span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>this interface =
(this
rules stand bevor the policy rules in the my firewallscript) =
;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>When I set =
only the
policies of the Nat and mangle table to ACCEPT and let the filter table
policies on DROP, then the firewall works very well(I have internet =
connection
from al pc of the private LAN and I can ping everything) =
;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>How =
comes?</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>What has the =
Mangle and
Nat table to do with pinging the local host, I thought the advantage of
iptables is the fact, that every packet passes just =
one</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>chain and only =
local host
packets need to go via 2 chains;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>And that is =
the point,
when I put the policies of Nat chains and Mangle chains to DROP nothing =
is
allowed any more &gt; it seems that I lost rules in this chain, but why =
does
packets go to the chains of Mangle and Nat(exception is the postrouting =
chain
of Nat, were masquerade take place)</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>If anyone =
knows were the
problem is, please let me know.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>Thank =
you</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>Gerald</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DDE =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C32F7E.E0B4DC01--

