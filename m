From: =?iso-8859-1?Q?Juli=E1n_Mar=EDa_M=FCller_Frizza?=
 <julian_muller@speedy.com.ar>
Subject: 2 LANs in SERVER + 2 xDSL (pppOe) accounts. MASQUERADE both lans!
Date: Sat, 23 Aug 2003 05:37:44 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004801c36951$d2b01b50$e800a8c0@tecnico>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_m0RQjZxQVFSwCL7YxH6fLA)"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

--Boundary_(ID_m0RQjZxQVFSwCL7YxH6fLA)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable

The problem is describe here people: =
http://www.experts-exchange.com/Networking/Linux_Networking/Q_20680648.ht=
ml
But I will explain it again.=20

I have RED HAT 9 with 4 eths
And:
Two pppOE conections (2 xDSL accounts each one with his own eth) & Two =
LANS (2 more eths)
I want to masquerade LAN1 (eth0) to use ppp0
and masquerade LAN2 (eth2) to use ppp1

So is this: HOW route 1 ppp to 1 LAN and the other ppp conection to LAN =
2
LAN1 is 192.168.0.0 ---> to 192.168.0.1 (eth0)
LAN2 is 192.168.1.0 ---> to 192.168.1.1 (eth2)


I created both ppp xDSL accounts with adsl-setup
(when creating the ifcfg-ppp0 and ifcfg-ppp1 files, the setup =
automatically gave both accounts the same PID FILE, so ONLY one can be =
enabled at a given time.
I change ifcfg-ppp1 PID FILE name and now I can enabled BOTH AT THE SAME =
TIME. BUT IS THIS CORRECT?

when I do route -n I have this:


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

But well.
Tell me if configuring manually (changing pid file name in ppp1 script) =
is correct

Then: I used graffix quicktables script to crate the rc.firewall =
(iptables script)

The script was this:


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


Then to make what I want (masquerade both lans and that lan1 use ppp0, =
and lan2 use ppp1) patch and recompile kernel with ROUTE patch of =
C=E9dric de Launois
http://www.netfilter.org/documentation/pomlist/pom-extra.html#ROUTE


Well. after compiling kernel and test that ROUTE patch was OK. I modify =
rc.firewall script BUT didn't function. (may be i did a wrong script =
rc.firewall manually)
The second LAN (eth2) ---> ppp1 dont reach internet.

So. WHat should I do?

:)=

--Boundary_(ID_m0RQjZxQVFSwCL7YxH6fLA)
Content-type: text/html; charset=iso-8859-1
Content-transfer-encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
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

--Boundary_(ID_m0RQjZxQVFSwCL7YxH6fLA)--

