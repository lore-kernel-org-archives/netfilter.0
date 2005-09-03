From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Lost packets, un-masqueraded retransmits
Date: Sat, 03 Sep 2005 01:43:48 -0500
Message-ID: <43194624.4010609@riverviewtech.net>
References: <Pine.LNX.4.44.0509012224260.4223-100000@rhubarb.frogtop.com>	<4317FFE3.6060403@riverviewtech.net>
	<Pine.LNX.4.53.0509021238270.20330@sponge.fish4.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0509021238270.20330@sponge.fish4.co.uk>
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

> Brilliant - thank you for your detailed response Grant, you're completely 
> correct.  The ICMP errors are clearly being dropped somewhere outside my 
> control, and the backing off of the retries sending the full-size packet 
> fits perfectly.

Good.

> Knowing now what the issue is, I can find the millions of web pages about 
> the same problem - apologies for bothering you with such a FAQ!  The MSS 
> clamp works perfectly.

Nonsense!  You were not a bother at all.  This mail list is for exactly these types of questions.  IMHO the Linux / Unix community is nothing if we do not try to help each other but instead compete for each and every boxen to administer like so many of the Windows admins that I know.  :(

> Any thoughts regarding the 'leaking packets', reaching the external network 
> without getting masqueraded?  I'm monitoring now to see if I still get them, 
> which I possibly won't since they all seemed to be retransmits - I'll post 
> again if they're still around.  But here's the detail of one such packet, 
> grabbed from ppp0 on the gateway:

Well possibly.  You are NATing in the nat table POSTROUTING chain as you should be.  However I believe that packets only traverse the nat table if they are considered NEW.  (I'm not sure how this works (for the rest of the packets, conntrack?) but I believe it to be the case.)  Thus if the portion of the NATing / MASQUERADEing code does not alter the source IP for packets that it has already seen one time I could see how your unaltered packets are getting out.  Thus I would wonder if you could not put a rule in your filter table OUTPUT chain to only allow packets out your internet interface if they have a source address of your globally routable IP.

I do think this is an issue that should be further documented and brought to the attention of the Net Filter Developers to see what they think of it.  Unfortunetly I am not one of the devls and thus can not help you much more than that.

> 0000  00 04 02 00 00 00 00 00 00 00 00 00 00 00 08 00   ................
> 0010  45 00 00 28 4e 16 40 00 7f 06 21 f8 c0 a8 1f bf   E..(N.@...!.....
> 0020  c2 42 e9 17 06 01 00 50 6b ba 7a 19 88 1d 82 de   .B.....Pk.z.....
> 0030  50 11 ff ff 2c f1 00 00                           P...,...
> 
> [unpacking details from ethereal...]
> Frame 6655 (56 bytes on wire, 56 bytes captured)
>     Arrival Time: Sep  2, 2005 12:31:01.442977000
>     Time delta from previous packet: 0.300389000 seconds
>     Time since reference or first frame: 882.838297000 seconds
>     Frame Number: 6655
>     Packet Length: 56 bytes
>     Capture Length: 56 bytes
>     Protocols in frame: sll:ip:tcp
> Linux cooked capture
>     Packet type: Sent by us (4)
>     Link-layer address type: 512
>     Link-layer address length: 0
>     Source: <MISSING>
>     Protocol: IP (0x0800)
> Internet Protocol, Src: 192.168.31.191 (192.168.31.191), Dst: 194.66.233.23 (194.66.233.23)
>     Version: 4
>     Header length: 20 bytes
>     Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
>         0000 00.. = Differentiated Services Codepoint: Default (0x00)
>         .... ..0. = ECN-Capable Transport (ECT): 0
>         .... ...0 = ECN-CE: 0
>     Total Length: 40
>     Identification: 0x4e16 (19990)
>     Flags: 0x04 (Don't Fragment)
>         0... = Reserved bit: Not set
>         .1.. = Don't fragment: Set
>         ..0. = More fragments: Not set
>     Fragment offset: 0
>     Time to live: 127
>     Protocol: TCP (0x06)
>     Header checksum: 0x21f8 [correct]
>     Source: 192.168.31.191 (192.168.31.191)
>     Destination: 194.66.233.23 (194.66.233.23)
> Transmission Control Protocol, Src Port: 1537 (1537), Dst Port: http (80), Seq: 0, Ack: 0, Len: 0
>     Source port: 1537 (1537)
>     Destination port: http (80)
>     Sequence number: 0    (relative sequence number)
>     Acknowledgement number: 0    (relative ack number)
>     Header length: 20 bytes
>     Flags: 0x0011 (FIN, ACK)
>         0... .... = Congestion Window Reduced (CWR): Not set
>         .0.. .... = ECN-Echo: Not set
>         ..0. .... = Urgent: Not set
>         ...1 .... = Acknowledgment: Set
>         .... 0... = Push: Not set
>         .... .0.. = Reset: Not set
>         .... ..0. = Syn: Not set
>         .... ...1 = Fin: Set
>     Window size: 65535
>     Checksum: 0x2cf1 [correct]
>     SEQ/ACK analysis
>         TCP Analysis Flags
>             This frame is a (suspected) retransmission
>             The RTO for this segment was: 0.600510000 seconds
>             RTO based on delta from frame: 6653

Wow!  I have not seen so much detail on a packet in a LONG time.  At this moment I'm too out of it (I've been fighting a bug) to make much sense out of it.  Looking it over any way the only thing that I do see is the line that states "...This frame is a (suspected) retransmission... ...RTO based on delta from frame: 6653...".



Grant. . . .

