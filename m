From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: Proxy Server Routing - One last try
Date: Mon, 22 Sep 2003 12:15:38 -0700
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E45@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3813D.E81B0037"
Return-path: <lartc-admin@mailman.ds9a.nl>
content-class: urn:content-classes:message
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
To: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C3813D.E81B0037
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Objective:

=20

All web traffic originating from my proxy server should be forwarded
through interface eth2 instead of the default eth0. The reply should
take the same path back to the proxy server.

=20

=20

Problem:

=20

On the return bout, the kernel doesn't pass the packet to the higher
layers. The reply seems to be getting tossed away between PREROUTING and
INPUT Netfilter chains.

=20

=20

Host Setup:

=20

Kernel Version:

2.4.22 with Netfilter base patches from CVS Sept. 10; Redhat 9 options
w/all Netfilter modules

=20

Network Map:

eth0 --- Default Route, Default Internet Access

eth2 -|

eth3 -|- Alternative Internet Access

eth4 -|

=20

Relevant Configuration:

   <Squid proxy is set to use <eth2_ip> as its outgoing address>

iptables -t mangle -A OUTPUT -m owner --uid-owner squid1 -p tcp --dport
80 -j MARK --set-mark 1

iptables -t mangle -A POSTROUTING -o eth2 --source ! <eth2_ip> -j DROP

ip rule add fwmark 1 table 100

ip route add default via <eth2_gw> src <eth2_ip> dev eth2 table 100

   <Logs for mangle in,out.pre,post>

   <NAT / Filter tables are basically empty for this test>

  =20

=20

Results:

=20

Sep 22 11:20:02 gw2 kernel: OUTPUT - IN=3D OUT=3Deth0 SRC=3D<eth2_ip>
DST=3D216.239.39.99 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D26601 =
DF PROTO=3DTCP
SPT=3D37984 DPT=3D80 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0=20

   <Strange that the first round of routing didn't use the <eth2_ip> to
force the outgoing interface>

Sep 22 11:20:02 gw2 kernel: POSTROUTING - IN=3D OUT=3Deth2 =
SRC=3D<eth2_ip>
DST=3D216.239.39.99 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D26602 =
DF PROTO=3DTCP
SPT=3D37984 DPT=3D80 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0=20

   <Ok, its looking better after the fwmark is processed>

Sep 22 11:20:02 gw2 kernel: PREROUTING - IN=3Deth2 OUT=3D
MAC=3D00:05:5d:64:9a:f2:00:00:77:92:56:92:08:00 SRC=3D216.239.39.99
DST=3D<eth2_ip> LEN=3D44 TOS=3D0x00 PREC=3D0x00 TTL=3D240 ID=3D16723 =
PROTO=3DTCP
SPT=3D80 DPT=3D37984 WINDOW=3D8190 RES=3D0x00 ACK SYN URGP=3D0

   <IP_CONNTRTACK detects SYN_RECV>

   <netstat detects SYN_SENT>

   <Kernel retries sending SYN until timeout>

   <So, it never reaches back up to the socket layer... I'm screwed>

=20

=20

=20


------_=_NextPart_001_01C3813D.E81B0037
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
font-family:Arial'>Objective:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>All web traffic originating from my proxy server =
should be
forwarded through interface eth2 instead of the default eth0. The reply =
should
take the same path back to the proxy server.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Problem:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>On the return bout, the kernel doesn&#8217;t pass the =
packet
to the higher layers. The reply seems to be getting tossed away between =
PREROUTING
and INPUT Netfilter chains.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Host Setup:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Kernel Version:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>2.4.22 with Netfilter base patches from CVS Sept. 10; =
Redhat
9 options w/all Netfilter modules</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Network Map:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>eth0 --- </span></font><font size=3D2 =
face=3DArial><span
  style=3D'font-size:10.0pt;font-family:Arial'>Default =
Route</span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>, Default
Internet Access</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>eth2 -|</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>eth3 -|- Alternative Internet =
Access</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>eth4 -|</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Relevant Configuration:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp; &lt;Squid proxy is set to use =
&lt;eth2_ip&gt;
as its outgoing address&gt;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>iptables -t mangle -A OUTPUT -m owner --uid-owner =
squid1 -p tcp
--dport 80 -j MARK --set-mark 1</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>iptables -t mangle -A POSTROUTING -o eth2 --source !
&lt;eth2_ip&gt; -j DROP</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>ip rule add fwmark 1 table 100</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>ip route add default via &lt;eth2_gw&gt; src =
&lt;eth2_ip&gt;
dev eth2 table 100</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp; &lt;Logs for mangle =
in,out.pre,post&gt;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp; &lt;NAT / Filter tables are basically =
empty for
this test&gt;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp; </span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Results:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Sep 22 </span></font><font size=3D2 =
face=3DArial><span
 =
style=3D'font-size:10.0pt;font-family:Arial'>11:20:02</span></font><font =
size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'> gw2 =
kernel: OUTPUT
- IN=3D OUT=3Deth0 SRC=3D&lt;eth2_ip&gt; DST=3D216.239.39.99 LEN=3D60 =
TOS=3D0x00 PREC=3D0x00
TTL=3D64 ID=3D26601 DF PROTO=3DTCP SPT=3D37984 DPT=3D80 WINDOW=3D5840 =
RES=3D0x00 SYN URGP=3D0 </span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp; &lt;Strange that the first round of =
routing didn't
use the &lt;eth2_ip&gt; to force the outgoing =
interface&gt;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Sep 22 </span></font><font size=3D2 =
face=3DArial><span
 =
style=3D'font-size:10.0pt;font-family:Arial'>11:20:02</span></font><font =
size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'> gw2 =
kernel:
POSTROUTING - IN=3D OUT=3Deth2 SRC=3D&lt;eth2_ip&gt; DST=3D216.239.39.99 =
LEN=3D60
TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D26602 DF PROTO=3DTCP SPT=3D37984 =
DPT=3D80 WINDOW=3D5840
RES=3D0x00 SYN URGP=3D0 </span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp; &lt;Ok, its looking better after the =
fwmark is
processed&gt;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Sep 22 </span></font><font size=3D2 =
face=3DArial><span
 =
style=3D'font-size:10.0pt;font-family:Arial'>11:20:02</span></font><font =
size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'> gw2 =
kernel:
PREROUTING - IN=3Deth2 OUT=3D =
MAC=3D00:05:5d:64:9a:f2:00:00:77:92:56:92:08:00
SRC=3D216.239.39.99 DST=3D&lt;eth2_ip&gt; LEN=3D44 TOS=3D0x00 =
PREC=3D0x00 TTL=3D240
ID=3D16723 PROTO=3DTCP SPT=3D80 DPT=3D37984 WINDOW=3D8190 RES=3D0x00 ACK =
SYN URGP=3D0</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp; &lt;IP_CONNTRTACK detects =
SYN_RECV&gt;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp; &lt;netstat detects =
SYN_SENT&gt;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp; &lt;Kernel retries sending SYN until
timeout&gt;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;&nbsp; &lt;So, it never reaches back up to the =
socket
layer... I&#8217;m screwed&gt;</span></font></p>

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
=00
------_=_NextPart_001_01C3813D.E81B0037--
_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
