From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: 2 LANs in SERVER + 2 xDSL (pppOe) accounts. MASQUERADE both lans!
Date: Sun, 24 Aug 2003 11:51:32 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C180@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C369E2.3E3844CA"
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
To: =?iso-8859-1?Q?Juli=E1n_Mar=EDa_M=FCller_Frizza?= <julian_muller@speedy.com.ar>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C369E2.3E3844CA
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

http://www.samag.com/documents/s=3D1824/sam0201h/0201h.htm
=20
try this url for reference. it's a setup for redunancy routing with 2 =
links, some minor adjustments and you should be able to get it working =
for 2 lans..
=20
You basically have to use iproute2 to route via the SOURCE IP and not =
the destination which is basic routing.
=20
so you check the source ip and route via ISP1 for LAN1 and check the =
sourceip for LAN2 and route that via ISP2..
=20
basically ;)
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
From: Juli=E1n Mar=EDa M=FCller Frizza =
[mailto:julian_muller@speedy.com.ar]
Sent: Saturday, August 23, 2003 6:38 PM
To: netfilter@lists.netfilter.org
Subject: 2 LANs in SERVER + 2 xDSL (pppOe) accounts. MASQUERADE both =
lans!


The problem is describe here people: =
http://www.experts-exchange.com/Networking/Linux_Networking/Q_20680648.ht=
ml
But I will explain it again.=20
=20
I have RED HAT 9 with 4 eths
And:
Two pppOE conections (2 xDSL accounts each one with his own eth) & Two =
LANS (2 more eths)
I want to masquerade LAN1 (eth0) to use ppp0
and masquerade LAN2 (eth2) to use ppp1
=20
So is this: HOW route 1 ppp to 1 LAN and the other ppp conection to LAN =
2
LAN1 is 192.168.0.0 ---> to 192.168.0.1 (eth0)
LAN2 is 192.168.1.0 ---> to 192.168.1.1 (eth2)

