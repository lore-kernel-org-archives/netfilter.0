From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: REDIRECT
Date: Fri, 8 Aug 2003 07:53:01 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C077@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C35D2E.45E8073E"
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
To: jmurlick@sicredi.com.br, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C35D2E.45E8073E
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please don't use the word "it" as "it" doesn't define the problem.
=20
You have 3 networks (192.168.1.0/24,10.0.0.X,172.16.15.X), are all the =
default gateways been defined?
Have you done a tcpdump and log packets to determine where it's getting =
stuck?
=20
Your problem is most likely that Server1 either doesn't have routes for =
those networks (since your not using MASQUERADE) or you have DROP rules =
which aren't shown on this email.
Are all the default policies ACCEPT or DROP or what?

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
From: Juliano Murlick [mailto:jmurlick@sicredi.com.br]
Sent: Friday, August 08, 2003 3:38 AM
To: netfilter@lists.netfilter.org
Subject: REDIRECT
Importance: High


Hello All,
I wanna rediect all conections from 192.168.1.0/24 network to a 10.0.0.2 =
server on 80 port for a 172.65.15.11 server, also on  80 port,  for =
that, i did some things:=20
=20
1 - All rules/iptables is on route 1;
2 - The route 2 don't filter any packet, just route, i can ping from a =
client machine (192.168.1.25) to the both server and connect to a 80 =
port on both server, and then, i don't have any problem of routing. When =
a read the rules i can't connect any more on server 10.0.0.2, just =
direct to a server 172.16.15.11;
3 - My rules on iptables are:
=20
    iptables -A FORWARD -p tcp -s 192.168.1.0/24 --sport 1024:65535 -d =
10.0.0.2--dport 80 -j ACCEPT
    iptables -A FORWARD -p tcp -s 192.168.1.0/24 --sport 1024:65535 -d =
172.16.15.11--dport 80 -j ACCEPT
    iptables -t nat -A PREROUTING -p tcp --sport 1024:65535 -d 10.0.0.2 =
--dport 80 -j DNAT --to 172.16.15.11:80

=20
=20
                                                         (Server 1)
                                                        +----------+
      (Client)           ( Linux - Router 1)       |----| 10.0.0.2 |
 +---------------+    +-----------------------+    |    +----------+
 | 192.168.1.25  |----|192.168.1.1 / 10.0.0.1 |----|                     =

 +---------------+    +-----------------------+    |          (Route 2)  =
              (Server 2)
                                                   |    =
+----------------------+    +--------------+
                                                   |----|10.0.0.3 / =
172.16.15.1|----| 172.16.15.11 |
                                                        =
+----------------------+    +--------------+
=20
=20
But it doesn't working ... anyone has any idea ???=20
=20
Thanks in advance!
=20
Att,
Juliano Murlick
=20

------_=_NextPart_001_01C35D2E.45E8073E
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D338264921-07082003><FONT face=3DArial color=3D#0000ff =
size=3D2>Please=20
don't use the word "it" as "it" doesn't define the =
problem.</FONT></SPAN></DIV>
<DIV><SPAN class=3D338264921-07082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D338264921-07082003><FONT face=3DArial color=3D#0000ff =
size=3D2>You=20
have 3 networks (192.168.1.0/24,10.0.0.X,172.16.15.X), are all the =
default=20
gateways been defined?</FONT></SPAN></DIV>
<DIV><SPAN class=3D338264921-07082003><FONT face=3DArial color=3D#0000ff =
size=3D2>Have=20
you done a tcpdump and log packets to determine where it's getting=20
stuck?</FONT></SPAN></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D338264921-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D338264921-07082003><FONT face=3DArial color=3D#0000ff =
size=3D2>Your=20
problem is most likely that Server1 either doesn't have routes for those =

networks (since your not using MASQUERADE) or you have DROP rules which =
aren't=20
shown on this email.</FONT></SPAN></DIV>
<DIV><SPAN class=3D338264921-07082003><FONT face=3DArial color=3D#0000ff =
size=3D2>Are=20
all the default policies ACCEPT or DROP or what?</FONT></SPAN></DIV>
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
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
size=3D2>-----Original Message-----<BR><B>From:</B> Juliano Murlick=20
[mailto:jmurlick@sicredi.com.br]<BR><B>Sent:</B> Friday, August 08, 2003 =
3:38=20
AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B>=20
REDIRECT<BR><B>Importance:</B> High<BR><BR></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>Hello=20
All,</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>I wanna=20
rediect all conections from 192.168.1.0/24&nbsp;network to=20
a&nbsp;10.0.0.2&nbsp;server on&nbsp;80 port for a&nbsp;172.65.15.11 =
server, also=20
on &nbsp;80 port,&nbsp; for that, i did&nbsp;some=20
things:&nbsp;</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN=20
class=3D687483316-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>1 - All=20
rules/iptables is on route 1;</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>2 - The=20
route 2 don't filter any packet, just route, i can ping from a client =
machine=20
(192.168.1.25) to the both server and connect to a 80 port on both =
server, and=20
then, i don't&nbsp;have any problem of routing. When a read the rules i =
can't=20
connect any more on server 10.0.0.2, just direct to a server=20
172.16.15.11;</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>3 - My rules=20
on iptables are:</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN=20
class=3D687483316-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003><SPAN=20
class=3D687483316-07082003>&nbsp;&nbsp;&nbsp;&nbsp;iptables -A FORWARD =
-p tcp -s=20
192.168.1.0/24 --sport 1024:65535 -d 10.0.0.2--dport&nbsp;80 -j=20
ACCEPT</SPAN></SPAN></FONT></DIV>
<DIV><FONT size=3D2><SPAN class=3D687483316-07082003><FONT=20
face=3D"Courier New">&nbsp;&nbsp;&nbsp;&nbsp;iptables -A FORWARD -p tcp =
-s=20
192.168.1.0/24 --sport 1024:65535 -d 172.16.15.11--dport&nbsp;80 -j=20
ACCEPT<BR>&nbsp;&nbsp;&nbsp; iptables -t nat -A PREROUTING -p tcp =
--sport=20
1024:65535 -d 10.0.0.2 --dport&nbsp;80 -j DNAT --to=20
172.16.15.11:80<BR></FONT></DIV></SPAN></FONT>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN=20
class=3D687483316-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN=20
class=3D687483316-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2><FONT face=3D"Courier New"><SPAN=20
class=3D687483316-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN>(Server 1)</FONT></FONT></DIV>
<DIV><SPAN class=3D687540614-07082003><FONT face=3D"Courier New" =
size=3D2>&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
+----------+</FONT></SPAN></DIV>
<DIV><SPAN class=3D687540614-07082003><FONT size=3D2><FONT =
face=3D"Courier New"><SPAN=20
class=3D687540614-07082003><SPAN class=3D687540614-07082003>&nbsp;&nbsp; =

