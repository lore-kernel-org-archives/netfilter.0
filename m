From: Drew Weaver <drew.weaver@thenap.com>
Subject: RE: one more newbie question, this time MRTG.
Date: Sun, 18 May 2003 02:11:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <75634F04BFCFD511BF69009027DC8649484269@mailman.thenap.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C31D04.4C22CE50"
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
To: 'Garcia Ruiz' <gar_ruiz@teleline.es>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C31D04.4C22CE50
Content-Type: text/plain

May 17 16:14:45 linuxweb kernel: IN=eth0 OUT=
MAC=00:60:08:a7:d2:9d:00:01:30:07:71:00:08:00 SRC=10.1.0.1 DST=10.1.0.5
LEN=22

1 TOS=0x00 PREC=0x00 TTL=30 ID=6669 PROTO=UDP SPT=161 DPT=34218 LEN=201

 

You mean this? Well its obvious by this that some kind of traffic is trying
to go across 34218, but that port number is randomly generated, so how do I
say ok allow all of mrtg's traffic to go through?

 

-Drew

 

 

-----Original Message-----
From: Garcia Ruiz [mailto:gar_ruiz@teleline.es] 
Sent: Saturday, May 17, 2003 6:29 PM
To: Drew Weaver; netfilter@lists.netfilter.org
Subject: Re: one more newbie question, this time MRTG.

 

Log everything and see

----- Original Message ----- 

From: Drew Weaver <mailto:drew.weaver@thenap.com>  

To: netfilter@lists.netfilter.org <mailto:netfilter@lists.netfilter.org>  

Sent: Saturday, May 17, 2003 11:37 PM

Subject: one more newbie question, this time MRTG.

 

            Hi, ever since I installed this iptables script I'm having a
problem where MRTG can no longer poll info on our switches, I thought MRTG
established an outgoing connection to the switches? Is there something I
need to open in IPtables? I tried opening UDP 161 (snmp port) and that
didn't do it, any help would be marvelous.

 

Thanks,

-Drew

 

 

 

-----Original Message-----
From: Garcia Ruiz [mailto:gar_ruiz@teleline.es] 
Sent: Saturday, May 17, 2003 6:29 PM
To: Drew Weaver; netfilter@lists.netfilter.org
Subject: Re: one more newbie question, this time MRTG.

 

Log everything and see

----- Original Message ----- 

From: Drew Weaver <mailto:drew.weaver@thenap.com>  

To: netfilter@lists.netfilter.org <mailto:netfilter@lists.netfilter.org>  

Sent: Saturday, May 17, 2003 11:37 PM

Subject: one more newbie question, this time MRTG.

 

            Hi, ever since I installed this iptables script I'm having a
problem where MRTG can no longer poll info on our switches, I thought MRTG
established an outgoing connection to the switches? Is there something I
need to open in IPtables? I tried opening UDP 161 (snmp port) and that
didn't do it, any help would be marvelous.

 

Thanks,

-Drew

 


------_=_NextPart_001_01C31D04.4C22CE50
Content-Type: text/html
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
span.emailstyle17
	{font-family:Arial;
	color:windowtext;}
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
10.0pt;font-family:Arial;color:navy'>May 17 </span></font><font
 size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
 color:navy'>16:14:45</span></font><font size=3D2 color=3Dnavy =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'> linuxweb =
kernel: IN=3Deth0
OUT=3D MAC=3D00:60:08:a7:d2:9d:00:01:30:07:71:</span></font><font
 size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
 color:navy'>00:08:00</span></font><font size=3D2 color=3Dnavy =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'> SRC=3D10.1.0.1