=20
I created both ppp xDSL accounts with adsl-setup
(when creating the ifcfg-ppp0 and ifcfg-ppp1 files, the setup =
automatically gave both accounts the same PID FILE, so ONLY one can be =
enabled at a given time.
I change ifcfg-ppp1 PID FILE name and now I can enabled BOTH AT THE SAME =
TIME. BUT IS THIS CORRECT?
=20
when I do route -n I have this:
=20
=20
                                GATEWAY
192.168.96.240      0.0.0.0         255.255.255.255 UH    0      0       =
 0 ppp0
192.168.96.240      0.0.0.0         255.255.255.255 UH    0      0       =
 0 ppp1
10.0.0.0                  0.0.0.0         255.255.255.0        U     0   =
   0        0 eth3
10.0.0.0                  0.0.0.0         255.255.255.0        U     0   =
   0        0 eth3
192.168.1.0            0.0.0.0         255.255.255.0        U     0      =
0        0 eth2
192.168.0.0         0.0.0.0            255.255.255.0        U     0      =
0        0 eth0
169.254.0.0         0.0.0.0            255.255.0.0             U     0   =
   0        0 eth3
127.0.0.0              0.0.0.0            255.0.0.0                 U    =
 0      0        0 lo
0.0.0.0         192.168.96.240  0.0.0.0                    UG    0      =
0        0 ppp0

Only one ppp0 is the default gateway.
=20
But well.
Tell me if configuring manually (changing pid file name in ppp1 script) =
is correct
=20
Then: I used graffix quicktables script to crate the rc.firewall =
(iptables script)
=20
The script was this:
=20
=20
------------------------------------------------------------------
# path to iptables
iptables=3D"/sbin/iptables"

if [ -e /proc/sys/net/ipv4/tcp_syncookies ]; then echo 1 > =
/proc/sys/net/ipv4/tcp_syncookies; fi
if [ -e /proc/sys/net/ipv4/ip_forward ]; then echo 1 > =
/proc/sys/net/ipv4/ip_forward; fi

# DEFAULT=20
$iptables -F INPUT
$iptables -F OUTPUT
$iptables -P INPUT DROP
$iptables -P OUTPUT ACCEPT

# NAT
$iptables -F FORWARD
$iptables -F -t nat
$iptables -P FORWARD DROP
$iptables -A FORWARD -i eth0 -j ACCEPT
$iptables -A INPUT -i eth0 -j ACCEPT
$iptables -A OUTPUT -o eth0 -j ACCEPT
$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o ppp0 -j MASQUERADE

# allow all packets on the loopback interface
$iptables -A INPUT -i lo -j ACCEPT
$iptables -A OUTPUT -o lo -j ACCEPT

# allow established and related packets back in
$iptables -A INPUT -i ppp0 -m state --state ESTABLISHED,RELATED -j =
ACCEPT

# icmp
$iptables -A OUTPUT -p icmp -m state --state NEW -j ACCEPT
$iptables -A INPUT -p icmp -m state --state ESTABLISHED,RELATED -j =
ACCEPT
$iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s =
-i ppp0 -j ACCEPT

# open ports to the firewall
$iptables -A INPUT -p tcp --dport 21 -j ACCEPT
$iptables -A INPUT -p tcp --dport 80 -j ACCEPT
$iptables -A INPUT -p tcp --dport 25 -j ACCEPT
$iptables -A INPUT -p tcp --dport 23 -j ACCEPT
$iptables -A INPUT -p tcp --dport 100 -j ACCEPT
$iptables -A INPUT -p tcp --dport 110 -j ACCEPT
$iptables -A INPUT -p tcp --dport 81 -j ACCEPT
$iptables -A INPUT -p tcp --dport 27015 -j ACCEPT
$iptables -A INPUT -p tcp --dport 27016 -j ACCEPT
/sbin/iptables -A INPUT -p udp --dport 53 -j ACCEPT
/sbin/iptables -A INPUT -p udp --dport 514 -j ACCEPT

=20
# drop all other packets
$iptables -A INPUT -i ppp0 -p tcp --dport 0:65535 -j DROP

$iptables -A INPUT -i ppp0 -p udp --dport 0:65535 -j DROP

-------------------------------------------------------------------------=
---------

=20
Then to make what I want (masquerade both lans and that lan1 use ppp0, =
and lan2 use ppp1) patch and recompile kernel with ROUTE patch of =
C=E9dric de Launois
http://www.netfilter.org/documentation/pomlist/pom-extra.html#ROUTE
=20
=20
Well. after compiling kernel and test that ROUTE patch was OK. I modify =
rc.firewall script BUT didn't function. (may be i did a wrong script =
rc.firewall manually)
The second LAN (eth2) ---> ppp1 dont reach internet.
=20
So. WHat should I do?
=20
:)

------_=_NextPart_001_01C369E2.3E3844CA
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
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><A=20
href=3D"http://www.samag.com/documents/s=3D1824/sam0201h/0201h.htm">http:=
//www.samag.com/documents/s=3D1824/sam0201h/0201h.htm</A></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D984594901-24082003><FONT face=3DArial color=3D#0000ff =
size=3D2>try=20
this url for reference. it's a setup for redunancy routing with 2 links, =
some=20
minor adjustments and you should be able to get it working for 2=20
lans..</FONT></SPAN></DIV>
<DIV><SPAN class=3D984594901-24082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D984594901-24082003><FONT face=3DArial color=3D#0000ff =
size=3D2>You=20
basically have to use iproute2 to route via the SOURCE IP and not the=20
destination which is basic routing.</FONT></SPAN></DIV>
<DIV><SPAN class=3D984594901-24082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D984594901-24082003><FONT face=3DArial color=3D#0000ff =
size=3D2>so you=20
check the source ip and route via ISP1 for LAN1 and check the sourceip =
for LAN2=20
and route that via ISP2..</FONT></SPAN></DIV>
<DIV><SPAN class=3D984594901-24082003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D984594901-24082003><FONT face=3DArial color=3D#0000ff =

size=3D2>basically ;)</FONT></SPAN></DIV>
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
size=3D2>-----Original Message-----<BR><B>From:</B> Juli=E1n Mar=EDa =
M=FCller Frizza=20
[mailto:julian_muller@speedy.com.ar]<BR><B>Sent:</B> Saturday, August =
23, 2003=20
6:38 PM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> 2 =
LANs in=20
SERVER + 2 xDSL (pppOe) accounts. MASQUERADE both =
lans!<BR><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The problem is describe here people: <A =

