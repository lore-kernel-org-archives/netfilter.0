From: Leo <neleo@gmx.net>
Subject: retransmissions after RST packet
Date: Thu, 15 Jul 2010 12:58:26 +0200
Message-ID: <4C3EE9D2.7060403@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have a simple iptables setup on a webserver: I allow all new incoming
connections on port 80 and then I use connection tracking to allow all
packets on connections with state ESTABLISHED or RELATED (both incoming
and outgoing). The rules are as follows:

iptables -A INPUT -p tcp -m tcp --dport 80 --syn -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

Default policy on both chains is DROP.
It is working fine but sometimes outgoing packets are being dropped. I
tracked it down and noticed that this occures if the client has not
acknowledged all packets from the server and is terminating the
connection (i.e. with a RST packet). Then the server still tries to
retransmit the packets which are not acknowledged yet.

Here is the tcpdump on the server (CCC.CCC.206.81 is the client ip and
SSS.SSS.112.212 the server ip):

1279179230.968323 IP (tos 0x0, ttl 60, id 31945, offset 0, flags [DF],
proto TCP (6), length 60) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: S,
cksum 0x3ed9 (correct), 4125467027:4125467027(0) win 5840 <mss
1402,sackOK,timestamp 1957210 0,nop,wscale 6>
1279179230.968365 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
TCP (6), length 60) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: S, cksum
0x1c04 (correct), 2681675727:2681675727(0) ack 4125467028 win 5792 <mss
1460,sackOK,timestamp 1211046628 1957210,nop,wscale 6>
1279179231.009125 IP (tos 0x0, ttl 60, id 31946, offset 0, flags [DF],
proto TCP (6), length 52) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: .,
cksum 0x60f2 (correct), 1:1(0) ack 1 win 92 <nop,nop,timestamp 1957243
1211046628>
1279179231.015125 IP (tos 0x0, ttl 60, id 31947, offset 0, flags [DF],
proto TCP (6), length 761) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: P
1:710(709) ack 1 win 92 <nop,nop,timestamp 1957243 1211046628>
1279179231.015147 IP (tos 0x0, ttl 64, id 1335, offset 0, flags [DF],
proto TCP (6), length 52) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: .,
cksum 0x5e14 (correct), 1:1(0) ack 710 win 113 <nop,nop,timestamp
1211046632 1957243>
1279179231.017616 IP (tos 0x0, ttl 64, id 1336, offset 0, flags [DF],
proto TCP (6), length 365) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1:314(313) ack 710 win 113 <nop,nop,timestamp 1211046632 1957243>
1279179231.017639 IP (tos 0x0, ttl 64, id 1337, offset 0, flags [DF],
proto TCP (6), length 1442) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: .
314:1704(1390) ack 710 win 113 <nop,nop,timestamp 1211046632 1957243>
1279179231.017647 IP (tos 0x0, ttl 64, id 1338, offset 0, flags [DF],
proto TCP (6), length 506) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1704:2158(454) ack 710 win 113 <nop,nop,timestamp 1211046632 1957243>
1279179231.018214 IP (tos 0x0, ttl 64, id 1339, offset 0, flags [DF],
proto TCP (6), length 52) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: F,
cksum 0x55a6 (correct), 2158:2158(0) ack 710 win 113 <nop,nop,timestamp
1211046632 1957243>
1279179231.043413 IP (tos 0x0, ttl 60, id 31948, offset 0, flags [DF],
proto TCP (6), length 52) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: F,
cksum 0x5e01 (correct), 710:710(0) ack 1 win 92 <nop,nop,timestamp
1957286 1211046628>
1279179231.043450 IP (tos 0x0, ttl 64, id 1340, offset 0, flags [DF],
proto TCP (6), length 52) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: .,
cksum 0x5577 (correct), 2159:2159(0) ack 711 win 113 <nop,nop,timestamp
1211046635 1957286>
1279179231.054195 IP (tos 0x0, ttl 60, id 0, offset 0, flags [DF], proto
TCP (6), length 40) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: R, cksum
0x9800 (correct), 4125467737:4125467737(0) win 0
1279179231.247408 IP (tos 0x0, ttl 64, id 1341, offset 0, flags [DF],
proto TCP (6), length 365) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1:314(313) ack 711 win 113 <nop,nop,timestamp 1211046656 1957286>
1279179231.727422 IP (tos 0x0, ttl 64, id 1342, offset 0, flags [DF],
proto TCP (6), length 365) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1:314(313) ack 711 win 113 <nop,nop,timestamp 1211046704 1957286>
1279179232.687412 IP (tos 0x0, ttl 64, id 1343, offset 0, flags [DF],
proto TCP (6), length 365) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1:314(313) ack 711 win 113 <nop,nop,timestamp 1211046800 1957286>
1279179234.607407 IP (tos 0x0, ttl 64, id 1344, offset 0, flags [DF],
proto TCP (6), length 365) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1:314(313) ack 711 win 113 <nop,nop,timestamp 1211046992 1957286>
1279179238.451319 IP (tos 0x0, ttl 64, id 1345, offset 0, flags [DF],
proto TCP (6), length 365) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1:314(313) ack 711 win 113 <nop,nop,timestamp 1211047376 1957286>
1279179246.127414 IP (tos 0x0, ttl 64, id 1346, offset 0, flags [DF],
proto TCP (6), length 365) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1:314(313) ack 711 win 113 <nop,nop,timestamp 1211048144 1957286>
1279179261.487508 IP (tos 0x0, ttl 64, id 1347, offset 0, flags [DF],
proto TCP (6), length 365) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1:314(313) ack 711 win 113 <nop,nop,timestamp 1211049680 1957286>
1279179292.207481 IP (tos 0x0, ttl 64, id 1348, offset 0, flags [DF],
proto TCP (6), length 365) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1:314(313) ack 711 win 113 <nop,nop,timestamp 1211052752 1957286>

