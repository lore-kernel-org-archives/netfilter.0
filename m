From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: SMTP HTTP port allow
Date: Wed, 27 Aug 2003 20:40:20 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDMEHBNFAA.georgev@citadelcomputer.com.au>
References: <20030827065256.47173.qmail@web20708.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0010_01C36CDB.6ED4BFE0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030827065256.47173.qmail@web20708.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: ads nat <adsnat@yahoo.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0010_01C36CDB.6ED4BFE0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

You have not used MASQUERADE in your POSTROUTING rules or haven't showed
it..

iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.42 -d
207.106.22.35 --dport 80 -j MASQUERADE
iptables -A POSTROUTING -t nat -p tcp -s 192.168.0.23 -d
207.106.22.35 --dport 80 -j MASQUERADE


without the rules above, the 192.168.0.XX packets leave the network out into
the internet and eventually get dropped by some ISP...

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of ads nat
Sent: Wednesday, August 27, 2003 4:53 PM
To: netfilter@lists.netfilter.org
Subject: SMTP HTTP port allow


I am implimenting iptables for first time.
I want to allow all my LAN users to send emails to SMTP (port no. 25) all
destination with following code. :

***
iptables -A FORWARD -p tcp --dport 25 -j ACCEPT

***

I also want to allow LAN users having ip 192.168.0.42 192.168.0.23 to upload
contents to webserver on ip 207.106.22.35 (outside of LAN) with following
code.

***
iptables -A FORWARD -p tcp -s 192.168.0.42 192.168.0.23 -d
207.106.22.35 --dport 80 -j ACCEPT
***

I would loke know whether It works or not.
Tell me whether my code is O.K. also where can i check logs.
Thanks



----------------------------------------------------------------------------
----
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software

------=_NextPart_000_0010_01C36CDB.6ED4BFE0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D736143810-27082003><FONT face=3DArial color=3D#0000ff =
size=3D2>You=20
have not used MASQUERADE in your POSTROUTING rules or haven't showed=20
it..</FONT></SPAN></DIV>
<DIV><SPAN class=3D736143810-27082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV>iptables -A&nbsp;<SPAN class=3D736143810-27082003>POSTROUTING -t =
nat=20
</SPAN>-p tcp -s 192.168.0.42<SPAN class=3D736143810-27082003> -d =
207.106.22.35=20
--dport 80 -j MASQUERADE</SPAN></DIV>
<DIV><SPAN class=3D736143810-27082003></SPAN>iptables -A&nbsp;<SPAN=20
class=3D736143810-27082003>POSTROUTING -t nat </SPAN>-p tcp -s =
192.168.0.<SPAN=20
class=3D736143810-27082003>23 </SPAN>-d 207.106.22.35 --dport 80 -j=20
MASQUERADE</DIV>
<DIV><SPAN class=3D736143810-27082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D736143810-27082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D736143810-27082003><FONT face=3DArial color=3D#0000ff =

size=3D2>without the rules above, the 192.168.0.XX packets leave the =
network out=20
into the internet and eventually get dropped by some =
ISP...</FONT></SPAN></DIV>
<DIV><SPAN class=3D736143810-27082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
size=3D2>-----Original Message-----<BR><B>From:</B>=20
netfilter-admin@lists.netfilter.org=20
[mailto:netfilter-admin@lists.netfilter.org]<B>On Behalf Of </B>ads=20
nat<BR><B>Sent:</B> Wednesday, August 27, 2003 4:53 PM<BR><B>To:</B>=20
netfilter@lists.netfilter.org<BR><B>Subject:</B> SMTP HTTP port=20
allow<BR><BR></FONT></DIV>
<DIV>I am implimenting iptables for first time. </DIV>
<DIV>I want to allow all my LAN users to send emails to SMTP (port no.=20
25)&nbsp;all destination with following code. :</DIV>
<DIV>&nbsp;</DIV>
<DIV>***</DIV>
<DIV>iptables -A FORWARD -p tcp --dport 25 -j ACCEPT<BR>
<DIV>***</DIV>
<DIV>&nbsp;</DIV>
<DIV>I also want to allow LAN users having ip 192.168.0.42 192.168.0.23 =
to=20
upload contents to webserver on ip 207.106.22.35 (outside of =
LAN)&nbsp;with=20
following code. </DIV>
<DIV>&nbsp;</DIV>
<DIV>***</DIV>
<DIV>iptables -A FORWARD -p tcp -s 192.168.0.42 192.168.0.23 -d =
207.106.22.35=20
--dport 80 -j ACCEPT</DIV>
<DIV>***</DIV>
<DIV>&nbsp;</DIV>
<DIV>I would loke know whether It works or not.</DIV>
<DIV>Tell me whether my code is O.K. also where can i check logs.</DIV>
<DIV>Thanks<BR></DIV></DIV>
<P>
<HR SIZE=3D1>
Do you Yahoo!?<BR><A=20
href=3D"http://us.rd.yahoo.com/evt=3D10469/*http://sitebuilder.yahoo.com"=
>Yahoo!=20
SiteBuilder</A> - Free, easy-to-use web site design =
software</BODY></HTML>

------=_NextPart_000_0010_01C36CDB.6ED4BFE0--


