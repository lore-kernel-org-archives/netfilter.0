From: "Tim" <twr@bellsouth.net>
Subject: PS:Fw: seeking heavy weaponry !!
Date: Sun, 7 Jul 2002 16:42:35 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <003801c22610$11b96490$28d33cd0@nebuchadnezza>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0035_01C225D5.4C193F60"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: iptables <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0035_01C225D5.4C193F60
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

P.S.
almost forgot......I have a router (Cisco806 DSL) which is where I will =
have my external public ip address (on order) and this will be configure =
in a nat table on the router it self that will point to eth0...sorry =
about that. All Im doing is playing with iptable scripts so as to get =
some sort of handle on configuring the netfilter iptables firewall. This =
particular exercise is to allow icmp packets to flow through to the DMZ =
machines.

thanks
Tim


----- Original Message -----=20
From: Tim=20
To: iptables=20
Sent: Sunday, July 07, 2002 4:32 PM
Subject: seeking heavy weaponry !!


Hey ppl,

In Rusty Russell's packet filtering HOWTO there is an introduction, (to =
make short), "This HOWTO flips between a gentle introduction (which will =
leave you feeling warm and fuzzy now, but unprotected in the real world) =
and raw full-disclosure (which would leave all but the hardiest souls =
confused, paranoid and seeking heavy weaponry)."
=20
I feel like the latter, seeking heavy weaponry, I must be missing =
(obviously, since I'm writing to the list) something in my configuration =
of either the script or the box itself. This is what my script looks =
like:

#!/bin/bash
#
# This is my first attempt at a personalized iptables script #
#
## Variables ##
LOOPBACK=3D"lo"                                         ## Loopback =
Interface
EXTERNAL_NET=3D"eth0"                            ## External Interface
DMZ_NET=3D"eth1"                                      ## DMZ Interface
INTERNAL_NET=3D"eth2"                              ## Internal Interface
#
#
INTERNAL=3D"192.168.1.0/24"                     ## Network address for =
internal network
DMZ=3D"172.16.1.0/24"                               ## Network address =
for the DMZ
EXTERNAL=3D"192.168.2.0/24"                  ## Network address for =
external network
#
#
##INT_IP=3D"192.168.1.11"                       ## IP address of =
Internal Interface
  INT_IP=3D`ifconfig $INTERNAL_NET | grep "inet addr" | cut -d ":" -f 2 =
| cut -d " " -f 1`
#
##DMZ_IP=3D"172.16.1.1"                        ## IP address of DMZ =
Interface
  DMZ_IP=3D`ifconfig $DMZ_NET | grep "inet addr" | cut -d ":" -f 2 | cut =
-d " " -f 1`
#
##EXT_IP=3D"192.168.2.1"                      ## IP address of External =
Interface
  EXT_IP=3D`ifconfig $EXTERNAL_NET | grep "inet addr" | cut -d ":" -f 2 =
| cut -d " " -f 1`
#
LOG_LEVEL=3D"notice"   ## Default log level: kern.notice:
#
## Routing packets (traffic) between interfaces=20
echo 1 > /proc/sys/net/ipv4/ip_forward
#
#
echo "[---Flushing the chains---]"
iptables -F
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
#
#
#
echo "[--Setting Policies--]"
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD ACCEPT
#
#
## Allow inside traffic to get to the DMZ and back
iptables -A FORWARD -i $INTERNAL_NET -o $DMZ_NET -j ACCEPT
iptables -A FORWARD -i $DMZ_NET -o $INTERNAL_NET -j ACCEPT
iptables -A INPUT -i $INTERNAL_NET -s 192.168.1.0/24 -d 172.16.1.0/24 -p =
icmp -j ACCEPT
iptables -A OUTPUT -o $DMZ_NET -s 172.16.1.0/24 -d 192.168.1.0/24 -p =
icmp -j ACCEPT
iptables -A INPUT -i $DMZ_NET -s 192.168.1.0/24 -d 172.16.1.0/24 -p icmp =
-j ACCEPT
iptables -A OUTPUT -o $INTERNAL_NET -s 192.168.1.0/24 -d 172.16.1.0/24 =
-p icmp -j ACCEPT
#
#
After I loaded the script and verified with the command iptables -L I go =
to one of my internal machines and attempt to ping one of the two =
machines on the DMZ to no avail. I checked that the machine I'm pinging =
from has a default gateway...this would be the address of eth2. The =
command to allow ip_forwarding is on the script and I get no errors when =
I load the script or do I need to set the default gateways for each of =
the NICs on the firewall machine? I have tried this both ways ..... =
there is also a setting in the network configuration utility that will =
allow me to enable ip forwarding....I have also tried it with this. =
Hence, "seeking heavy weaponry", I generally understand the concept, =
however putting it into action is another story, which I'm sure some of =
you might have witnessed yourselves.

This is the output of the command iptables -L -n -v after I performed =
the ping from an internal machine to one of the DMZ machines.

Chain INPUT (policy DROP 2 packets, 310 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 ACCEPT     icmp --  eth2   *       192.168.1.0/24       =
172.16.1.0/24     =20
    0     0 ACCEPT     icmp --  eth1   *       192.168.1.0/24       =
172.16.1.0/24     =20

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 ACCEPT     all  --  eth2   eth1    0.0.0.0/0            =
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  eth1   eth2    0.0.0.0/0            =
0.0.0.0/0         =20

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 ACCEPT     icmp --  *      eth1    172.16.1.0/24        =
192.168.1.0/24    =20
    0     0 ACCEPT     icmp --  *      eth2    192.168.1.0/24       =
172.16.1.0/24   =20

As you can see the packets are making it to the INPUT chain but it is =
either being dropped at the INPUT chain because of incorrect rule =
structure or it is not being forwarded out through the FORWARD =
chain.....routing ??? Any insights will be gratefully appreciated. I =
dislike violence, so any input into a resolution and/or pointer to =
documentation will keep me from seeking any need for heavy weaponry.

Tim Rodriguez-- Mia/Fla.
Network Security Student
--
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems, but in the other direction.
The final 1% might not be routing, but check it anyway.
--
=20

------=_NextPart_000_0035_01C225D5.4C193F60
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>P.S.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>almost forgot......I have a router =
(Cisco806 DSL)=20
which is where I will have my external public ip address (on order) and =
this=20
will be configure in a nat table on the router it self that will point =
to=20
eth0...sorry about that. All Im doing is playing with iptable scripts so =
as to=20
get some sort of handle on configuring the netfilter iptables firewall. =
This=20
particular exercise is to allow icmp packets to flow through to the DMZ=20
machines.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Tim</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV style=3D"FONT: 10pt arial">----- Original Message -----=20
<DIV style=3D"BACKGROUND: #e4e4e4; font-color: black"><B>From:</B> <A=20
href=3D"mailto:twr@bellsouth.net" title=3Dtwr@bellsouth.net>Tim</A> =
</DIV>
<DIV><B>To:</B> <A href=3D"mailto:netfilter@lists.samba.org"=20
title=3Dnetfilter@lists.samba.org>iptables</A> </DIV>
<DIV><B>Sent:</B> Sunday, July 07, 2002 4:32 PM</DIV>
<DIV><B>Subject:</B> seeking heavy weaponry !!</DIV></DIV>
<DIV><BR></DIV>
<DIV><FONT face=3DArial size=3D2>Hey ppl,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>In Rusty Russell's packet filtering =
HOWTO there is=20
an introduction, (to make short), "This HOWTO flips between a gentle=20
introduction (which will leave you feeling warm and fuzzy now, but =
unprotected=20
in the real world) and raw full-disclosure (which would leave all but =
the=20
hardiest souls confused, paranoid and seeking heavy =
weaponry)."</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I feel like the latter, seeking heavy =
weaponry, I=20
must be missing (obviously, since I'm writing to the list) something in =
my=20
configuration of either the script or the box itself. This is what my =
script=20
looks like:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>#!/bin/bash<BR>#<BR># This is my first =
attempt at a=20
personalized iptables script #<BR>#<BR>## Variables=20
##<BR>LOOPBACK=3D"lo"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;## Loopback=20
Interface<BR>EXTERNAL_NET=3D"eth0"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ## External=20
Interface<BR>DMZ_NET=3D"eth1"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; ##=20
DMZ Interface<BR>INTERNAL_NET=3D"eth2"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ## Internal=20
Interface<BR>#<BR>#<BR>INTERNAL=3D"192.168.1.0/24"&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;=20
## Network address for internal=20
network<BR>DMZ=3D"172.16.1.0/24"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
## Network address for the=20
DMZ<BR>EXTERNAL=3D"192.168.2.0/24"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ## Network =
address for=20
external=20
network<BR>#<BR>#<BR>##INT_IP=3D"192.168.1.11"&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; ##=20
IP address of Internal Interface<BR>&nbsp; INT_IP=3D`ifconfig =
$INTERNAL_NET | grep=20
"inet addr" | cut -d ":" -f 2 | cut -d " " -f=20
1`<BR>#<BR>##DMZ_IP=3D"172.16.1.1"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;## IP address of DMZ Interface<BR>&nbsp;=20
DMZ_IP=3D`ifconfig $DMZ_NET | grep "inet addr" | cut -d ":" -f 2 | cut =
-d " " -f=20
1`<BR>#<BR>##EXT_IP=3D"192.168.2.1"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;##=20
IP address of External Interface<BR>&nbsp; EXT_IP=3D`ifconfig =
$EXTERNAL_NET | grep=20
"inet addr" | cut -d ":" -f 2 | cut -d " " -f=20
1`<BR>#<BR>LOG_LEVEL=3D"notice"&nbsp;&nbsp;&nbsp;## Default log level:=20
kern.notice:<BR>#<BR>## Routing packets (traffic) between interfaces =
<BR>echo 1=20
&gt; /proc/sys/net/ipv4/ip_forward<BR>#<BR>#<BR>echo "[---Flushing the=20
chains---]"<BR>iptables -F<BR>iptables -F INPUT<BR>iptables -F=20
OUTPUT<BR>iptables -F FORWARD<BR>#<BR>#<BR>#<BR>echo "[--Setting=20
Policies--]"<BR>iptables -P INPUT DROP<BR>iptables -P OUTPUT =
DROP<BR>iptables -P=20
FORWARD ACCEPT<BR>#<BR>#<BR>## Allow inside traffic to get to the DMZ =
and=20
back<BR>iptables -A FORWARD -i $INTERNAL_NET -o $DMZ_NET -j =
ACCEPT<BR>iptables=20
-A FORWARD -i $DMZ_NET -o $INTERNAL_NET -j ACCEPT<BR>iptables -A INPUT =
-i=20
$INTERNAL_NET -s 192.168.1.0/24 -d 172.16.1.0/24 -p icmp -j =
ACCEPT<BR>iptables=20
-A OUTPUT -o $DMZ_NET -s 172.16.1.0/24 -d 192.168.1.0/24 -p icmp -j=20
ACCEPT<BR>iptables -A INPUT -i $DMZ_NET -s 192.168.1.0/24 -d =
172.16.1.0/24 -p=20
icmp -j ACCEPT<BR>iptables -A OUTPUT -o $INTERNAL_NET -s 192.168.1.0/24 =
-d=20
172.16.1.0/24 -p icmp -j ACCEPT<BR>#<BR>#</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>After I loaded the script and verified =
with the=20
command iptables -L I go to one of my internal machines and attempt to =
ping one=20
of the two machines on the DMZ to no avail. I checked that the machine =
I'm=20
pinging from has a default gateway...this would be the address of eth2. =
The=20
command to allow ip_forwarding is on the script and I get no errors when =
I load=20
the script or do I need to set the default gateways for each of the NICs =
on the=20
firewall machine? I have tried this both ways ..... there is also a =
setting in=20
the network configuration utility that will allow me to enable ip=20
forwarding....I have also tried it with this. Hence, "seeking heavy =
weaponry", I=20
generally understand the concept, however putting it into action is =
another=20
story, which I'm sure some of you might have witnessed =
yourselves.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This is the output of the command =
iptables -L -n -v=20
after I performed the ping from an internal machine to one of the DMZ=20
machines.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain INPUT (policy DROP 2 packets, 310 =

bytes)<BR>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; icmp --&nbsp; eth2&nbsp;&nbsp;=20
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
192.168.1.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
172.16.1.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR>&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp; 0 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; icmp --&nbsp; =

eth1&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
192.168.1.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
172.16.1.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain FORWARD (policy ACCEPT 0 packets, =
0=20
bytes)<BR>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; eth2&nbsp;&nbsp;=20
eth1&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; eth1&nbsp;&nbsp;=20
eth2&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain OUTPUT (policy DROP 0 packets, 0=20
bytes)<BR>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; icmp --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
eth1&nbsp;&nbsp;&nbsp; =
172.16.1.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
192.168.1.0/24&nbsp;&nbsp;&nbsp;&nbsp; <BR>&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp; 0 ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; icmp --&nbsp; =

*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth2&nbsp;&nbsp;&nbsp;=20
192.168.1.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
172.16.1.0/24&nbsp;&nbsp;&nbsp; </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>As you can see the packets are making =
it to the=20
INPUT chain but it is either being dropped at the INPUT chain because of =

incorrect rule structure or it is not being forwarded out through the =
FORWARD=20
chain.....routing ??? Any insights will be gratefully appreciated. I =
dislike=20
violence, so any input into a resolution and/or pointer to documentation =
will=20
keep me from seeking any need for heavy weaponry.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Tim Rodriguez-- Mia/Fla.<BR>Network =
Security=20
Student</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>90% of networking problems are routing=20
problems.<BR>9 of the remaining 10% are routing problems, but in the =
other=20
direction.<BR>The final 1% might not be routing, but check it=20
anyway.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0035_01C225D5.4C193F60--


