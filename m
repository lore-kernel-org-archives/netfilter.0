From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: traffic usage report
Date: Tue, 12 Aug 2003 08:56:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E1E@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C360EA.4309EEDE"
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
To: Lawrence - D <ingsiong@daltron.com.pg>, Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C360EA.4309EEDE
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

iptables -t mangle -I PREROUTING -i <INTERNAL_IF> --source <EMPLOYEE_PC>
-p tcp --dport <WATCH_PROTO>

iptables -t mangle -I FORWARD -i <EXTERNAL_IF> --destination
<EMPLOYEE_PC> -p tcp --sport <WATCH_PROTO>

=20

Of course you can make more general rules, but that is up too you. Too
many rules bogs down slow firewalls.

=20

Look at iptables -t mangle -nvxL

=20

The second column, bytes will be the number of bytes passed through to
that user / protocol. Mind you, these counters do wrap, so if you are
counting on stats that are accurate, you will have to use a tool to
store these values and know how to handle wraps in the counter. I use
rrdtool for this end, as well as for its output graphing.

http://people.ee.ethz.ch/~oetiker/webtools/rrdtool/

=20

=20

=20

-----Original Message-----
From: Lawrence - D [mailto:ingsiong@daltron.com.pg]=20
Sent: Tuesday, August 12, 2003 12:37 AM
To: Netfilter
Subject: traffic usage report

=20

Hi,

    We are running and linux server connected to internet via NIC and
the ISP charge us base on our internet traffic usage (upload and
download).

    How can I check the total of the internet traffic usage (all the
port 80,25,110,..ICQ, mIRC...) on a workstation (each PC have it own IP
address ?

    Can anybody advice ?

=20

Best Regards,
=20
Lawrence Tang=20
Comserv (PNG) Ltd=20
Lot 21, Sect. 59, Gabaka St., Gordon=20
P.O.Box 2292, Boroko=20
Port Moresby, Papua New Guinea=20
Tel: 675-3233330 Fax: 675-3250673=20
Email: ingsiong@daltron.com.pg
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This message contains privileged and confidential information intended
only for the use
of the named recipient(s). Any unauthorised use of the contents of this
message is
expressly prohibited. If you have received this message in error, please
notify the sender
immediately by return email and destroy the original message. Thank you
for your co-operation.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


------_=_NextPart_001_01C360EA.4309EEDE
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
	{color:blue;
	text-decoration:underline;}
span.EmailStyle17
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

<body bgcolor=3Dwhite lang=3DEN-US link=3Dblue vlink=3Dblue>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;font-family:"Courier New";color:navy'>iptables =
&#8211;t
mangle &#8211;I PREROUTING &#8211;i &lt;INTERNAL_IF&gt; -&#8211;source =
&lt;EMPLOYEE_PC&gt;
-p tcp --dport &lt;WATCH_PROTO&gt;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;font-family:"Courier New";color:navy'>iptables =
&#8211;t
mangle &#8211;I FORWARD &#8211;i &lt;EXTERNAL_IF&gt; -&#8211;destination =
&lt;EMPLOYEE_PC&gt;
-p tcp -&#8211;sport &lt;WATCH_PROTO&gt;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Of course you can make more general =
rules,
but that is up too you. Too many rules bogs down slow =
firewalls.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Look at iptables &#8211;t mangle =
&#8211;nvxL</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>The second column, bytes will be =
the
number of bytes passed through to that user / protocol. Mind you, these
counters do wrap, so if you are counting on stats that are accurate, you =
will
have to use a tool to store these values and know how to handle wraps in =
the
counter. I use rrdtool for this end, as well as for its output =
graphing.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><a
href=3D"http://people.ee.ethz.ch/~oetiker/webtools/rrdtool/">http://peopl=
e.ee.ethz.ch/~oetiker/webtools/rrdtool/</a></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

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
<b><span style=3D'font-weight:bold'>From:</span></b> Lawrence - D
[mailto:ingsiong@daltron.com.pg] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Tuesday, August 12, =
2003
12:37 AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> Netfilter<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> traffic usage =
report</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Hi,</span></font></p>

</div>

<div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp; We are =
running
and linux server connected to internet&nbsp;via NIC&nbsp;and the ISP =
charge us
base on our internet traffic usage (upload and =
download).</span></font></p>

</div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp; How can =
I check
the total of the internet traffic usage (all the port 80,25,110,..ICQ, =
mIRC...)
on a workstation (each PC have it own IP =
address&nbsp;?</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp; Can =
anybody
advice ?</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Best Regards,<br>
&nbsp;<br>
Lawrence Tang <br>
Comserv (PNG) Ltd <br>
Lot 21, Sect. 59, Gabaka St., Gordon <br>
P.O.Box 2292, Boroko <br>
Port Moresby, Papua New Guinea <br>
Tel: 675-3233330 Fax: 675-3250673 <br>
Email: <a =
href=3D"mailto:ingsiong@daltron.com.pg">ingsiong@daltron.com.pg</a><br>
&nbsp;<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
This message contains privileged and confidential information intended =
only for
the use<br>
of the named recipient(s). Any unauthorised use of the contents of this =
message
is<br>
expressly prohibited. If you have received this message in error, please =
notify
the sender<br>
immediately by return email and destroy the original message. Thank you =
for
your co-operation.<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></f=
ont></p>

</div>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C360EA.4309EEDE--

