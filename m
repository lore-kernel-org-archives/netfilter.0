From: "Sjaak Nabuurs" <sjaak@vsm-hosting.nl>
Subject: load balancing iptables
Date: Thu, 30 Oct 2003 14:53:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <018101c39eed$2ace3260$0b68a8c0@SJAAK>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_017E_01C39EF5.8C7108A0"
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

------=_NextPart_000_017E_01C39EF5.8C7108A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi I'm new to iptables.

Does anyone have a good iptables solution for this :

eth0 192.168.1.25 is the intranet
eth1-4 are dsl lines
eth5 is an old dsl line

Wat's a good way to push all the traffic to eth5

I've everything running but no ssh is possible trough this box


Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use =
Iface
xxx.xxx.xxx.0   0.0.0.0         255.255.255.128 U     0      0        0 =
eth5
10.0.4.0        0.0.0.0         255.255.255.0   U     0      0        0 =
eth4
10.0.1.0        0.0.0.0         255.255.255.0   U     0      0        0 =
eth1
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 =
eth0
10.0.2.0        0.0.0.0         255.255.255.0   U     0      0        0 =
eth2
10.0.3.0        0.0.0.0         255.255.255.0   U     0      0        0 =
eth3
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 =
lo
0.0.0.0         10.0.2.1        0.0.0.0         UG    0      0        0 =
eth2

[root@router root]# ip route show
212.104.194.0/25 dev eth5  scope link
10.0.4.0/24 dev eth4  scope link
10.0.1.0/24 dev eth1  scope link
192.168.1.0/24 dev eth0  scope link
10.0.2.0/24 dev eth2  scope link
10.0.3.0/24 dev eth3  scope link
127.0.0.0/8 dev lo  scope link
default equalize
        nexthop via 10.0.4.1  dev eth4 weight 1
        nexthop via 10.0.1.1  dev eth1 weight 1
        nexthop via 10.0.2.1  dev eth2 weight 1
        nexthop via 10.0.3.1  dev eth3 weight 1
        nexthop via xxx.xxx.xxx.xxx  dev eth5 weight 1





[root@router root]# ip address show
1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 brd 127.255.255.255 scope host lo
2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:c0:26:87:6d:bb brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.25/24 brd 192.168.1.255 scope global eth0
3: eth1: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:c0:26:87:6c:9d brd ff:ff:ff:ff:ff:ff
    inet 10.0.1.2/24 brd 10.0.1.255 scope global eth1
4: eth2: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:c0:26:87:6e:a0 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.2/24 brd 10.0.2.255 scope global eth2
5: eth3: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:c0:26:87:6d:17 brd ff:ff:ff:ff:ff:ff
    inet 10.0.3.2/24 brd 10.0.3.255 scope global eth3
6: eth4: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:c0:26:87:6c:5f brd ff:ff:ff:ff:ff:ff
    inet 10.0.4.2/24 brd 10.0.4.255 scope global eth4
7: eth5: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:c0:26:87:67:ca brd ff:ff:ff:ff:ff:ff
    inet xxx.xxx.xxx.xx/25 brd xxx.xxx.xxx.xxx scope global eth5
8: eth6: <BROADCAST,MULTICAST> mtu 1500 qdisc noop qlen 100
    link/ether 00:50:70:22:cb:57 brd ff:ff:ff:ff:ff:ff



Met vriendelijke groeten,

