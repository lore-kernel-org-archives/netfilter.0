From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: IPTABLES Difficulties
Date: Mon, 18 Aug 2003 09:22:53 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C101@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C36516.7BBBC036"
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
To: "Anthony R. Vallario" <avallario@tecmasters.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C36516.7BBBC036
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This has been requested many time in the past. You have to remember that =
your DNAT rule only applies to outsiders, you must DNAT the inside users =
as well as you do with them when they browse outside websites you have =
to MASQUERADE them to your internal one as well..
=20

Thanks,

=20
____________________________________________
George Vieira
Citadel Computer Systems Pty Ltd Systems Manager georgev AT =
citadelcomputer DOT com DOT au=20
Citadel Computer Systems Pty Ltd
Phone : +61 2 9955 2644 HelpDesk: +61 2 9955 2698  =
<http://www.citadelcomputer.com.au/> http://www.citadelcomputer.com.au
=20
=20
-----Original Message-----
From: Anthony R. Vallario [mailto:avallario@tecmasters.com]
Sent: Monday, August 18, 2003 9:06 AM
To: netfilter@lists.netfilter.org
Subject: IPTABLES Difficulties


To whom it may concern;
            I have an iptables NAT box setup on Redhat 9.0. I recently =
added a box behind the firewall that will act as a web server. I didn't =
want to do a DMZ as money is tight. I used the following rules to get =
all outside requests on port 80 to the web server inside:
=20
-A PREROUTING -p tcp -i eth0 -d $publicip --dport 80 -j DNAT =
--to-destination $internalip
-A PREROUTING -p tcp -i eth0 -d $publicip --dport 443 -j DNAT =
--to-destination $internalip
=20
My only problem is when somebody behind the firewall wants to access =
this webserver, it doesn't work. I don't want to have to type in the =
internal ip. I don't want to install an internal dns server. I would =
like my workstations to be able to type in the FQDN for the webserver =
and it actually work. If NAT works, why doesn't it go out the firewall =
and turn right back around and go to the webserver?
=20
Anthony R. Vallario   =20

------_=_NextPart_001_01C36516.7BBBC036
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D388102123-17082003><FONT face=3DArial color=3D#0000ff =
size=3D2>This=20
has been requested many time in the past. You have to remember that your =
DNAT=20
rule only applies to outsiders, you must DNAT the inside users as well =
as you do=20
with them when they browse outside websites you have to MASQUERADE them =
to your=20
internal one as well..</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV>
<P><FONT face=3DArial size=3D2><SPAN=20
class=3D674251008-03092002>Thanks,</SPAN></FONT></P></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D674251008-03092002></SPAN></FONT>&nbsp;</DIV>
<DIV style=3D"WIDTH: 305px; HEIGHT: 232px">
<MARQUEE id=3DMarquee1 style=3D"WIDTH: 220px; HEIGHT: 57px" trueSpeed =
scrollAmount=3D1=20
scrollDelay=3D20 direction=3Ddown behavior=3Dslide loop=3D1 =
border=3D"2"><FONT=20
size=3D1>____________________________________________</FONT></MARQUEE><BR=
><B><FONT=20
color=3D#000066 size=3D2></FONT><FONT face=3DVerdana color=3D#000066 =
size=3D2>George=20
Vieira<BR></FONT></B>
<MARQUEE id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" trueSpeed =
scrollAmount=3D1=20
scrollDelay=3D3 behavior=3Dslide loop=3D1 width=3D281 height=3D19 =
border=3D"0"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3Dblack =
size=3D1><B>Citadel=20
Computer Systems Pty Ltd</B></FONT></MARQUEE>
<MARQUEE id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" trueSpeed =
scrollAmount=3D1=20
scrollDelay=3D3 behavior=3Dslide loop=3D1 border=3D"0"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3Dblack =
size=3D1><B>Systems=20
Manager</B></FONT></MARQUEE><FONT face=3DVerdana>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 255px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D2 scrollDelay=3D5 direction=3Dright =
behavior=3Dslide loop=3D1=20
width=3D300 height=3D16 border=3D"0"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3D#000099 =
size=3D1>georgev AT=20
citadelcomputer DOT com DOT au</FONT></MARQUEE>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D1 scrollDelay=3D3 behavior=3Dslide loop=3D1=20
border=3D"0"></MARQUEE></FONT>
<DIV><FONT face=3D"Verdana, Verdana, Helvetica, sans-serif" =
color=3Dblack=20
size=3D1>Citadel Computer Systems Pty Ltd</FONT><FONT =
face=3DVerdana></DIV>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D1 scrollDelay=3D3 direction=3Dright =
behavior=3Dslide loop=3D1=20
border=3D"0"><FONT color=3Dblack size=3D1>Phone : +61 2 9955=20
2644</FONT></MARQUEE></FONT><FONT face=3DVerdana>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D1 scrollDelay=3D3 direction=3Dright =
behavior=3Dslide loop=3D1=20
border=3D"0"><FONT color=3Dblack size=3D1>HelpDesk: +61 2 9955=20
2698</FONT></MARQUEE></FONT>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D4 scrollDelay=3D5 direction=3Dright =
behavior=3Dslide loop=3D1=20
border=3D"0"><A href=3D"http://www.citadelcomputer.com.au/"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3D#000099 =
size=3D1><A=20
href=3D"http://www.citadelcomputer.com.au/">http://www.citadelcomputer.co=
m.au</FONT></A></MARQUEE></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
size=3D2>-----Original Message-----<BR><B>From:</B> Anthony R. Vallario=20
[mailto:avallario@tecmasters.com]<BR><B>Sent:</B> Monday, August 18, =
2003 9:06=20
AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> =
IPTABLES=20
Difficulties<BR><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>To whom it may concern;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; I have an iptables NAT box setup on Redhat 9.0. I =
recently=20
added a box behind the firewall that will act as a web server. I didn't =
want to=20
do a DMZ as money is tight. I used the following rules to get all =
outside=20
requests on port 80 to the web server inside:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-A PREROUTING -p tcp -i eth0 -d =
$publicip --dport=20
80 -j DNAT --to-destination $internalip<BR>-A PREROUTING -p tcp -i eth0 =
-d=20
$publicip --dport 443 -j DNAT --to-destination $internalip</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My only problem is when somebody behind =
the=20
firewall wants to access this webserver, it doesn't work. I don't want =
to have=20
to type in the internal ip. I don't want to install an internal dns =
server. I=20
would like my workstations to be able to type in the FQDN for the =
webserver and=20
it actually work. If NAT works, why doesn't it go out the firewall and =
turn=20
right back around and go to the webserver?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Anthony R. Vallario&nbsp;&nbsp;&nbsp;=20
</DIV></FONT></FONT></DIV></BODY></HTML>

------_=_NextPart_001_01C36516.7BBBC036--

