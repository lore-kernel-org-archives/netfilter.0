From: "Andrew J. Millar" <am@dpdo.com>
Subject: IPSec Protocol 4 (ipcomp) traffic dropped
Date: Thu, 18 Jan 2007 17:08:43 -0000 (GMT)
Message-ID: <4430.10.11.1.250.1169140123.squirrel@www.dpdo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all

I've noticed something strange since upgrading from Gentoo kernel
2.6.14-r7-hardened to 2.6.18-hardened, and wonder if anyone could shed
some light one it.

Notes:

HOST-A: IPaddress AAA.AAA.AAA.AAA, kernel-2.6.18-hardened,   
iptables-1.3.5-r4, OpenSwan-2.4.4
HOST-A: IPaddress BBB.BBB.BBB.BBB, kernel-2.6.14-hardened-r2,
iptables-1.3.5-r4, Openswan-2.4.4

Basically, IPtables is seeing, and dropping protocol 4 (IP Payload
Compression Protocol) packets relating to an OpenSwan IPSec tunnel as
follows, and I have never seen this happen before:

(telnet to HOST-A:22 from host B)
HOST-B linux # nc AAA.AAA.AAA.AAA 22

(tcpdump for ESP traffic on Host A - these are the ESP/IPCOMP encapsulated
SYNs to HOST-A:22)
HOST-A linux # tcpdump -i eth0 proto 50
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 68 bytes
16:52:35.344573 IP BBB.BBB.BBB.BBB > AAA.AAA.AAA.AAA:
ESP(spi=0x6713a6f4,seq=0x13), length 100
16:52:38.344340 IP BBB.BBB.BBB.BBB > AAA.AAA.AAA.AAA:
ESP(spi=0x6713a6f4,seq=0x14), length 100
16:52:44.345300 IP BBB.BBB.BBB.BBB > AAA.AAA.AAA.AAA:
ESP(spi=0x6713a6f4,seq=0x15), length 100

3 packets captured
6 packets received by filter
0 packets dropped by kernel

(check for dropped packets from HOST-B in HOST-A's logs, these are the
IPCOMP encapsulated SYNs to HOST-A:22 being dropped.)
HOST-A linux # tail /var/log/kern.log | grep BBB.BBB.BBB.BBB
Jan 18 16:52:35 HOST-A INPUT DROPPED: IN=eth0 OUT= MAC=00:<snip>:00
SRC=BBB.BBB.BBB.BBB DST=AAA.AAA.AAA.AAA LEN=80 TOS=0x00 PREC=0x00 TTL=56
ID=23130 DF PROTO=4
Jan 18 16:52:38 HOST-A INPUT DROPPED: IN=eth0 OUT= MAC=00:<snip>:00
SRC=BBB.BBB.BBB.BBB DST=AAA.AAA.AAA.AAA LEN=80 TOS=0x00 PREC=0x00 TTL=56
ID=23130 DF PROTO=4
Jan 18 16:52:44 HOST-A INPUT DROPPED: IN=eth0 OUT= MAC=00:<snip>:00
SRC=BBB.BBB.BBB.BBB DST=AAA.AAA.AAA.AAA LEN=80 TOS=0x00 PREC=0x00 TTL=56
ID=23130 DF PROTO=4
HOST-A linux #

Only when I add a rule to allow protocol 4 on HOST-A as follows, is the
attempt to reach HOST-A:22 successful.

iptables -A INPUT -s BBB.BBB.BBB.BBB -d AAA.AAA.AAA.AAA -p 4 -j ACCEPT

I of course have the usual set of rules associated with OpenSwan tunnels:

iptables -A INPUT -s BBB.BBB.BBB.BBB -d AAA.AAA.AAA.AAA -p udp -m
multiport --dports 500,4500 -j ACCEPT
iptables -A INPUT -s BBB.BBB.BBB.BBB -d AAA.AAA.AAA.AAA -p 50  -j ACCEPT

The OpenSwan config for the tunnel has not changed, and I have never seen
protocol 4 traffic in this manner before, and have never had to have an
iptables rule to allow it. Any ideas why this has suddenly changed? Note I
have also tried this with HOST-A running 2.6.16-hardened-r11, and the same
thing has happened.

Kind regards
Andrew Millar



