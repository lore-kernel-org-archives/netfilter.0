From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: FTP over NAT problem
Date: Wed, 26 May 2004 10:08:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5D3C2276FD64424297729EB733ED1F76061007BA@email1.mitretek.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4432A.F58BBC50"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Vanderveer, Derek" <Derek.Vanderveer@McKesson.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C4432A.F58BBC50
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

This is very strange, have you given iptables 1.2.9 a try?

Also, I compile everything iptables-wise into the kernel except
ftp/nat_ftp (incase you want to run an ftp/access one on a port other
than 21), then I do not need to worry about having the appropriate
module loaded. What kernel do you run btw? 2.4.26 here for my fw box.

=20

________________________________

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Vanderveer,
Derek
Sent: Tuesday, May 25, 2004 12:42 PM
To: 'netfilter@lists.netfilter.org'
Subject: FTP over NAT problem

=20

Hey all,

=20

I've been fighting with this problem for over a week, and I've made no
headway.  I have a server with a bank of serial ports, all attached to
modems.  We use scripts to raise and drop lines to various customer
sites that we support.  In the past, we've had great success using
iptables to handle forwarding and NAT of LAN traffic going out over the
wire to the customer's servers.  My latest server, however, doesn't
handle FTP, PCAnywhere or RDP at all, using the same iptables commands
as the older servers.  It has a slightly newer (v1.2.6a vs. 1.2.5)
version of iptables, but otherwise isn't much different.

=20

Telnet and ICMP work fine, but PCA and RDP never connect.  You can
connect to a server using FTP, and browse in Active or Passive mode
without any problems.  As soon as you try to transfer a file, however,
the transfer hangs immediately, regardless of whether you use Active or
Passive.  I've pared my iptables script down to the bare minimum that
gets me to this state after a full reboot, and here it is:

=20

modprobe ip_conntrack_ftp

modprobe ip_nat_ftp

iptables -P FORWARD DROP

iptables -F FORWARD

iptables -t nat -P POSTROUTING ACCEPT

iptables -t nat -F POSTROUTING

iptables -t nat -A POSTROUTING -o ppp+ -j MASQUERADE

iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT

iptables -A FORWARD -i ppp+ -o eth0 -m state --state ESTABLISHED,RELATED
-j ACCEPT

Distro is Debian 3.0r2, kernel is 2.4.26.  All non-experimental
netfilter kernel options are compiled as modules; except for
ip_conntrack_ftp and ip_nat_ftp, I just let the others autoload as I
issue the iptables statements above.  Can anyone shed any light on why
this is happening??  The same iptables ruleset works fine on my other
servers, and I'm stumped!

     Derek V.


------_=_NextPart_001_01C4432A.F58BBC50
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
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
	{color:purple;
	text-decoration:underline;}
p
	{mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:navy;}
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

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>This is very strange, have you =
given
iptables 1.2.9 a try?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Also, I compile everything =
iptables-wise
into the kernel except ftp/nat_ftp (incase you want to run an ftp/access =
one on
a port other than 21), then I do not need to worry about having the =
appropriate
module loaded. What kernel do you run btw? 2.4.26 here for my fw =
box.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] <b><span =
style=3D'font-weight:bold'>On
Behalf Of </span></b>Vanderveer, Derek<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Tuesday, May 25, =
2004 12:42
PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b>
'netfilter@lists.netfilter.org'<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> FTP over NAT =
problem</span></font><o:p></o:p></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hey all,<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I've been fighting with this problem for over a week, =
and
I've made no headway.&nbsp; I have a server with a bank of serial ports, =
all
attached to modems.&nbsp; We use scripts to raise and drop lines to =
various
customer sites that we support.&nbsp; In the past, we've had great =
success
using iptables to handle forwarding and NAT of LAN traffic going out =
over the
wire to the customer's servers.&nbsp;&nbsp;My latest server, however, =
doesn't
handle FTP, PCAnywhere or RDP&nbsp;at all, using the same iptables =
commands as
the older servers.&nbsp; It has a slightly newer (v1.2.6a vs. 1.2.5) =
version of
iptables, but otherwise isn't much =
different.<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Telnet and ICMP work fine, but PCA and RDP never
connect.&nbsp; You can connect to a server using FTP, and browse in =
Active or
Passive mode without any problems.&nbsp; As soon as you try to transfer =
a file,
however, the transfer hangs immediately, regardless of whether you use =
Active
or Passive.&nbsp; I've pared my iptables script down to the bare minimum =
that
gets me to this state after a full reboot, and here it =
is:<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;<o:p></o:p></span></font></p>

</div>

<div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>modprobe =
ip_conntrack_ftp<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>modprobe =
ip_nat_ftp<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>iptables -P FORWARD DROP</span></font><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>iptables -F FORWARD</span></font><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>iptables -t nat -P POSTROUTING =
ACCEPT</span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>iptables -t nat -F =
POSTROUTING</span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>iptables -t nat -A POSTROUTING -o ppp+ -j =
MASQUERADE</span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>iptables -A FORWARD -i eth0 -o ppp+ -j =
ACCEPT</span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>iptables -A FORWARD -i ppp+ -o eth0 -m state =
--state
ESTABLISHED,RELATED -j ACCEPT</span></font><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Distro is Debian 3.0r2, kernel is 2.4.26.&nbsp; All
non-experimental netfilter kernel options are compiled as modules; =
except for
ip_conntrack_ftp and ip_nat_ftp, I just let the others autoload as I =
issue the
iptables statements above.&nbsp; Can anyone shed any light on why this =
is
happening??&nbsp; The same iptables ruleset works fine on my other =
servers, and
I'm stumped!<o:p></o:p></span></font></p>

</div>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;
Derek V.<o:p></o:p></span></font></p>

</div>

</div>

</body>

</html>

------_=_NextPart_001_01C4432A.F58BBC50--

