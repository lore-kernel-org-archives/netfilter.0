From: "Francois Herbert" <fherbert@inspire.net.nz>
Subject: IPtables Logging to different log file
Date: Thu, 4 Sep 2003 21:35:34 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001401c372c7$e4382910$0a00a8c0@main>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0015_01C3732C.796D0910"
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

------=_NextPart_000_0015_01C3732C.796D0910
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I would like to change the location of my log information created by
iptables usage. I am running RH7.3 kernel 2.4.20, iptables v1.2.8.

 

I have the following in my syslog.conf file:

-----------------Cut-----------------------------------------
#Log iptables stuff to iptables log
kern.3                     /var/log/iptables
-----------------Cut-----------------------------------------


And in my firewall script...


$IPTABLES -N LOG_DROP
$IPTABLES -A LOG_DROP -j LOG --log-tcp-options --log-level 3
--log-ip-options --log-prefix "[IPTABLES DROP] : "
$IPTABLES -A LOG_DROP -j DROP

This does log some information to /var/log/iptables but it takes longer
(about a 2-3 minute delay) to get to that file than to /var/log/messages
(which it still logs to).

I have seen the local0 - local7 syslogd facilities but am a little
unsure how to use them. Does anybody have an idea???

Ideally, I would like to log all my iptables log to /var/log/iptables
and not to /var/log/messages at all...

Thanks

Francois.

 


------=_NextPart_000_0015_01C3732C.796D0910
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
 /* Font Definitions */
 @font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";
	color:windowtext;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
p
	{margin-right:0cm;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman";
	color:black;}
span.EmailStyle17
	{font-family:Arial;
	color:windowtext;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-NZ link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p><font size=3D2 color=3Dblack face=3DVerdana><span =
style=3D'font-size:10.0pt;
font-family:Verdana'>I would like to change the location of my log =
information
created by iptables usage. I am running RH7.3 kernel 2.4.20, iptables =
v1.2.8.</span></font></p>

<p><font size=3D2 color=3Dblack face=3DVerdana><span =
style=3D'font-size:10.0pt;
font-family:Verdana'>&nbsp;</span></font></p>

<p><font size=3D2 color=3Dblack face=3DVerdana><span =
style=3D'font-size:10.0pt;
font-family:Verdana'>I have the following in my syslog.conf file:<br>
<br>
-----------------Cut-----------------------------------------<br>
#Log iptables stuff to iptables log<br>
kern.3 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /var/log/iptables<br>
-----------------Cut-----------------------------------------</span></fon=
t></p>

<p><font size=3D2 color=3Dblack face=3DVerdana><span =
style=3D'font-size:10.0pt;
font-family:Verdana'><br>
And in my firewall script...<br>
<br>
<br>
$IPTABLES -</span></font><font size=3D2 face=3DVerdana><span =
style=3D'font-size:10.0pt;
 font-family:Verdana'>N LOG_DROP</span></font><font size=3D2 =
face=3DVerdana><span
style=3D'font-size:10.0pt;font-family:Verdana'><br>
$IPTABLES -A LOG_DROP -j LOG --log-tcp-options --log-level 3 =
--log-ip-options
--log-prefix &quot;[IPTABLES DROP] : &quot;<br>
$IPTABLES -A LOG_DROP -j DROP<br>
<br>
This does log some information to /var/log/iptables but it takes longer =
(about
a 2-3 minute delay) to get to that file than to /var/log/messages (which =
it still
logs to).<br>
<br>
I have seen the local0 - local7 syslogd facilities but am a little =
unsure how
to use them. Does anybody have an idea???<br>
<br>
Ideally, I would like to log all my iptables log to /var/log/iptables =
and not
to /var/log/messages at all...</span></font></p>

<p><font size=3D2 color=3Dblack face=3DVerdana><span =
style=3D'font-size:10.0pt;
font-family:Verdana'>Thanks</span></font></p>

<p><font size=3D2 color=3Dblack face=3DVerdana><span =
style=3D'font-size:10.0pt;
font-family:Verdana'>Francois.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0015_01C3732C.796D0910--