And this is the tcpdump on the client (CCC.CCC.206.81 is the client ip
and SSS.SSS.112.212 the server ip):

1279179230.979721 IP (tos 0x0, ttl 64, id 31945, offset 0, flags [DF],
proto TCP (6), length 60) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: S,
cksum 0xf4f0 (correct), 4125467027:4125467027(0) win 5840 <mss
1460,sackOK,timestamp 1957210 0,nop,wscale 6>
1279179231.012455 IP (tos 0x0, ttl 61, id 0, offset 0, flags [DF], proto
TCP (6), length 60) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: S, cksum
0xd28f (correct), 2681675727:2681675727(0) ack 4125467028 win 5792 <mss
1402,sackOK,timestamp 1211046628 1957210,nop,wscale 6>
1279179231.012474 IP (tos 0x0, ttl 64, id 31946, offset 0, flags [DF],
proto TCP (6), length 52) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: .,
cksum 0x1744 (correct), 1:1(0) ack 1 win 92 <nop,nop,timestamp 1957243
1211046628>
1279179231.012510 IP (tos 0x0, ttl 64, id 31947, offset 0, flags [DF],
proto TCP (6), length 761) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: P
1:710(709) ack 1 win 92 <nop,nop,timestamp 1957243 1211046628>
1279179231.055691 IP (tos 0x0, ttl 64, id 31948, offset 0, flags [DF],
proto TCP (6), length 52) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: F,
cksum 0x1453 (correct), 710:710(0) ack 1 win 92 <nop,nop,timestamp
1957286 1211046628>
1279179231.058694 IP (tos 0x0, ttl 61, id 1335, offset 0, flags [DF],
proto TCP (6), length 52) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: .,
cksum 0x1466 (correct), 1:1(0) ack 710 win 113 <nop,nop,timestamp
1211046632 1957243>
1279179231.062371 IP (tos 0x0, ttl 61, id 1336, offset 0, flags [DF],
proto TCP (6), length 365) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1:314(313) ack 710 win 113 <nop,nop,timestamp 1211046632 1957243>
1279179231.062379 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
TCP (6), length 40) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: R, cksum
0x4e52 (correct), 4125467737:4125467737(0) win 0
1279179231.063487 IP (tos 0x0, ttl 61, id 1337, offset 0, flags [DF],
proto TCP (6), length 1442) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: .
314:1704(1390) ack 710 win 113 <nop,nop,timestamp 1211046632 1957243>
1279179231.063497 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
TCP (6), length 40) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: R, cksum
0x4e52 (correct), 4125467737:4125467737(0) win 0
1279179231.063499 IP (tos 0x0, ttl 61, id 1338, offset 0, flags [DF],
proto TCP (6), length 506) SSS.SSS.112.212.80 > CCC.CCC.206.81.38123: P
1704:2158(454) ack 710 win 113 <nop,nop,timestamp 1211046632 1957243>
1279179231.063504 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
TCP (6), length 40) CCC.CCC.206.81.38123 > SSS.SSS.112.212.80: R, cksum
0x4e52 (correct), 4125467737:4125467737(0) win 0

