From: "Chris" <chris@implexantsystems.com>
Subject: Denying access to a public IP
Date: Mon, 12 May 2003 10:49:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d401c318ae$c74ffcb0$0400000a@implexantsystems.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00D5_01C31874.1AF2AB50"
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
To: Netfilter/IPTables Mailing List <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_00D5_01C31874.1AF2AB50
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

=20

well, i just setup a linux router for myself. for the improved security,
dedicated box, ect anyway....

every once in a while I'll find an IP addy that I want/need to block, =
either
cuz I don't want them CONSTANTLY trying to do code red on my IIS server
which HAS BEEN PATCHED, or, they just make me mad.=20

so... using the "iptables -A INPUT -f -d 192.168.1.1 -j DROP" command =
would
be a good way to do it, correct?

FYI, I'm using a hardened version of RH 7.2, commonly known as IPCop =
v1.3.0
Fixes 1 and 2. I have it setup for GREEN + ORANGE + RED. It uses =
IPTables

GREEN (LAN) =3D eth0
ORANGE (DMZ) =3D eth1
RED (WAN) =3D eth2

=20

Here's what I've tried to do:

=20

First, I try to drop all ICMP packets (pings). Had trouble with that =
until I
deleted the "ACCEPT icmp -- anywhere anywhere" rule and added a DENY for
ICMP in INPUT.=20

=20

So... my current problem is trying to deny access to certain IPs. But =
the
"iptables -A INPUT -f -d 192.168.1.1 -j DROP" for whatever reason =
doesn't
work. I mean it works and adds the rule, but the host can still access =
my
firewall. my INPUT rule file is below:

=20

Chain INPUT (policy DROP)
target     prot opt source               destination
ipac~o     all  --  anywhere             anywhere
PSCAN      tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
PSCAN      tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/NONE
           tcp  --  anywhere             anywhere           tcp
flags:SYN,RST,ACK/SYN limit: avg 10/sec burst 5
CUSTOMINPUT  all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
RED        all  --  anywhere             anywhere
XTACCESS   all  --  anywhere             anywhere
LOG        all  --  anywhere             anywhere           limit: avg
10/min burst 5 LOG level warning prefix `INPUT '
DROP       icmp --  anywhere             anywhere

=20

so... do i need to delete another rule? or what am I doing wrong?

=20

Chris
ImplexantSystems.com <http://www.implexantsystems.com>=20
chris@implexantsystems.com=20
=20

=20


------=_NextPart_000_00D5_01C31874.1AF2AB50
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
p
	{margin-right:0in;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman";}
pre
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
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
font-family:Arial'>All,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>well, i just setup a linux router for myself. for the
improved security, dedicated box, ect anyway....<br>
<br>
every once in a while I'll find an IP addy that I want/need to block, =
either
cuz I don't want them CONSTANTLY trying to do code red on my IIS server =
which
HAS BEEN PATCHED, or, they just make me mad. <br>
<br>
so... using the &#8220;iptables -A INPUT -f -d 192.168.1.1 -j =
DROP&#8221;
command would be a good way to do it, correct?<br>
<br>
FYI, I'm using a hardened version of RH 7.2, commonly known as IPCop =
v1.3.0
Fixes 1 and 2. I have it setup for GREEN + </span></font><font size=3D2
  face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>ORANGE</span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> + RED. It
uses IPTables<br>
<br>
GREEN (LAN) =3D eth0<br>
ORANGE (DMZ) =3D eth1<br>
RED (WAN) =3D eth2</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Here&#8217;s what I&#8217;ve tried to =
do:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>First, I try to drop all ICMP packets (pings). Had =
trouble
with that until I deleted the &quot;ACCEPT icmp -- anywhere =
anywhere&quot; rule
and added a DENY for ICMP in INPUT. </span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>So... my current problem is trying to deny access to =
certain
IPs. But the &quot;iptables -A INPUT -f -d 192.168.1.1 -j DROP&quot; for
whatever reason doesn't work. I mean it works and adds the rule, but the =
host
can still access my firewall. my INPUT rule file is =
below:</span></font></p>

<div style=3D'border:none;border-bottom:double windowtext =
2.25pt;padding:0in 0in 1.0pt 0in'>

<p class=3DMsoNormal style=3D'border:none;padding:0in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;</span></font></p>

</div>

<pre><font size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>Chain INPUT (policy =
DROP)</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; destination</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>ipac~o&nbsp;&nbsp;&nbsp;&nbsp; all =
&nbsp;--&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; anywhere</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>PSCAN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; =
--&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG</span></font></pre>=
<pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>PSCAN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; =
--&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
flags:FIN,SYN,RST,PSH,ACK,URG/NONE</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tcp&nbsp; --&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
flags:SYN,RST,ACK/SYN limit: avg 10/sec burst =
5</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>CUSTOMINPUT&nbsp; all&nbsp; --&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; anywhere</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
state RELATED,ESTABLISHED</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>ACCEPT&nbsp;&nbsp;&nbsp; &nbsp;all&nbsp; =
--&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; anywhere</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; anywhere</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; anywhere</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>RED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp; --&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; anywhere</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>XTACCESS&nbsp;&nbsp; all&nbsp; --&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; anywhere</span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>LOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp; --&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
limit: avg 10/min burst 5 LOG level warning prefix `INPUT =
'</span></font></pre>

<div style=3D'border:none;border-bottom:double windowtext =
2.25pt;padding:0in 0in 1.0pt 0in'><pre
style=3D'border:none;padding:0in'><font size=3D2 color=3Dblack =
face=3D"Courier New"><span
style=3D'font-size:10.0pt'>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icmp =
--&nbsp; =
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; anywhere</span></font></pre></div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>so... do i need to delete another rule? or what am I =
doing
wrong?</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p><b><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
font-weight:bold'>Chris<br>
<a href=3D"http://www.implexantsystems.com">ImplexantSystems.com</a><br>
<a =
href=3D"mailto:chris@implexantsystems.com">chris@implexantsystems.com</a>=
 <br>
&nbsp;</span></font></b></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>

------=_NextPart_000_00D5_01C31874.1AF2AB50--