Sjaak Nabuurs
|Systeembeheerder.
|VSM Automatisering BV
|
|--->www.vsm-hosting.nl
|--->sjaak@vsm-hosting.nl
|--->ICQ 54452648
|--->Tel 0485-478040
------=_NextPart_000_017E_01C39EF5.8C7108A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>Hi I'm new to=20
iptables.</FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>Does anyone have a good =
iptables solution=20
for this :</FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>eth0 192.168.1.25 is the=20
intranet</FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>eth1-4 are dsl =
lines</FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>eth5 is an old dsl=20
line</FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>Wat's a good way to push all =
the traffic=20
to eth5</FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>I've everything running but no =
ssh is=20
possible trough this box</FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>Kernel IP routing=20
table<BR>Destination&nbsp;&nbsp;&nbsp;&nbsp;=20
Gateway&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Genmask&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Flags Metric=20
Ref&nbsp;&nbsp;&nbsp; Use Iface<BR>xxx.xxx.xxx.0&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.255.255.128=20
U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth5<BR>10.0.4.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth4<BR>10.0.1.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth1<BR>192.168.1.0&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth0<BR>10.0.2.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth2<BR>10.0.3.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth3<BR>127.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
lo<BR>0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
10.0.2.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
UG&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth2</FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>
<DIV><STRONG><FONT face=3DSystem size=3D2>[root@router root]# ip route=20
show<BR>212.104.194.0/25 dev eth5&nbsp; scope link<BR>10.0.4.0/24 dev =
eth4&nbsp;=20
scope link<BR>10.0.1.0/24 dev eth1&nbsp; scope link<BR>192.168.1.0/24 =
dev=20
eth0&nbsp; scope link<BR>10.0.2.0/24 dev eth2&nbsp; scope =
link<BR>10.0.3.0/24=20
dev eth3&nbsp; scope link<BR>127.0.0.0/8 dev lo&nbsp; scope=20
link<BR></FONT></STRONG><STRONG><FONT face=3DSystem size=3D2>default=20
equalize<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nexthop via=20
10.0.4.1&nbsp; dev eth4 weight =
1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
nexthop via 10.0.1.1&nbsp; dev eth1 weight=20
1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nexthop via =
10.0.2.1&nbsp; dev=20
eth2 weight 1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nexthop via=20
10.0.3.1&nbsp; dev eth3 weight 1</FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
nexthop via xxx.xxx.xxx.xxx&nbsp; dev eth5 weight =
1<BR></FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV></FONT></STRONG><STRONG><FONT face=3DSystem =
size=3D2>&nbsp;</DIV></DIV>
<DIV><BR></DIV></FONT></STRONG>
<DIV><STRONG><FONT face=3DSystem size=3D2>[root@router root]# ip address =
show<BR>1:=20
lo: &lt;LOOPBACK,UP&gt; mtu 16436 qdisc noqueue<BR>&nbsp;&nbsp;&nbsp;=20
link/loopback 00:00:00:00:00:00 brd =
00:00:00:00:00:00<BR>&nbsp;&nbsp;&nbsp; inet=20
127.0.0.1/8 brd 127.255.255.255 scope host lo<BR>2: eth0:=20
&lt;BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc pfifo_fast qlen=20
100<BR>&nbsp;&nbsp;&nbsp; link/ether 00:c0:26:87:6d:bb brd=20
ff:ff:ff:ff:ff:ff<BR>&nbsp;&nbsp;&nbsp; inet 192.168.1.25/24 brd =
192.168.1.255=20
scope global eth0<BR>3: eth1: &lt;BROADCAST,MULTICAST,UP&gt; mtu 1500 =
qdisc=20
pfifo_fast qlen 100<BR>&nbsp;&nbsp;&nbsp; link/ether 00:c0:26:87:6c:9d =
brd=20
ff:ff:ff:ff:ff:ff<BR>&nbsp;&nbsp;&nbsp; inet 10.0.1.2/24 brd 10.0.1.255 =
scope=20
global eth1<BR>4: eth2: &lt;BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc =
pfifo_fast=20
qlen 100<BR>&nbsp;&nbsp;&nbsp; link/ether 00:c0:26:87:6e:a0 brd=20
ff:ff:ff:ff:ff:ff<BR>&nbsp;&nbsp;&nbsp; inet 10.0.2.2/24 brd 10.0.2.255 =
scope=20
global eth2<BR>5: eth3: &lt;BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc =
pfifo_fast=20
qlen 100<BR>&nbsp;&nbsp;&nbsp; link/ether 00:c0:26:87:6d:17 brd=20
ff:ff:ff:ff:ff:ff<BR>&nbsp;&nbsp;&nbsp; inet 10.0.3.2/24 brd 10.0.3.255 =
scope=20
global eth3<BR>6: eth4: &lt;BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc =
pfifo_fast=20
qlen 100<BR>&nbsp;&nbsp;&nbsp; link/ether 00:c0:26:87:6c:5f brd=20
ff:ff:ff:ff:ff:ff<BR>&nbsp;&nbsp;&nbsp; inet 10.0.4.2/24 brd 10.0.4.255 =
scope=20
global eth4<BR>7: eth5: &lt;BROADCAST,MULTICAST,UP&gt; mtu 1500 qdisc =
pfifo_fast=20
qlen 100<BR>&nbsp;&nbsp;&nbsp; link/ether 00:c0:26:87:67:ca brd=20
ff:ff:ff:ff:ff:ff<BR>&nbsp;&nbsp;&nbsp; inet xxx.xxx.xxx.xx/25 brd=20
xxx.xxx.xxx.xxx scope global eth5<BR>8: eth6: =
&lt;BROADCAST,MULTICAST&gt; mtu=20
1500 qdisc </FONT></STRONG><STRONG><FONT face=3DSystem size=3D2>noop =
qlen=20
100<BR>&nbsp;&nbsp;&nbsp; link/ether 00:50:70:22:cb:57 brd=20
ff:ff:ff:ff:ff:ff<BR></FONT></STRONG><STRONG><FONT face=3DSystem=20
size=3D2></FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>&nbsp;</DIV></FONT></STRONG>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>Met vriendelijke=20
groeten,</FONT></STRONG></DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2></FONT></STRONG>&nbsp;</DIV>
<DIV><STRONG><FONT face=3DSystem size=3D2>Sjaak=20
Nabuurs<BR>|Systeembeheerder.<BR>|VSM Automatisering=20
BV<BR>|<BR>|---&gt;www.vsm-hosting.nl<BR>|---&gt;sjaak@vsm-hosting.nl<BR>=
|---&gt;ICQ=20
54452648<BR>|---&gt;Tel 0485-478040</FONT></STRONG></DIV></BODY></HTML>

------=_NextPart_000_017E_01C39EF5.8C7108A0--



