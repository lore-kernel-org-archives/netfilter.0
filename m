From: "Mark Coetser" <mark@thummb.com>
Subject: load balanced adsl lines
Date: Sun, 4 Jul 2004 12:52:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01dc01c461b4$f0828670$fe00000a@citadel>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01D9_01C461C5.B4042A80"
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

------=_NextPart_000_01D9_01C461C5.B4042A80
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Ppl

I have 5 adsl lines that after reading quite a bit i managed to get load =
balanced now abvoiusly it doesnt load balance evenly and this works on =
what routes are still in the routing cache. my question is my outbound =
masquerading had to be modified to use snat in iptables instead of just =
plain masquerading my outbound masquerading now works but my inbound =
port forwarding doesnt work would this be an iptables problem or a =
routing issue...

i have opened all the relavent ports on each of the interfaces and I am =
not getting any logged denies the connection just never opens

I am running the following

debian woody

kernel 2.6.6

iptables v1.2.6a

Chain PREROUTING (policy ACCEPT 20 packets, 4483 bytes)
 pkts bytes target     prot opt in     out     source               =
destination
    0     0 DNAT       tcp  --  ppp0   *       0.0.0.0/0            =
0.0.0.0/0          tcp dpt:110 to:10.0.0.12:110
    0     0 DNAT       tcp  --  ppp1   *       0.0.0.0/0            =
0.0.0.0/0          tcp dpt:110 to:10.0.0.12:110
    0     0 DNAT       tcp  --  ppp2   *       0.0.0.0/0            =
0.0.0.0/0          tcp dpt:110 to:10.0.0.12:110
    0     0 DNAT       tcp  --  ppp3   *       0.0.0.0/0            =
0.0.0.0/0          tcp dpt:110 to:10.0.0.12:110
    0     0 DNAT       tcp  --  ppp4   *       0.0.0.0/0            =
0.0.0.0/0          tcp dpt:110 to:10.0.0.12:110

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               =
destination
    0     0 ACCEPT     tcp  --  ppp0   eth0    0.0.0.0/0            =
10.0.0.12          tcp dpt:110
    0     0 ACCEPT     tcp  --  ppp1   eth0    0.0.0.0/0            =
10.0.0.12          tcp dpt:110
    0     0 ACCEPT     tcp  --  ppp2   eth0    0.0.0.0/0            =
10.0.0.12          tcp dpt:110
    0     0 ACCEPT     tcp  --  ppp3   eth0    0.0.0.0/0            =
10.0.0.12          tcp dpt:110
    0     0 ACCEPT     tcp  --  ppp4   eth0    0.0.0.0/0            =
10.0.0.12          tcp dpt:110


ip rule list
0:      from all lookup local
32761:  from 165.165.170.110 lookup T5
32762:  from 165.165.187.47 lookup T4
32763:  from 165.165.189.95 lookup T3
32764:  from 165.165.163.95 lookup T2
32765:  from 165.165.179.151 lookup T1
32766:  from all lookup main
32767:  from all lookup default

ip route sh
165.165.160.1 dev ppp1  proto kernel  scope link  src 165.165.163.95
165.165.160.1 dev ppp3  proto kernel  scope link  src 165.165.187.47
165.165.160.1 dev ppp4  proto kernel  scope link  src 165.165.170.110
165.165.160.1 dev ppp0  proto kernel  scope link  src 165.165.179.151
165.165.160.1 dev ppp2  proto kernel  scope link  src 165.165.189.95
10.0.0.0/24 dev eth0  proto kernel  scope link  src 10.0.0.1
default
        nexthop via 165.165.160.1  dev ppp0 weight 1
        nexthop via 165.165.160.1  dev ppp1 weight 1
        nexthop via 165.165.160.1  dev ppp2 weight 1
        nexthop via 165.165.160.1  dev ppp3 weight 1
        nexthop via 165.165.160.1  dev ppp4 weight 1




