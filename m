From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Sat, 01 Oct 2005 23:48:26 -0500
Message-ID: <dhnoqq$bq8$1@sea.gmane.org>
References: <dhmn38$hsk$1@sea.gmane.org> <200510011907.27026.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0510020410200.21519@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510020410200.21519@filer.marasystems.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Henrik Nordstrom wrote:
> each time a new connection is seen (unique source/destination/ports) the 
> first packet is NEW, simply by the fact that the connection is not yet 
> known to conntrack.

Actually, I find that an unsolicited TCP SYN/ACK packet matches state
INVALID and does not match state NEW.  Here is my log rule:

    -A Incoming -m state --state INVALID -m limit --limit 30/hour
       --limit-burst 20 -j LOG --log-prefix "FW-Inv: " --log-level 6

here is a typical log entry:

    Oct  1 18:45:59 omega-3a kernel: FW-Inv: IN=eth1 OUT=
       MAC=00:0c:6e:f9:ba:69:00:01:5c:22:c2:42:08:00 SRC=69.25.58.145
       DST=xx.xx.xx.xx LEN=44 TOS=0x00 PREC=0x00 TTL=50 ID=0 DF PROTO=TCP
       SPT=5555 DPT=35674 WINDOW=5840 RES=0x00 ACK SYN URGP=0

and here is the packet that produced it:

Frame 4265 (60 bytes on wire, 60 bytes captured)
Ethernet II, Src: 00:01:5c:22:c2:42 (00:01:5c:22:c2:42), Dst: 
00:0c:6e:f9:ba:69 (00:0c:6e:f9:ba:69)
Internet Protocol, Src: 69.25.58.145 (69.25.58.145), Dst: xx.xx.xx.xx 
(xx.xx.xx.xx)
     Version: 4
     Header length: 20 bytes
     Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
     Total Length: 44
     Identification: 0x0000 (0)
     Flags: 0x04 (Don't Fragment)
     Fragment offset: 0
     Time to live: 50
     Protocol: TCP (0x06)
     Header checksum: 0x1126 [correct]
     Source: 69.25.58.145 (69.25.58.145)
     Destination: xx.xx.xx.xx (xx.xx.xx.xx)
Transmission Control Protocol, Src Port: 5555 (5555), Dst Port: 35674 
(35674), Seq: 0, Ack: 1, Len: 0
     Source port: 5555 (5555)
     Destination port: 35674 (35674)
     Sequence number: 0    (relative sequence number)
     Acknowledgement number: 1    (relative ack number)
     Header length: 24 bytes
     Flags: 0x0012 (SYN, ACK)
     Window size: 5840
     Checksum: 0x5337 [correct]
     Options: (4 bytes)

0000  00 0c 6e f9 ba 69 00 01 5c 22 c2 42 08 00 45 00   ..n..i..\".B..E.
0010  00 2c 00 00 40 00 32 06 11 26 45 19 3a 91 xx xx   .,..@.2..&E.:...
0020  xx xx 15 b3 8b 5a 85 0e c0 80 00 00 0f cc 60 12   .....Z........`.
0030  16 d0 53 37 00 00 02 04 05 b4 00 00               ..S7........

According to ethereal, there had been no previous communication with the
host that sent the packet.  The "FW-Inv: " prefix is unique to this
rule.

I receive a handful of packets like that each day. I see the same thing
with packets having a bad TCP checksum.  They also get classified as
INVALID.

Kernel version is 2.6.12 on an i686.  IPtables version 1.2.11.

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