The conntrack tool shows the following events (CCC.CCC.206.81 is the
client ip and SSS.SSS.112.212 the server ip):

[1279179230.968388]         [NEW] ipv4     2 tcp      6 120 SYN_SENT
src=CCC.CCC.206.81 dst=SSS.SSS.112.212 sport=38123 dport=80 [UNREPLIED]
src=SSS.SSS.112.212 dst=CCC.CCC.206.81 sport=80 dport=38123
[1279179230.968429]      [UPDATE] ipv4     2 tcp      6 60 SYN_RECV
src=CCC.CCC.206.81 dst=SSS.SSS.112.212 sport=38123 dport=80
src=SSS.SSS.112.212 dst=CCC.CCC.206.81 sport=80 dport=38123
[1279179231.9346  ]      [UPDATE] ipv4     2 tcp      6 432000
ESTABLISHED src=CCC.CCC.206.81 dst=SSS.SSS.112.212 sport=38123 dport=80
src=SSS.SSS.112.212 dst=CCC.CCC.206.81 sport=80 dport=38123 [ASSURED]
[1279179231.18375 ]      [UPDATE] ipv4     2 tcp      6 120 FIN_WAIT
src=CCC.CCC.206.81 dst=SSS.SSS.112.212 sport=38123 dport=80
src=SSS.SSS.112.212 dst=CCC.CCC.206.81 sport=80 dport=38123 [ASSURED]
[1279179231.43478 ]      [UPDATE] ipv4     2 tcp      6 30 LAST_ACK
src=CCC.CCC.206.81 dst=SSS.SSS.112.212 sport=38123 dport=80
src=SSS.SSS.112.212 dst=CCC.CCC.206.81 sport=80 dport=38123 [ASSURED]
[1279179231.43514 ]      [UPDATE] ipv4     2 tcp      6 120 TIME_WAIT
src=CCC.CCC.206.81 dst=SSS.SSS.112.212 sport=38123 dport=80
src=SSS.SSS.112.212 dst=CCC.CCC.206.81 sport=80 dport=38123 [ASSURED]
[1279179231.54254 ]      [UPDATE] ipv4     2 tcp      6 10 CLOSE
src=CCC.CCC.206.81 dst=SSS.SSS.112.212 sport=38123 dport=80
src=SSS.SSS.112.212 dst=CCC.CCC.206.81 sport=80 dport=38123 [ASSURED]
[1279179256.127453]     [DESTROY] ipv4     2 tcp      6
src=CCC.CCC.206.81 dst=SSS.SSS.112.212 sport=38123 dport=80 packets=5
bytes=965 src=SSS.SSS.112.212 dst=CCC.CCC.206.81 sport=80 dport=38123
packets=13 bytes=4719
[1279179261.487641]         [NEW] ipv4     2 tcp      6 432000
ESTABLISHED src=SSS.SSS.112.212 dst=CCC.CCC.206.81 sport=80 dport=38123
[UNREPLIED] src=CCC.CCC.206.81 dst=SSS.SSS.112.212 sport=38123 dport=80

Software versions on the server:
Linux web 2.6.26.2 #1 SMP Tue Aug 19 11:07:06 CEST 2008 i686 i686 i386
GNU/Linux
iptables v1.4.1.1
tcpdump version 3.9.8
libpcap version 0.9.8
conntrack v0.9.8 (conntrack-tools)

Why is the server still retransmitting the packets after a reset from
the client (RST packet)? Is it a problem of iptables/conntrack or the
tcp/ip stack of the kernel?

Any ideas?

Kind regards,
Leo