------=_NextPart_000_01D9_01C461C5.B4042A80
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><FONT face=3DArial size=3D2>Hi Ppl</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have 5 adsl lines that after reading =
quite a bit=20
i managed to get load balanced now abvoiusly it doesnt load balance =
evenly and=20
this works on what routes are still in the routing cache. my question is =
my=20
outbound masquerading had to be modified to use snat in iptables instead =
of just=20
plain masquerading my outbound masquerading now works but my inbound =
port=20
forwarding doesnt work would this be an iptables problem or a routing=20
issue...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i have opened all the relavent ports on =
each of the=20
interfaces and I am not getting any logged denies the connection just =
never=20
opens</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am running the following</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>debian woody</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>kernel 2.6.6</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables v1.2.6a</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain PREROUTING (policy ACCEPT 20 =
packets, 4483=20
bytes)<BR>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
DNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; =
ppp0&nbsp;&nbsp;=20
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
dpt:110=20
to:10.0.0.12:110<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
DNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; =
ppp1&nbsp;&nbsp;=20
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
dpt:110=20
to:10.0.0.12:110<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
DNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; =
ppp2&nbsp;&nbsp;=20
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
dpt:110=20
to:10.0.0.12:110<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
DNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; =
ppp3&nbsp;&nbsp;=20
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
dpt:110=20
to:10.0.0.12:110<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
DNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; =
ppp4&nbsp;&nbsp;=20
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
dpt:110=20
to:10.0.0.12:110<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Chain FORWARD (policy DROP 0 packets, 0 =

bytes)<BR>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp;=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; ppp0&nbsp;&nbsp;=20
eth0&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
10.0.0.12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
dpt:110<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; ppp1&nbsp;&nbsp;=20
eth0&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
10.0.0.12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
dpt:110<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; ppp2&nbsp;&nbsp;=20
eth0&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
10.0.0.12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
dpt:110<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; ppp3&nbsp;&nbsp;=20
eth0&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
10.0.0.12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
dpt:110<BR>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; ppp4&nbsp;&nbsp;=20
eth0&nbsp;&nbsp;&nbsp;=20
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
10.0.0.12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp=20
dpt:110<BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ip rule list</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>0:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from =
all lookup=20
local<BR>32761:&nbsp; from 165.165.170.110 lookup T5<BR>32762:&nbsp; =
from=20
165.165.187.47 lookup T4<BR>32763:&nbsp; from 165.165.189.95 lookup=20
T3<BR>32764:&nbsp; from 165.165.163.95 lookup T2<BR>32765:&nbsp; from=20
165.165.179.151 lookup T1<BR>32766:&nbsp; from all lookup =
main<BR>32767:&nbsp;=20
from all lookup default<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ip route sh</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>165.165.160.1 dev ppp1&nbsp; proto =
kernel&nbsp;=20
scope link&nbsp; src 165.165.163.95<BR>165.165.160.1 dev ppp3&nbsp; =
proto=20
kernel&nbsp; scope link&nbsp; src 165.165.187.47<BR>165.165.160.1 dev =
ppp4&nbsp;=20
proto kernel&nbsp; scope link&nbsp; src 165.165.170.110<BR>165.165.160.1 =
dev=20
ppp0&nbsp; proto kernel&nbsp; scope link&nbsp; src=20
165.165.179.151<BR>165.165.160.1 dev ppp2&nbsp; proto kernel&nbsp; scope =

link&nbsp; src 165.165.189.95<BR>10.0.0.0/24 dev eth0&nbsp; proto =
kernel&nbsp;=20
scope link&nbsp; src=20
10.0.0.1<BR>default<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
nexthop via=20
165.165.160.1&nbsp; dev ppp0 weight=20
1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nexthop via =
165.165.160.1&nbsp;=20
dev ppp1 weight 1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nexthop =
via=20
165.165.160.1&nbsp; dev ppp2 weight=20
1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nexthop via =
165.165.160.1&nbsp;=20
dev ppp3 weight 1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nexthop =
via=20
165.165.160.1&nbsp; dev ppp4 weight 1<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_01D9_01C461C5.B4042A80--


