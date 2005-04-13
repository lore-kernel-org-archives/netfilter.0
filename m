From: Stephen Beck <becks@marietta.edu>
Subject: help with fast nat
Date: Wed, 13 Apr 2005 15:45:42 -0400 (EDT)
Message-ID: <Pine.GSO.4.58.0504131520420.25950@mcnet.marietta.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

if this is the wrong place to ask this please just send me a better
choice. Ime trying to set a router to do source NAT with a fixed
translation table as i believe to be common with firewalls.
in the testing stage my:
inside net is 10.0.30.0/24
outside net is 10.0.31.0/24
the router itself is running RH advanced server 4 mostly 'out of the
box' and on boot logs:
 Linux version 2.6.9-5.ELsmp (bhcompile@decompose.build.redhat.com) (gcc
version 3.4.3 20041212 (Red Hat 3.4.3-9.EL4)) #1 SMP Wed Jan 5 19:30:39
EST 2005

the router is ip 199.218.109.251 and its outside router is a cisco 6513.
for testing the cisco is forwarding 10.0.30.0/24 and 10.0.31.0/24 to the
251 ip.

router interfaces (of intrest) :
eth2      Link encap:Ethernet  HWaddr 00:0F:1F:66:2D:8B
          inet addr:199.218.109.251  Bcast:199.218.109.255
Mask:255.255.255.0
          inet6 addr: fe80::20f:1fff:fe66:2d8b/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

eth3.930  Link encap:Ethernet  HWaddr 00:0F:1F:66:2D:8C
          inet addr:10.0.30.1  Bcast:10.255.255.255  Mask:255.255.255.0
          inet6 addr: fe80::20f:1fff:fe66:2d8c/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1


for testing I have flushed iptables: iptables -F

have: echo "1" > /proc/sys/net/ipv4/ip_forward


[root@dorm-test ~]# ip route show
10.0.30.0/24 dev eth3.930  proto kernel  scope link  src 10.0.30.1
199.218.109.0/24 dev eth2  proto kernel  scope link  src 199.218.109.251
default via 199.218.109.1 dev eth2
[root@dorm-test ~]#


[root@dorm-test ~]# ip rule show
0:      from all lookup local
32766:  from all lookup main
32767:  from all lookup default
[root@dorm-test ~]#


at this point a pc on the inside running 10.0.30.5 (static)
can ping my desktop (on anouther segment also off the cisco)
tcp dumps along the way show icmp requests and replys as expected.

then i :
[root@dorm-test ~]# ip route add 10.0.31.5/32 via 10.0.30.5
[root@dorm-test ~]# ip rule add from 10.0.30.5 nat 10.0.31.5
[root@dorm-test ~]# ip route flush cache
[root@dorm-test ~]#

the pings stop.

on the router input i can see the requests still comming with.
[root@dorm-test ~]# tcpdump -nn -i eth3.930
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth3.930, link-type EN10MB (Ethernet), capture size 96 bytes
15:34:06.474482 IP 10.0.30.5 > *.*.146.31: icmp 64: echo request seq 2251


but all is quiet on eth2 and my desktop sees nothing.


after tests:
[root@dorm-test ~]# ip route show
10.0.31.5 via 10.0.30.5 dev eth3.930
10.0.30.0/24 dev eth3.930  proto kernel  scope link  src 10.0.30.1
199.218.109.0/24 dev eth2  proto kernel  scope link  src 199.218.109.251
default via 199.218.109.1 dev eth2
[root@dorm-test ~]# ip rule show
0:      from all lookup local
32765:  from 10.0.30.5 lookup main map-to 10.0.31.5
32766:  from all lookup main
32767:  from all lookup default
[

can anyone get me on to the next step:

Thankyou, Stephen Beck, Marietta College.