&nbsp;&nbsp;&nbsp;(Client)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPA=
N>&nbsp;&nbsp;&nbsp;&nbsp;(<SPAN=20
class=3D687483316-07082003> Linux - </SPAN>Router=20
1)&nbsp;</SPAN>&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687483316-07082003>&nbsp;</SPAN>&nbsp; |----| 10.0.0.2=20
|</FONT></FONT></SPAN></DIV>
<DIV><SPAN class=3D687540614-07082003><FONT face=3D"Courier New"><FONT =
size=3D2><SPAN=20
class=3D687540614-07082003><SPAN class=3D687540614-07082003><SPAN=20
class=3D687483316-07082003>&nbsp;</SPAN>+--------------<SPAN=20
class=3D687483316-07082003>-</SPAN>+</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;+</SPA=
N>-----------------------+&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;<SPAN class=3D687483316-07082003>=20
</SPAN>+----------+</FONT></FONT></SPAN></DIV>
<DIV><SPAN class=3D687540614-07082003><FONT face=3D"Courier New"><FONT =
size=3D2><SPAN=20
class=3D687540614-07082003><SPAN=20
class=3D687540614-07082003>&nbsp;|&nbsp;192.168.1.25<SPAN=20
class=3D687483316-07082003>&nbsp;&nbsp;</SPAN>|----</SPAN>|192.168.1.1</S=
PAN>&nbsp;/&nbsp;10.0.0.1&nbsp;|----|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
</FONT></FONT></SPAN></DIV>
<DIV><SPAN class=3D687540614-07082003><FONT face=3D"Courier New"><FONT =
size=3D2><SPAN=20
class=3D687540614-07082003><SPAN=20
class=3D687483316-07082003>&nbsp;</SPAN>+---------------+&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;</SPAN>=20
</SPAN>+-----------------------+&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687483316-07082003>&nbsp;&nbsp; </SPAN>(Route=20
2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
(Server 2)</FONT></FONT></SPAN></DIV>
<DIV><FONT face=3D"Courier New"><FONT size=3D2><SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
</SPAN>&nbsp;<SPAN=20
class=3D687483316-07082003> </SPAN>|&nbsp;<SPAN =
class=3D687483316-07082003>&nbsp;=20
</SPAN>&nbsp;+--------<SPAN=20
class=3D687483316-07082003>-</SPAN>-------------+&nbsp;&nbsp;&nbsp;=20
+--------------<SPAN=20
class=3D687483316-07082003>+</SPAN></SPAN></FONT></FONT></DIV>
<DIV><FONT size=3D+0><SPAN class=3D687540614-07082003><FONT =
face=3D"Courier New"><FONT=20
size=3D2><SPAN class=3D687540614-07082003>&nbsp;<SPAN =
class=3D687483316-07082003>=20
</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<=
/SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687483316-07082003>&nbsp;&nbsp;&nbsp;&nbsp; =
</SPAN>|----|10.0.0.3&nbsp;/=20
172.16.15.1<SPAN class=3D687483316-07082003>|</SPAN>----|<SPAN=20
class=3D687483316-07082003> </SPAN>172.16.15.11<SPAN =
class=3D687483316-07082003>=20
</SPAN>|</FONT></FONT></SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN>&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687483316-07082003>&nbsp;</SPAN></SPAN>&nbsp;&nbsp;<SPAN=20
class=3D687483316-07082003> </SPAN>&nbsp;+------<SPAN=20
class=3D687483316-07082003>-</SPAN>---------------+&nbsp;&nbsp;&nbsp;=20
+--------------+</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>But it=20
doesn't working ... anyone has any idea ??? </SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D687483316-07082003><FONT face=3D"Courier New" =
size=3D2>Thanks in=20
advance!</FONT></SPAN></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>A<SPAN=20
class=3D687483316-07082003>tt</SPAN>,<BR>Juliano Murlick</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C35D2E.45E8073E--

