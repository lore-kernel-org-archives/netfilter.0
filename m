From: <sjean@infynia.com>
Subject: RE: Masquerade with multiple routes
Date: Fri, 9 Jul 2004 13:02:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <610E99A7C6F99D4F87AFFDD64F159B4E0F59C8@fyniexch.infynia.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C465D6.95FAF478"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C465D6.95FAF478
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Val Schmidt vschmidt@ldeo.columbia.edu
<mailto:vschmidt%40ldeo.columbia.edu>=20

Thu, 8 Jul 2004 13:02:01 -0400 wrote:
>In previous posts here and elsewhere, there was a bug listed in which a

>Masquerade statement would fail when there are multiple routes to a=20
>network. One would see "MASQUERADE: Route sent us somewhere else" in=20
>the system log.
=20
>Does anyone know if this has been fixed in any of the latest versions?
=20
Patrick McHardy patched it.
Look at
http://lists.netfilter.org/pipermail/netfilter-devel/2004-January/013695
.html
=20
>I have a network redundant meshed network in which routes are generated

>dynamically using ospf. However I get these errors when trying to route

>to networks in which the number of hops is the same in more than one=20
>direction.
=20
>Anyone have any ideas?
=20
>-Val
=20
Hope this helps.
=20
Samuel Jean

------_=_NextPart_001_01C465D6.95FAF478
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
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
pre
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DFR-CA link=3Dblue vlink=3Dpurple>

<div class=3DSection1><pre><b><font size=3D2 face=3D"Courier New"><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-weight:bold'>Val Schmidt =
</span></font></b><a
href=3D"mailto:vschmidt%40ldeo.columbia.edu"
title=3D"Masquerade with multiple routes"><span =
lang=3DEN-US>vschmidt@ldeo.columbia.edu </span></a><span
lang=3DEN-US><br>
<i><span style=3D'font-style:italic'>Thu, 8 Jul 2004 13:02:01 -0400 =
wrote:</span></i><o:p></o:p></span></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;In previous posts here and elsewhere, =
there was a bug listed in which a =
<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;Masquerade statement would fail when =
there are multiple routes to a <o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;network. One would see &quot;MASQUERADE: =
Route sent us somewhere else&quot; in =
<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;the system =
log.<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></pre><pre><fon=
t
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;Does anyone know if this has been fixed =
in any of the latest versions?<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></pre><pre><fon=
t
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>Patrick McHardy patched =
it.<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>Look at =
http://lists.netfilter.org/pipermail/netfilter-devel/2004-January/013695.=
html<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></pre><pre><fon=
t
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;I have a network redundant meshed network =
in which routes are generated <o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;dynamically using ospf. However I get =
these errors when trying to route =
<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;to networks in which the number of hops =
is the same in more than one <o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;direction.<o:p></o:p></span></font></pre><=
pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></pre><pre><fon=
t
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;Anyone have any =
ideas?<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></pre><pre><fon=
t
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>&gt;-Val<o:p></o:p></span></font></pre><pre><f=
ont
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></pre><pre><fon=
t
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>Hope this =
helps.<o:p></o:p></span></font></pre><pre><font
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></pre><pre><fon=
t
size=3D2 face=3D"Courier New"><span lang=3DEN-US =
style=3D'font-size:10.0pt'>Samuel =
Jean<o:p></o:p></span></font></pre></div>

</body>

</html>

------_=_NextPart_001_01C465D6.95FAF478--

