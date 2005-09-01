From: psihozefir <sorin.panca@gmail.com>
Subject: multiple SNAT overlaps doesn't work?
Date: Thu, 1 Sep 2005 22:40:56 +0300
Message-ID: <fdb0cf39050901124060ff320f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello! I have this configuration:

a) A small server with this configuration: on eth1 - local network:
192.168.1.0/24
on eth0 10.100.122.90 to my ISP for tunneling inside his network to my
big server.
a gre tunnel 10.10.10.8 <-> 10.10.10.7 to my big server.
I forward the network to my big server with unchanged addresses.

b) A big server with 3 NICs:
eth0 =3D $publicIP1 AND all 64 addresses form a $publicNET1 as aliases to e=
th0
eth1 =3D 192.168.101.1 connected to 192.168.101.0/24 AND 10.0.0.1
connected to 10.0.0.0/24 AND $publicIP2 as gateway for $publicNET2
tun1 =3D 10.10.10.7 <-> 10.10.10.8 tunnel to my small server
i have this:

publicNET1=3D1.2.3.0/26

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.101.0/24 -j SNAT
--to 1.2.3.1-1.2.3.32 # load balancing

iptables -t nat -A POSTROUTING -o eth0 -s 10.0.0.0/24 -j SNAT --to
1.2.3.33-1.2.3.62 # load balancing

iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.0 -j SNAT --to
1.2.3.1-1.2.3.62  # load balancing

iptables -A FORWARD -s $publicNET2 -j ACCEPT
iptables -A FORWARD -d $publicNET2 -j ACCEPT

iptables -A FORWARD -i eth1 -s 192.168.101.0/24 -j ACCEPT
iptables -A FORWARD -o eth1 -d 192.168.101.0/24 -j ACCEPT

iptables -A FORWARD -i eth1 -s 10.0.0.0/24 -j ACCEPT
iptables -A FORWARD -o eth1 -d 10.0.0.0/24 -j ACCEPT

iptables -A FORWARD -i tun1 -s 192.168.1.0/24 -j ACCEPT
iptables -A FORWARD -o tun1 -d 192.168.1.0/24 -j ACCEPT

iptables -P FORWARD ACCEPT

dns=3DISP`s dns

The ISP is providing a route from its internal 10.100.122.0 network to
my $publicIP1 for tunneling.

Problem:
I can communicate with the Internet from the locally connected
networks (192.168.101.0 and 10.0.0.0) but I have no access to the
Internet for the tunneled network.
From the small server I can ping any machine on 192.168.101.0 or on 10.0.0.=
0.
From the big server I can ping any machine on the tunneled network.
From the small server I can ping ISP`s dns server.

routes on small server:
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Ifa=
ce
10.10.10.7      *               255.255.255.255 UH    0      0        0 tun=
1
ns.isp        10.100.122.65   255.255.255.255 UGH   0      0        0 eth0
$publicIP1.i 10.100.122.65   255.255.255.255 UGH   0      0        0 eth0
10.100.122.64   *               255.255.255.224 U     0      0        0 eth=
0
192.168.1.0     *               255.255.255.0   U     0      0        0 eth=
1
loopback        *               255.0.0.0       U     0      0        0 lo
default         10.10.10.7      0.0.0.0         UG    0      0        0 tun=
1

routes on big server:
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Ifa=
ce
253.157.196.81. *               255.255.255.255 UH    0      0        0 eth=
1
253.157.196.81. *               255.255.255.255 UH    0      0        0 eth=
1
10.10.10.8      *               255.255.255.255 UH    0      0        0 tun=
1
$publicIP1      *               255.255.255.248 U     0      0        0 eth=
0
$publicNET2    *               255.255.255.248 U     0      0        0 eth1
$publicNET1  *               255.255.255.192 U     0      0        0 eth0
1.2.3.0             *               255.255.255.192 U     0      0        0=
 eth0
192.168.101.0   *               255.255.255.0   U     0      0        0 eth=
1
10.0.0.0        *               255.255.255.0   U     0      0        0 eth=
1
192.168.1.0     10.10.10.8      255.255.255.0   UG    0      0        0 tun=
1
loopback        *               255.0.0.0       U     0      0        0 lo
default         $my_gw    0.0.0.0         UG    1      0        0 eth0

* Note that SNAT has overlapping addresses. I think that could be the
problem. Has anyone experienced some similar situations? Thank you for
your time, patience and help.

