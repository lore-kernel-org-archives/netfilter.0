From: "Alin Dragomir" <Alin.Dragomir@onsemi.com>
Subject: Kernel 3.1, IP fragmentation, NAT and IPSEC
Date: Fri, 20 Apr 2012 16:39:27 -0700
Message-ID: <50BA5B40E095994F9BDBE4350F4DE7CD014F1204@NAMAIL2.ad.onsemi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have the following:
Setup:
======
LTUN:
- eth0: 1.1.1.1/24 (local subnet)
- eth1: 1.2.3.4 (WAN IP)
RTUN:
- LAN: 2.2.2.1/24 (local subnet)
- WAN: 5.6.7.8 (WAN IP)
IPSEC tunnel between 1.2.3.4 (Linux 3.1.10) and 5.6.7.8 (Linksys
router), with the right policies for the local subnets.
Channel            target     prot opt in     out     source
destination
INPUT              ACCEPT     tcp  --  *      *       2.2.2.0/24
0.0.0.0/0
FORWARD            TCPMSS     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcpflags: 0x06/0x02 TCPMSS clamp to PMTU
-t NAT PREROUTING  ACCEPT     all  --  *      *       2.2.2.0/24
0.0.0.0/0
-t NAT POSTROUTING ACCEPT     all  --  *      eth1    0.0.0.0/0
0.0.0.0/0            policy match dir out pol ipsec
-t NAT POSTROUTING MASQUERADE all  --  *      eth1    0.0.0.0/0
0.0.0.0/0
Hosts in the 1.1.1.0 LAN use MTU 9000.
Hosts in the 2.2.2.0 LAN use MTU 1500.
1.2.3.4 interface uses MTU 576.
PMTU seems to be 552.

Problem:
========
One of the hosts, 1.1.1.3, has problems communicating with any host in
the 2.2.2.0/24 subnet whenever TCP and large packets are involved. Ping
works, including ping -s 3000, both ways.
While trying i.e. ssh from 2.2.2.99 to 1.1.1.3, with tcpdump running on
both as well as 1.1.1.1, I see reply packets being fragmented on 1.1.1.3
(to payload 512) but arriving defragmented on 1.1.1.1's internal
interface and they never arrive to 2.2.2.99:
=TCPDUMP on 1.1.1.3 eth0:
16:16:01.908286 IP 2.2.2.99.65083 > 1.1.1.3.22: S 516427978:516427978(0)
win 8192 <mss 536,[|tcp]>
16:16:01.908343 IP 1.1.1.3.22 > 2.2.2.99.65083: S
2160114517:2160114517(0) ack 516427979 win 17920 <mss 8960,[|tcp]>
16:16:01.949804 IP 2.2.2.99.65083 > 1.1.1.3.22: . ack 1 win 16482
16:16:01.969439 IP 1.1.1.3.22 > 2.2.2.99.65083: P 1:33(32) ack 1 win 560
16:16:02.255908 IP 2.2.2.99.65083 > 1.1.1.3.22: P 1:29(28) ack 33 win
16474
16:16:02.256041 IP 1.1.1.3.22 > 2.2.2.99.65083: . ack 29 win 560
16:16:02.258189 IP 1.1.1.3.22 > 2.2.2.99.65083: . 33:545(512) ack 29 win
560
16:16:02.258231 IP 1.1.1.3.22 > 2.2.2.99.65083: P 545:1017(472) ack 29
win 560
16:16:02.267038 IP 2.2.2.99.65083 > 1.1.1.3.22: P 29:541(512) ack 33 win
16474
16:16:02.269431 IP 2.2.2.99.65083 > 1.1.1.3.22: P 541:645(104) ack 33
win 16474
=TCPDUMP on 1.1.1.1 eth0:
16:16:01.907017 IP 2.2.2.99.65083 > 1.1.1.3.22: S 516427978:516427978(0)
win 8192 <mss 536,[|tcp]>
16:16:01.907195 IP 1.1.1.3.22 > 2.2.2.99.65083: S
2160114517:2160114517(0) ack 516427979 win 17920 <mss 8960,[|tcp]>
16:16:01.948591 IP 2.2.2.99.65083 > 1.1.1.3.22: . ack 1 win 16482
16:16:01.968350 IP 1.1.1.3.22 > 2.2.2.99.65083: P 1:33(32) ack 1 win 560
16:16:02.254697 IP 2.2.2.99.65083 > 1.1.1.3.22: P 1:29(28) ack 33 win
16474
16:16:02.254934 IP 1.1.1.3.22 > 2.2.2.99.65083: . ack 29 win 560
16:16:02.257138 IP 1.1.1.3.22 > 2.2.2.99.65083: P 33:1017(984) ack 29
win 560             # this is defragmented
16:16:02.265795 IP 2.2.2.99.65083 > 1.1.1.3.22: P 29:541(512) ack 33 win
16474
16:16:02.268184 IP 2.2.2.99.65083 > 1.1.1.3.22: P 541:645(104) ack 33
win 16474
=TCPDUMP on 1.1.1.1 eth1:
Only incoming packets show on this interface, I don't know how to
monitor outgoing packets prior to entering the IPSEC.
After trying everything I could think of, including disabling hardware
segmentation offload with ethtool, changing the MTU to 500, etc. I
figured this must be the work of nf_defrag_ipv4 for the needs of
conntrack. However it seems like the packets are not re-fragmented prior
to being pushed through the tunnel. HTTP works when directly doing GET
for a 50bytes html file too.
Also, HTTP, SSH, and even CIFS work just fine between 2.2.2.99 and
1.1.1.4 in the same subnet, which kind of leaves me without any idea of
what else to try.

Other symptoms:
===============
Ping works between any set of two hosts, except from 1.2.3.4 host itself
to any hosts in the 2.2.2.1 LAN. This I assume is because the packets do
not match the "policy match dir out pol ipsec" POSTROUTING rule (as they
are generated on the machine itself?), but I don't know how to work
around that. In the future I may have another tunnel configured on the
same machine and don't want to do:
-t NAT POSTROUTING MASQUERADE  all  --  *      eth1    0.0.0.0/0
!  2.2.2.0/24

Thank you in advance,
Alin D.
