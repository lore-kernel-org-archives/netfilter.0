From: Phil Radden <phil-netfilter@frogtop.com>
Subject: Re: Lost packets, un-masqueraded retransmits
Date: Fri, 2 Sep 2005 12:55:28 +0100 (BST)
Message-ID: <Pine.LNX.4.53.0509021238270.20330@sponge.fish4.co.uk>
References: <Pine.LNX.4.44.0509012224260.4223-100000@rhubarb.frogtop.com>
	<4317FFE3.6060403@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4317FFE3.6060403@riverviewtech.net>
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

On Fri, 2 Sep 2005, Grant Taylor wrote:
> The first thing that comes to mind is (I know that I have said this about
> 3 or 4 times in the last week to various people on and off this list) that
> your Path MTU value is killing things.  If you notice in the 2nd traffic
> dump (tcpdump output) the Don't Fragment (DF) flag is set on the packet.  
> I would be willing to bet that the returning traffic is being dropped b/c
> the packets are too large to fit in the frame of the PPP over ATM frame.

Brilliant - thank you for your detailed response Grant, you're completely 
correct.  The ICMP errors are clearly being dropped somewhere outside my 
control, and the backing off of the retries sending the full-size packet 
fits perfectly.

Knowing now what the issue is, I can find the millions of web pages about 
the same problem - apologies for bothering you with such a FAQ!  The MSS 
clamp works perfectly.

Any thoughts regarding the 'leaking packets', reaching the external network 
without getting masqueraded?  I'm monitoring now to see if I still get them, 
which I possibly won't since they all seemed to be retransmits - I'll post 
again if they're still around.  But here's the detail of one such packet, 
grabbed from ppp0 on the gateway:

0000  00 04 02 00 00 00 00 00 00 00 00 00 00 00 08 00   ................
0010  45 00 00 28 4e 16 40 00 7f 06 21 f8 c0 a8 1f bf   E..(N.@...!.....
0020  c2 42 e9 17 06 01 00 50 6b ba 7a 19 88 1d 82 de   .B.....Pk.z.....
0030  50 11 ff ff 2c f1 00 00                           P...,...

[unpacking details from ethereal...]
Frame 6655 (56 bytes on wire, 56 bytes captured)
    Arrival Time: Sep  2, 2005 12:31:01.442977000
    Time delta from previous packet: 0.300389000 seconds
    Time since reference or first frame: 882.838297000 seconds
    Frame Number: 6655
    Packet Length: 56 bytes
    Capture Length: 56 bytes
    Protocols in frame: sll:ip:tcp
Linux cooked capture
    Packet type: Sent by us (4)
    Link-layer address type: 512
    Link-layer address length: 0
    Source: <MISSING>
    Protocol: IP (0x0800)
Internet Protocol, Src: 192.168.31.191 (192.168.31.191), Dst: 194.66.233.23 (194.66.233.23)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
        0000 00.. = Differentiated Services Codepoint: Default (0x00)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 40
    Identification: 0x4e16 (19990)
    Flags: 0x04 (Don't Fragment)
        0... = Reserved bit: Not set
        .1.. = Don't fragment: Set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 127
    Protocol: TCP (0x06)
    Header checksum: 0x21f8 [correct]
    Source: 192.168.31.191 (192.168.31.191)
    Destination: 194.66.233.23 (194.66.233.23)
Transmission Control Protocol, Src Port: 1537 (1537), Dst Port: http (80), Seq: 0, Ack: 0, Len: 0
    Source port: 1537 (1537)
    Destination port: http (80)
    Sequence number: 0    (relative sequence number)
    Acknowledgement number: 0    (relative ack number)
    Header length: 20 bytes
    Flags: 0x0011 (FIN, ACK)
        0... .... = Congestion Window Reduced (CWR): Not set
        .0.. .... = ECN-Echo: Not set
        ..0. .... = Urgent: Not set
        ...1 .... = Acknowledgment: Set
        .... 0... = Push: Not set
        .... .0.. = Reset: Not set
        .... ..0. = Syn: Not set
        .... ...1 = Fin: Set
    Window size: 65535
    Checksum: 0x2cf1 [correct]
    SEQ/ACK analysis
        TCP Analysis Flags
            This frame is a (suspected) retransmission
            The RTO for this segment was: 0.600510000 seconds
            RTO based on delta from frame: 6653


Many thanks,
Phil

