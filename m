From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: How to Block Mac Address ?
Date: Mon, 16 Jun 2003 10:31:28 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6EAE@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3339E.A08620E0"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C3339E.A08620E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have learnt that mac address matching only worked in certain chains.. =
I think it was INPUT and FORWARD only but not sure.. and I don't know =
why this was the case..
=20
try it on other chains and see the results.

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
From: Mohammad Shakir [mailto:shakirz1@yahoo.com]
Sent: Sunday, June 15, 2003 4:56 PM
To: netfilter@lists.samba.org
Subject: How to Block Mac Address ?



I want to block a mac address for this I complie this rule=20
but it is not working, any friend who can slove this problem.


#  Flush all Rules
/sbin/iptables --flush
/sbin/iptables --table nat --flush
/sbin/iptables --delete-chain
/sbin/iptables --table nat --delete-cha
/sbin/iptables -N MACtest

#  to block this MAC Address
/sbin/iptables -t filter -A FORWARD -j MACtest
/sbin/iptables -A MACtest -m mac --mac-source 00:02:55:EE:65:D8 -j DROP

#  for MASQUREADE
/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 =
--out-interface ppp0 -j MASQUERADE

echo "1" > /proc/sys/net/ipv4/ip_forward



  _____ =20

Do you Yahoo!?
SBC  =
<http://pa.yahoo.com/*http://rd.yahoo.com/evt=3D1207/*http://promo.yahoo.=
com/sbc/> Yahoo! DSL - Now only $29.95 per month!

------_=_NextPart_001_01C3339E.A08620E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D589323000-16062003>I have=20
learnt that mac address matching only worked in certain chains.. I think =
it was=20
INPUT and FORWARD only but not sure.. and I don't know why this was the=20
case..</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D589323000-16062003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D589323000-16062003>try it=20
on other chains and see the results.</SPAN></FONT></DIV>
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
scrollDelay=3D3 behavior=3Dslide loop=3D1 border=3D"0"><FONT=20
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
size=3D2>-----Original Message-----<BR><B>From:</B> Mohammad Shakir=20
[mailto:shakirz1@yahoo.com]<BR><B>Sent:</B> Sunday, June 15, 2003 4:56=20
PM<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> How to =
Block Mac=20
Address ?<BR><BR></FONT></DIV>
<P>I want to block a mac address for this I complie this rule <BR>but it =
is not=20
working, any friend who can slove this problem.</P>
<P><BR>#&nbsp; Flush all Rules<BR>/sbin/iptables =
--flush<BR>/sbin/iptables=20
--table nat --flush<BR>/sbin/iptables --delete-chain<BR>/sbin/iptables =
--table=20
nat --delete-cha<BR>/sbin/iptables -N MACtest</P>
<P>#&nbsp; to block this MAC Address<BR>/sbin/iptables -t filter -A =
FORWARD -j=20
MACtest<BR>/sbin/iptables -A MACtest -m mac --mac-source =
00:02:55:EE:65:D8 -j=20
DROP</P>
<P>#&nbsp; for MASQUREADE<BR>/sbin/iptables --table nat --append =
POSTROUTING -s=20
192.168.0.0/24 --out-interface ppp0 -j MASQUERADE</P>
<P>echo "1" &gt; /proc/sys/net/ipv4/ip_forward<BR></P>
<DIV></DIV>
<P>
<HR SIZE=3D1>
Do you Yahoo!?<BR><A=20
href=3D"http://pa.yahoo.com/*http://rd.yahoo.com/evt=3D1207/*http://promo=
.yahoo.com/sbc/">SBC=20
Yahoo! DSL</A> - Now only $29.95 per month!</BODY></HTML>

------_=_NextPart_001_01C3339E.A08620E0--

