From: <Josh.Berry@compucom.com>
Subject: RE: Blocking access to UDP port 53 (DNS)
Date: Mon, 11 Aug 2003 11:50:36 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0C7C6E1720E8D74FB52EBEF93649730A0119A4FA@2k099exm01.compucom.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C36028.B02843FD"
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
To: len@euler.com
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C36028.B02843FD
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If you are hosting your own DNS servers, which since they cannot resolve
email when you block DNS, you probably are.  Then you need to allow udp
53 to come in to those DNS boxes.  Do you want to restrict DNS use from
your clients to your internal DNS servers?

=20

If so just:

=20

iptables -A FORWARD -s <dns server> -p udp -dport 53 -j ACCEPT

=20

if you are natting and need to allow DNS forwarding just:

=20

iptables -t nat -A PREROUTING -p udp -I <incoming interface> -d
<incoming interface ip> --dport 53 -j DNAT -to-destination <DNS
IPADDR:53>=20

=20

=20

-----Original Message-----
From: Len L. [mailto:len@euler.com]=20
Sent: Monday, August 11, 2003 11:25 AM
To: netfilter@lists.netfilter.org
Cc: Len L.
Subject: Blocking access to UDP port 53 (DNS)

=20

Does anyone know how to block the use of a DNS server (udp port 53) from
outside, but still have external mail be able to resolve addresses?

Here is what I tried ( xxx.xxx.xxx.0 is our external net that the dns
server is on)=20

iptables -A INPUT -s xxx.xxx.xxx.0/24 -p udp -j LOG --log-prefix "XXX
LOCAL UDP DNS  XXX  "=20
iptables -A INPUT -s xxx.xxx.xxx.0/24 -p udp -j ACCEPT=20
iptables -A INPUT -p udp -j LOG --log-prefix "XXX INPUT UDP LOG-drop XXX
"=20
iptables -A INPUT -p udp -j DROP=20

DNS requests from our machines works with the rules above, but here is
the message a remote system gets when someone mails us:=20

Aug 11 10:33:52 remotemachine sendmail[16732]: h7BFVAAR016730:
to=3D<len@machine.ourdomain.com>, ctladdr=3D<someone@their.domain.com>
(0/0), delay=3D00:01:49, xdelay=3D00:01:49, mailer=3Desmtp, pri=3D30344,
relay=3Dmachine.ourdomain.com., dsn=3D4.0.0, stat=3DDeferred: Name =
server:
machine.ourdomain.com.: host name lookup failure

=20

Len Laulainen=20


------_=_NextPart_001_01C36028.B02843FD
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">
<title>Blocking access to UDP port 53 (DNS)</title>

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
	{margin-right:0in;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle18
	{font-family:Arial;
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
10.0pt;font-family:Arial;color:navy'><!-- Converted from text/rtf format =
-->If
you are hosting your own DNS servers, which since they cannot resolve =
email
when you block DNS, you probably are.&nbsp; Then you need to allow udp =
53 to
come in to those DNS boxes.&nbsp; Do you want to restrict DNS use from =
your
clients to your internal DNS servers?</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>If so just:</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>iptables &#8211;A FORWARD &#8211;s =
&lt;dns
server&gt; -p udp &#8211;dport 53 &#8211;j ACCEPT</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>if you are natting and need to =
allow DNS
forwarding just:</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>iptables &#8211;t nat &#8211;A =
PREROUTING &#8211;p
udp &#8211;I &lt;incoming interface&gt; -d &lt;incoming interface ip&gt;
--dport 53 -j DNAT &#8211;to-destination &lt;DNS IPADDR:53&gt; =
</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Len L. =
[mailto:len@euler.com]
<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Monday, August 11, =
2003
11:25 AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Cc:</span></b> Len L.<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Blocking access =
to UDP
port 53 (DNS)</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p style=3D'margin-left:.5in'><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>Does anyone know how to block the use of a DNS =
server
(udp port 53) from outside, but still have external mail be able to =
resolve
addresses?</span></font></p>

<p style=3D'margin-left:.5in'><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>Here is what I tried ( xxx.xxx.xxx.0 is our =
external
net that the dns server is on)</span></font> </p>

<p style=3D'margin-left:.5in'><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>iptables -A INPUT -s xxx.xxx.xxx.0/24 -p udp =
-j LOG
--log-prefix &quot;XXX LOCAL UDP DNS&nbsp; XXX&nbsp; =
&quot;</span></font> <br>
<font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables
-A INPUT -s xxx.xxx.xxx.0/24 -p udp -j ACCEPT</span></font> <br>
<font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables
-A INPUT -p udp -j LOG --log-prefix &quot;XXX INPUT UDP LOG-drop =
XXX&nbsp;
&quot;</span></font> <br>
<font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables
-A INPUT -p udp -j DROP</span></font> </p>

<p style=3D'margin-left:.5in'><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>DNS requests from our machines works with the =
rules
above, but here is the message a remote system gets when someone mails =
us: </span></font></p>

<p style=3D'margin-left:.5in'><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>Aug 11 10:33:52 remotemachine sendmail[16732]:
h7BFVAAR016730: to=3D&lt;len@machine.ourdomain.com&gt;,
ctladdr=3D&lt;someone@their.domain.com&gt; (0/0), delay=3D00:01:49,
xdelay=3D00:01:49, mailer=3Desmtp, pri=3D30344, =
relay=3Dmachine.ourdomain.com.,
dsn=3D4.0.0, stat=3DDeferred: Name server: machine.ourdomain.com.: host =
name lookup
failure</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p style=3D'margin-left:.5in'><b><font size=3D3 face=3DArial><span =
style=3D'font-size:
12.0pt;font-family:Arial;font-weight:bold'>Len =
Laulainen</span></font></b> </p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C36028.B02843FD--