DST=3D10.1.0.5 LEN=3D22</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>1 TOS=3D0x00 PREC=3D0x00 TTL=3D30 =
ID=3D6669
PROTO=3DUDP SPT=3D161 DPT=3D34218 LEN=3D201</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>You mean this? Well its obvious by =
this
that some kind of traffic is trying to go across 34218, but that port =
number is
randomly generated, so how do I say ok allow all of mrtg's traffic to =
go
through?</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>-Drew</span></font></p>

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
<b><span style=3D'font-weight:bold'>From:</span></b> Garcia Ruiz =
[mailto:gar_ruiz@teleline.es]
<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> =
</span></font><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>Saturday, May
 17, 2003</span></font><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'> </span></font><font size=3D2 face=3DTahoma><span
 style=3D'font-size:10.0pt;font-family:Tahoma'>6:29 =
PM</span></font><font size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'><br>
<b><span style=3D'font-weight:bold'>To:</span></b> </span></font><font =
size=3D2
 face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>Drew =
Weaver</span></font><font
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>; </span></font><font
 size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>netfilter@lists.netfilter.=
org</span></font><font
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'><br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Re: one more =
newbie
question, this time MRTG.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Log everything and =
see</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>----- Original Message =
----- </span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;background:#E4E4E4'><b><font size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>From:</spa=
n></font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> <a
href=3D"mailto:drew.weaver@thenap.com" =
title=3D"drew.weaver@thenap.com">Drew Weaver</a>
</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>To:</span>=
</font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> <a
href=3D"mailto:netfilter@lists.netfilter.org"
title=3D"netfilter@lists.netfilter.org">netfilter@lists.netfilter.org</a=
> </span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>Sent:</spa=
n></font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> </span></font><font =
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Saturday, May 17,
 2003</span></font><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'> </span></font><font size=3D2 face=3DArial><span
 style=3D'font-size:10.0pt;font-family:Arial'>11:37 =
PM</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>Subject:</=
span></font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> one more
newbie question, this time MRTG.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Hi, ever since I installed this iptables script I'm having a problem =
where MRTG
can no longer poll info on our switches, I thought MRTG established an =
outgoing
connection to the switches? Is there something I need to open in =
IPtables? I
tried opening UDP 161 (snmp port) and that didn't do it, any help would =
be
marvelous.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Thanks,</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>-Drew</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

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
<b><span style=3D'font-weight:bold'>From:</span></b> Garcia Ruiz
[mailto:gar_ruiz@teleline.es] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> =
</span></font><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>Saturday, May
 17, 2003</span></font><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'> </span></font><font size=3D2 face=3DTahoma><span
 style=3D'font-size:10.0pt;font-family:Tahoma'>6:29 =
PM</span></font><font size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'><br>
<b><span style=3D'font-weight:bold'>To:</span></b> Drew Weaver;
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Re: one more =
newbie
question, this time MRTG.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Log everything and =
see</span></font></p>

</div>

<blockquote style=3D'border:none;border-left:solid black =
1.5pt;padding:0in 0in 0in 4.0pt;
margin-left:3.75pt;margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt=
'>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>----- Original Message =
----- </span></font></p>

</div>

<div style=3D'font-color:black'>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;background:#E4E4E4'><b><font size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>From:</spa=
n></font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> <a
href=3D"mailto:drew.weaver@thenap.com" =
title=3D"drew.weaver@thenap.com">Drew Weaver</a>
</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>To:</span>=
</font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> <a
href=3D"mailto:netfilter@lists.netfilter.org"
title=3D"netfilter@lists.netfilter.org">netfilter@lists.netfilter.org</a=
> </span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>Sent:</spa=
n></font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> </span></font><font =
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Saturday, May 17,
 2003</span></font><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'> </span></font><font size=3D2 face=3DArial><span
 style=3D'font-size:10.0pt;font-family:Arial'>11:37 =
PM</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>Subject:</=
span></font></b><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> one more
newbie question, this time MRTG.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Hi, ever since I installed this iptables script I'm having a problem =
where MRTG
can no longer poll info on our switches, I thought MRTG established an =
outgoing
connection to the switches? Is there something I need to open in =
IPtables? I
tried opening UDP 161 (snmp port) and that didn't do it, any help would =
be
marvelous.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Thanks,</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>-Drew</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</blockquote>

</div>

</body>

</html>

------_=_NextPart_001_01C31D04.4C22CE50--