href=3D"http://www.experts-exchange.com/Networking/Linux_Networking/Q_206=
80648.html">http://www.experts-exchange.com/Networking/Linux_Networking/Q=
_20680648.html</A></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But I will explain it again. =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have RED HAT 9 with 4 =
eths</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>And:</FONT></DIV>
<DIV>Two pppOE conections (2 xDSL accounts each one with his own eth) =
&amp; Two=20
LANS (2 more eths)</DIV>
<DIV><FONT face=3DArial size=3D2>I want to masquerade LAN1 (eth0) to use =

ppp0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and masquerade LAN2 (eth2) to use =
ppp1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>So is this:&nbsp;HOW route 1 ppp to 1 LAN&nbsp;and the other ppp =
conection=20
to LAN 2</DIV>
<DIV><FONT face=3DArial size=3D2>LAN1 is 192.168.0.0 ---&gt; to =
192.168.0.1=20
(eth0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>LAN2 is 192.168.1.0 ---&gt; to =
192.168.1.1=20
(eth2)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial=20
size=3D2></FONT><BR>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I created both ppp xDSL accounts with=20
adsl-setup</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(when creating the ifcfg-ppp0 and =
ifcfg-ppp1 files,=20
the setup automatically gave both accounts the same PID FILE, so ONLY =
one can be=20
enabled at a given time.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I change ifcfg-ppp1 PID FILE name and =
now I can=20
enabled BOTH AT THE SAME TIME. BUT IS THIS CORRECT?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>when I do route -n I have =
this:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; GATEWAY</FONT></DIV>
<DIV>192.168.96.240 &nbsp;&nbsp;&nbsp;&nbsp; 0.0.0.0 &nbsp; &nbsp; =
&nbsp; &nbsp;=20
255.255.255.255 UH &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; =
&nbsp;=20
&nbsp;0 ppp0<BR>192.168.96.240 &nbsp;&nbsp;&nbsp;&nbsp; 0.0.0.0 &nbsp; =
&nbsp;=20
&nbsp; &nbsp; 255.255.255.255 UH &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp;0 =
&nbsp;=20
&nbsp; &nbsp; &nbsp;0=20
ppp1<BR>10.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0.0.0=20
&nbsp; &nbsp; &nbsp; &nbsp; 255.255.255.0 &nbsp; &nbsp; &nbsp; &nbsp;U =
&nbsp;=20
&nbsp; 0 &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0=20
eth3<BR>10.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0.0.0=20
&nbsp; &nbsp; &nbsp; &nbsp; 255.255.255.0 &nbsp; &nbsp; &nbsp; &nbsp;U =
&nbsp;=20
&nbsp; 0 &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0=20
eth3<BR>192.168.1.0&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.255.255.0 =
&nbsp;=20
&nbsp; &nbsp; &nbsp;U &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp;0 &nbsp; =
&nbsp; &nbsp;=20
&nbsp;0 eth2<BR>192.168.0.0 &nbsp; &nbsp; &nbsp; &nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
255.255.255.0=20
&nbsp; &nbsp; &nbsp; &nbsp;U &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp;0 =
&nbsp; &nbsp;=20
&nbsp; &nbsp;0 eth0<BR>169.254.0.0 &nbsp; &nbsp; &nbsp; &nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
255.255.0.0=20
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; U &nbsp; &nbsp; 0 &nbsp; =
&nbsp;=20
&nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 eth3<BR>127.0.0.0 &nbsp; &nbsp; =
&nbsp;=20
&nbsp; &nbsp; &nbsp; &nbsp;0.0.0.0&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; 255.0.0.0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;=20
&nbsp; U &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; =
&nbsp;0=20
lo<BR>0.0.0.0 &nbsp; &nbsp; &nbsp; &nbsp; 192.168.96.240 &nbsp;0.0.0.0 =
&nbsp;=20
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;UG &nbsp; =
&nbsp;0=20
&nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 ppp0<BR></DIV>
<DIV><FONT face=3DArial size=3D2>Only one ppp0 is the default =
gateway.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>But well.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Tell me if configuring manually =
(changing pid file=20
name in ppp1 script) is correct</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Then: I used graffix quicktables script =
to crate=20
the rc.firewall (iptables script)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The script was this:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
--</FONT></DIV>
<DIV># path to iptables<BR>iptables=3D"/sbin/iptables"<BR><BR>if [ -e=20
/proc/sys/net/ipv4/tcp_syncookies ]; then echo 1 &gt;=20
/proc/sys/net/ipv4/tcp_syncookies; fi<BR>if [ -e =
/proc/sys/net/ipv4/ip_forward=20
]; then echo 1 &gt; /proc/sys/net/ipv4/ip_forward; fi<BR><BR># DEFAULT=20
<BR>$iptables -F INPUT<BR>$iptables -F OUTPUT<BR>$iptables -P INPUT=20
DROP<BR>$iptables -P OUTPUT ACCEPT<BR><BR># NAT<BR>$iptables -F=20
FORWARD<BR>$iptables -F -t nat<BR>$iptables -P FORWARD DROP<BR>$iptables =
-A=20
FORWARD -i eth0 -j ACCEPT<BR>$iptables -A INPUT -i eth0 -j =
ACCEPT<BR>$iptables=20
-A OUTPUT -o eth0 -j ACCEPT<BR>$iptables -A FORWARD -m state --state=20
ESTABLISHED,RELATED -j ACCEPT<BR>$iptables -t nat -A POSTROUTING -s=20
192.168.0.0/24 -o ppp0 -j MASQUERADE<BR><BR># allow all packets on the =
loopback=20
interface<BR>$iptables -A INPUT -i lo -j ACCEPT<BR>$iptables -A OUTPUT =
-o lo -j=20
ACCEPT<BR><BR># allow established and related packets back =
in<BR>$iptables -A=20
INPUT -i ppp0 -m state --state ESTABLISHED,RELATED -j ACCEPT<BR><BR>#=20
icmp<BR>$iptables -A OUTPUT -p icmp -m state --state NEW -j =
ACCEPT<BR>$iptables=20
-A INPUT -p icmp -m state --state ESTABLISHED,RELATED -j =
ACCEPT<BR>$iptables -A=20
INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -i ppp0 -j=20
ACCEPT<BR><BR># open ports to the firewall<BR>$iptables -A INPUT -p tcp =
--dport=20
21 -j ACCEPT<BR>$iptables -A INPUT -p tcp --dport 80 -j =
ACCEPT<BR>$iptables -A=20
INPUT -p tcp --dport 25 -j ACCEPT<BR>$iptables -A INPUT -p tcp --dport =
23 -j=20
ACCEPT<BR>$iptables -A INPUT -p tcp --dport 100 -j ACCEPT<BR>$iptables =
-A INPUT=20
-p tcp --dport 110 -j ACCEPT<BR>$iptables -A INPUT -p tcp --dport 81 -j=20
ACCEPT<BR>$iptables -A INPUT -p tcp --dport 27015 -j ACCEPT<BR>$iptables =
-A=20
INPUT -p tcp --dport 27016 -j ACCEPT<BR>/sbin/iptables -A INPUT -p udp =
--dport=20
53 -j ACCEPT<BR>/sbin/iptables -A INPUT -p udp --dport 514 -j=20
ACCEPT<BR><BR>&nbsp;<BR># drop all other packets<BR>$iptables -A INPUT =
-i ppp0=20
-p tcp --dport 0:65535 -j DROP<BR><BR>$iptables -A INPUT -i ppp0 -p udp =
--dport=20
0:65535 -j DROP<BR></DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
------------------</FONT><BR></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Then to make what I want (masquerade =
both lans and=20
that lan1 use ppp0, and lan2 use ppp1) patch and recompile kernel with =
ROUTE=20
patch of <FONT size=3D3>C=E9dric de Launois</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><A=20
href=3D"http://www.netfilter.org/documentation/pomlist/pom-extra.html#ROU=
TE">http://www.netfilter.org/documentation/pomlist/pom-extra.html#ROUTE</=
A></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Well. after compiling kernel and test =
that ROUTE=20
patch was OK. I modify rc.firewall script BUT didn't function. (may be i =
did a=20
wrong script rc.firewall manually)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The second LAN (eth2) ---&gt; ppp1 dont =
reach=20
internet.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So. WHat should I do?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>:)</FONT></DIV></BODY></HTML>

------_=_NextPart_001_01C369E2.3E3844CA--

