From: "Kent Wang" <kwang@kwang.org>
Subject: RE: IP forwarding on port 80
Date: Fri, 13 Jun 2003 02:24:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c3317c$d9fc6b50$0300a8c0@eclipse>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E89@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0023_01C33152.F1266350"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E89@wardrive.citadelcomputer.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'George Vieira' <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0023_01C33152.F1266350
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

OK, more info. My belief is that the packets are not being DNAT'd
properly. I added this to that chain:

 

-A PREROUTING -j LOG --log-prefix "test" --log-level 7

 

And was able to log all the incoming HTTP packets. I then added these
two:

 

-A FORWARD -p tcp -m tcp --dport 80 -j LOG --log-prefix "test"
--log-level 7 

-A OUTPUT -p tcp -m tcp --dport 80 -j LOG --log-prefix "test"
--log-level 7

 

A properly DNAT'd packet should pass through FORWARD and then OUTPUT,
but I found nothing in the log. Is it possible that the DNAT module
isn't loaded?

 

I've done tcpdump and the firewall definitely always receives the
internet-incoming message and the web server never receives it.

 

Any clues?

 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of George Vieira
Sent: Thursday, June 12, 2003 5:18 PM
To: Kent Wang; netfilter@lists.netfilter.org
Subject: RE: IP forwarding on port 80 

 

What debugging have you done? tcpdump, iptables logging, anything?

 

Does your web server have a default gateway of the firewall?

Thanks,

 

____________________________________________
George Vieira
Citadel Computer Systems Pty Ltd   Systems Manager   georgev AT
citadelcomputer DOT com DOT au   

Citadel Computer Systems Pty Ltd

Phone : +61 2 9955 2644   HelpDesk: +61 2 9955 2698
<http://www.citadelcomputer.com.au/>  http://www.citadelcomputer.com.au
<http://www.citadelcomputer.com.au/>  

 


------=_NextPart_000_0023_01C33152.F1266350
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Verdana;
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
pre
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.emailstyle17
	{font-family:Arial;
	color:windowtext;}
span.EmailStyle20
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
10.0pt;font-family:Arial;color:navy'>OK, more info. My belief is that =
the
packets are not being DNAT&#8217;d properly. I added this to that =
chain:</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>-A PREROUTING -j LOG --log-prefix
&quot;test&quot; --log-level 7</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>And was able to log all the =
incoming HTTP
packets. I then added these two:</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>-A FORWARD -p tcp -m tcp --dport 80 =
-j LOG
--log-prefix &quot;test&quot; --log-level 7 </span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>-A OUTPUT -p tcp -m tcp --dport 80 =
-j LOG
--log-prefix &quot;test&quot; --log-level 7</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>A properly DNAT&#8217;d packet =
should pass
through FORWARD and then OUTPUT, but I found nothing in the log. Is it =
possible
that the DNAT module isn&#8217;t loaded?</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>I&#8217;ve done tcpdump and the =
firewall
definitely always receives the internet-incoming message and the web =
server
never receives it.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Any clues?</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b>
netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] <b><span =
style=3D'font-weight:bold'>On
Behalf Of </span></b>George Vieira<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Thursday, June 12, =
2003 5:18
PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> Kent Wang;
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> RE: IP =
forwarding on port
80 </span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblue face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:blue'>What debugging =
have you
done? tcpdump, iptables&nbsp;logging, anything?</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblue face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:blue'>Does your web =
server have
a default gateway of the firewall?</span></font></p>

</div>

<div>

<p style=3D'margin-left:.5in'><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>Thanks,</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<marquee id=3DMarquee1 style=3D"WIDTH: 220px; HEIGHT: 57px" trueSpeed
scrollamount=3D1 scrolldelay=3D20 direction=3Ddown behavior=3Dslide =
loop=3D1 border=3D2>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3D"Times New Roman"><span
style=3D'font-size:7.5pt'>____________________________________________</s=
pan></font><br>
</marquee>

<b><font size=3D2 color=3D"#000066" face=3DVerdana><span =
style=3D'font-size:10.0pt;
font-family:Verdana;color:#000066;font-weight:bold'>George Vieira<br>
</span></font></b><b><font size=3D1 color=3Dblack face=3DVerdana><span
style=3D'font-size:7.5pt;font-family:Verdana;color:black;font-weight:bold=
'>

<marquee id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" trueSpeed
scrollamount=3D1 scrolldelay=3D3 behavior=3Dslide loop=3D1 =
border=3D0>Citadel Computer
Systems Pty Ltd</marquee>

</span></font></b>&nbsp;<b><font size=3D1 color=3Dblack =
face=3DVerdana><span
style=3D'font-size:7.5pt;font-family:Verdana;color:black;font-weight:bold=
'>

<marquee id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" trueSpeed
scrollamount=3D1 scrolldelay=3D3 behavior=3Dslide loop=3D1 =
border=3D0>Systems Manager</marquee>

</span></font></b><font face=3DVerdana><span =
style=3D'font-family:Verdana'>&nbsp;</span></font><font
size=3D1 color=3D"#000099" face=3DVerdana>

<marquee id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 255px; HEIGHT: =
17px"
trueSpeed scrollamount=3D2 scrolldelay=3D5 direction=3Dright =
behavior=3Dslide loop=3D1
width=3D300 height=3D16 border=3D0><span =
style=3D'font-size:7.5pt;font-family:Verdana;
color:#000099'>georgev AT citadelcomputer DOT com DOT =
au</span></marquee>

</font><font face=3DVerdana><span =
style=3D'font-family:Verdana'>&nbsp;</span>

<marquee id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"
trueSpeed scrollamount=3D1 scrolldelay=3D3 behavior=3Dslide loop=3D1 =
border=3D0></marquee>

</font></p>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
color=3Dblack
face=3DVerdana><span =
style=3D'font-size:7.5pt;font-family:Verdana;color:black'>Citadel
Computer Systems Pty Ltd</span></font></p>

</div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
color=3Dblack
face=3DVerdana>

<marquee id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"
trueSpeed scrollamount=3D1 scrolldelay=3D3 direction=3Dright =
behavior=3Dslide loop=3D1
border=3D0><span =
style=3D'font-size:7.5pt;font-family:Verdana;color:black'>Phone :
+61 2 9955 2644</span></marquee>

</font><font face=3DVerdana><span =
style=3D'font-family:Verdana'>&nbsp;</span></font><font
size=3D1 color=3Dblack face=3DVerdana>

<marquee id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"
trueSpeed scrollamount=3D1 scrolldelay=3D3 direction=3Dright =
behavior=3Dslide loop=3D1
border=3D0><span =
style=3D'font-size:7.5pt;font-family:Verdana;color:black'>HelpDesk:
+61 2 9955 2698</span></marquee>

</font>&nbsp;<a href=3D"http://www.citadelcomputer.com.au/">

<marquee id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"
trueSpeed scrollamount=3D4 scrolldelay=3D5 direction=3Dright =
behavior=3Dslide loop=3D1
border=3D0></a><font size=3D1 color=3D"#000099" face=3DVerdana><span =
style=3D'font-size:
7.5pt;font-family:Verdana;color:#000099'><a
href=3D"http://www.citadelcomputer.com.au/">http://www.citadelcomputer.co=
m.au</a></span></font></marquee>

</p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

</div>

</body>

</html>

------=_NextPart_000_0023_01C33152.F1266350--



