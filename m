From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: why must linux for halted firewall?
Date: Tue, 16 Sep 2003 12:16:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E3A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C37C86.F899C790"
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

------_=_NextPart_001_01C37C86.F899C790
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=20

The ideal of a halted firewall is that the only possible exploit that
could compromise a box is the kernel and the network core itself, and
not depend on having userspace programs to cause possible security
concerns.
=20
As for the concern that you can't log, I believe you can send syslogs to
another machine from the kernel, no?
=20
I personally don't really care for halted firewalls myself. I constantly
tweak the firewall to my environment (basically daily) so a halted
firewall wouldn't make any sense to me. If you have an ultra static
firewall configuration and physical access to the machine, I can see
that there can be benefit of having it, but you would also need a
read-only storage medium since if the kernel is compromised, they could
still dump garbage to physical disks.
=20
=20
 =20


>What would be the benefit in configuring a system like this? It seems
to run contrary to the evolution of IT appliances where you can
configure and manage >everything usually without restarting (firewalls,
switches, print servers, even ups units). I don't get it ;-)


------_=_NextPart_001_01C37C86.F899C790
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
	font-family:"Times New Roman";
	color:black;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
pre
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
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

<body bgcolor=3Dwhite lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<pre style=3D'margin-left:.5in'><font size=3D2 color=3Dnavy =
face=3D"Courier New"><span
style=3D'font-size:10.0pt;color:navy'>The ideal of a halted firewall is =
that the only possible exploit that could compromise a box is the kernel =
and the network core itself, and not depend on having userspace programs =
to cause possible security concerns.</span></font></pre><pre
style=3D'margin-left:.5in'><font size=3D2 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;color:navy'>&nbsp;</span></font></pre><pre
style=3D'margin-left:.5in'><font size=3D2 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;color:navy'>As for the concern that you =
can&#8217;t log, I believe you can send syslogs to another machine from =
the kernel, no?</span></font></pre><pre
style=3D'margin-left:.5in'><font size=3D2 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;color:navy'>&nbsp;</span></font></pre><pre
style=3D'margin-left:.5in'><font size=3D2 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;color:navy'>I personally don&#8217;t really =
care for halted firewalls myself. I constantly tweak the firewall to my =
environment (basically daily) so a halted firewall wouldn&#8217;t make =
any sense to me. If you have an ultra static firewall configuration and =
physical access to the machine, I can see that there can be benefit of =
having it, but you would also need a read-only storage medium since if =
the kernel is compromised, they could still dump garbage to physical =
disks.</span></font></pre><pre
style=3D'margin-left:.5in'><font size=3D2 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;color:navy'>&nbsp;</span></font></pre><pre
style=3D'margin-left:.5in'><font size=3D2 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;color:navy'>&nbsp;</span></font></pre><pre><fon=
t
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt'>&nbsp; </span></font></pre>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3Dblack
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'><br>
</span></font><font color=3Dnavy><span =
style=3D'color:navy'>&gt;</span></font>What
would be the benefit in configuring a system like this? It seems to run
contrary to the evolution of IT appliances where you can configure and =
manage <font
color=3Dnavy><span style=3D'color:navy'>&gt;</span></font>everything =
usually
without restarting (firewalls, switches, print servers, even ups units). =
I
don't get it ;-)</p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C37C86.F899C790--

