From: <techmail@safe2surf.nl>
Subject: RE: Debugging
Date: Mon, 20 Oct 2003 01:26:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004201c39698$7e8d7120$0501a8c0@robert>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C51F@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0043_01C396A9.42164120"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C51F@wardrive.citadelcomputer.com.au>
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

------=_NextPart_000_0043_01C396A9.42164120
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

That did the trick. Stupid not to notice it, but indeed, the iptables
file wasn't present in /etc/sysconfig, so I did "service iptables save"
and it saved the ruleset (which is non-existent atm). Afterwards the
service came online as expected. Now I can get back to learning how to
write the rules ;-)

 

Thanks!

 

Robert Hazenveld

 

-----Original Message-----
From: George Vieira [mailto:georgev@citadelcomputer.com.au] 
Sent: maandag 20 oktober 2003 0:41
To: techmail@safe2surf.nl
Subject: RE: Debugging

 

vi /etc/init.d/iptables

 

check inside for anything it's testing for to exist before it'll even
run the script.

From memory it checks for /etc/sysconfig/iptables file which contains
the rules you want to add to the machine, if this doesn't exist then the
script stops..

 

I would remove all of the script contents and write your own iptables
script, it's not hard once you know exaclty what you want for a
firewall..

 

Thanks,

 

____________________________________________
George Vieira
Citadel Computer Systems Pty Ltd   Systems Manager   georgev AT
citadelcomputer DOT com DOT au   

Citadel Computer Systems Pty Ltd

Phone : +61 2 9955 2644   HelpDesk: +61 2 9955 2698
<http://www.citadelcomputer.com.au/>  http://www.citadelcomputer.com.au
<http://www.citadelcomputer.com.au/>  

 

 

-----Original Message-----
From: techmail@safe2surf.nl [mailto:techmail@safe2surf.nl]
Sent: Monday, 20 October 2003 8:24 AM
To: netfilter@lists.netfilter.org
Subject: Debugging

Hi,

 

Perhaps this is a stupid question which has been asked too many times,
but I wasn't able to find it.

 

If I do "service iptables start" nothing happens, so when I do "service
iptables status" it says "Firewall is stopped."

 

Because I want to know where in the process the error is I'd like to
know how to debug it. Is there any information on debugging to see what
error it displays?

 

Kind regards,

 

Robert Hazenveld


------=_NextPart_000_0043_01C396A9.42164120
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
	{margin:0cm;
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
	{margin-right:0cm;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.emailstyle17
	{font-family:Arial;
	color:windowtext;}
span.EmailStyle19
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DNL link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>That did the =
trick.
Stupid not to notice it, but indeed, the iptables file wasn&#8217;t =
present in
/etc/sysconfig, so I did &#8220;service iptables save&#8221; and it =
saved the ruleset
(which is non-existent atm). Afterwards the service came online as =
expected.
Now I can get back to learning how to write the rules =
;-)</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>&nbsp;</span></fo=
nt></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>Thanks!</span></f=
ont></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>&nbsp;</span></fo=
nt></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>Robert =
Hazenveld</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>&nbsp;</span></fo=
nt></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DTahoma><span
lang=3DEN-US style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> George Vieira
[mailto:georgev@citadelcomputer.com.au] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> maandag 20 oktober =
2003 0:41<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
techmail@safe2surf.nl<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> RE: =
Debugging</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dblue
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:blue'>vi
/etc/init.d/iptables</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dblue
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:blue'>check
inside for anything it's testing for to exist before it'll even run the =
script.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dblue
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:blue'>From
memory it checks for /etc/sysconfig/iptables file which contains the =
rules you
want to add to the machine, if this doesn't exist then the script =
stops..</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dblue
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:blue'>I would
remove all of the script contents and write your own iptables script, =
it's not
hard once you know exaclty what you want for a =
firewall..</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p style=3D'margin-left:35.4pt'><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'>Thanks,</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<marquee id=3DMarquee1 style=3D"WIDTH: 220px; HEIGHT: 57px" trueSpeed
scrollamount=3D1 scrolldelay=3D20 direction=3Ddown behavior=3Dslide =
loop=3D1 border=3D2>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D1
face=3D"Times New Roman"><span =
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
scrollamount=3D1 scrolldelay=3D3 behavior=3Dslide loop=3D1 width=3D281 =
height=3D19 border=3D0>Citadel
Computer Systems Pty Ltd</marquee>

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

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D1 =
color=3Dblack
face=3DVerdana><span =
style=3D'font-size:7.5pt;font-family:Verdana;color:black'>Citadel
Computer Systems Pty Ltd</span></font></p>

</div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D1 =
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

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

<blockquote style=3D'border:none;border-left:solid blue =
1.5pt;padding:0cm 0cm 0cm 4.0pt;
margin-left:3.75pt;margin-top:5.0pt;margin-right:0cm;margin-bottom:5.0pt'=
>

<p class=3DMsoNormal =
style=3D'margin-right:0cm;margin-bottom:12.0pt;margin-left:
35.4pt'><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:
Tahoma'>-----Original Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> =
techmail@safe2surf.nl
[mailto:techmail@safe2surf.nl]<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Monday, 20 October =
2003 8:24
AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> =
Debugging</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Hi,</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>Perhaps this =
is a stupid
question which has been asked too many times, but I wasn&#8217;t able to =
find
it.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>If I do =
&#8220;service
iptables start&#8221; nothing happens, so when I do &#8220;service =
iptables
status&#8221; it says &#8220;Firewall is =
stopped.&#8221;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>Because I want =
to know
where in the process the error is I&#8217;d like to know how to debug =
it. Is
there any information on debugging to see what error it =
displays?</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>Kind =
regards,</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>Robert =
Hazenveld</span></font></p>

</blockquote>

</div>

</body>

</html>

------=_NextPart_000_0043_01C396A9.42164120--


