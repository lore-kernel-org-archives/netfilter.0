From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: ICMP logging question
Date: Mon, 03 May 2004 21:03:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083632597.2068.194.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Greets all,

I have a question regarding some ICMP packets I've recorded. Here is the
iptables log entry:

May  2 13:07:45 gw1 kernel:  DROP_INPUT  IN=eth0 OUT=
MAC=00:e0:29:85:f0:b0:00:00:0c:84:63:04:08:00 SRC=143.248.4.1
DST=64.179.20.65 LEN=56 TOS=0x00 PREC=0xC0 TTL=236 ID=18683 PRO
TO=ICMP TYPE=11 CODE=0 [SRC=64.179.20.65 DST=200.223.0.232 LEN=40
TOS=0x00 PREC=0x00 TTL=0 ID=15436 PROTO=TCP INCOMPLETE [8 bytes] ]

and here is the Snort decode:

[**] ICMP Time-To-Live Exceeded in Transit (Undefined Code!) [**]
05/02-13:07:45.122521 143.248.4.1 -> 64.179.20.65
ICMP TTL:236 TOS:0xC0 ID:18683 IpLen:20 DgmLen:56
Type:11  Code:0  TTL EXCEEDED IN TRANSIT
00 00 00 00 45 00 00 28 3C 4C 00 00 00 06 5F C9  ....E..(<L...._.
40 B3 14 41 C8 DF 00 E8 1C 75 1A AE 1D E1 7F A8  @..A.....u......

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+

My question is regarding the decode of the alleged TCP packet (I say
alleged as it was spoofed. I think this is a covert zombie communication
channel) that generated the ICMP error. 

What exactly does "incomplete" mean? Does this simply mean that only 8
bytes of the 20 were present for decoding? If so, why do only certain
type 11's get labeled as "incomplete"?

iptables used to decode the original source and destination ports as
part of the log entry. Has this feature gone away?

Thanks in advance for any help,
Chris



