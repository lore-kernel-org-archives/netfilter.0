From: Christian Riechmann <riechmann@fgan.de>
Subject: Re: Need some clarification or help
Date: Thu, 22 Apr 2004 23:32:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040422213202.GB2328@rie.rie.priv>
References: <20040420182205.GA2948@rie.rie.priv> <Pine.LNX.4.44.0404220231510.27078-100000@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0404220231510.27078-100000@filer.marasystems.com>
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
Content-Transfer-Encoding: 7bit
To: Henrik Nordstrom <hno@marasystems.com>
Cc: netfilter@lists.netfilter.org

Henrik,

thanks for your answer and hint. But for me there remain
two questions (see below):

On 2004-04-22 02:38:36 +0200, Henrik Nordstrom wrote:
> On Tue, 20 Apr 2004, Christian Riechmann wrote:
> 
> > is it possible to read - via ipq_read/ipq_get_packet - a UDP packetr
> > and after some changes to accept - via ipq_set_verdict with NF_ACCEPT and
> > shorter length - it as a TCP packet?
> 
> Should be possible.

But why exist these surplus bytes beyond the end of the verdicted
IP/TCP packet, which seem to be the reason for a possible checksum 
within the kernel and cause the NOT-delivery of the packet to the
application. I attach a commeted log of the package flow.

> 
> > Here is what I wish to do:
> > For the transmission of IP packets (UDP, ICMP, TCP) between two hosts
> > I want to send these packets through a UDP tunnel.
> 
> This is best accomplished using a virtual tunnel device for the packet
> transformations. This way the packet flow gets natural to netfilter with
> no risk of confusing conntrack, and MTU processing etc gets more
> natural...  If you want to do the transformations in userspace then use a
> tun device.

I do not know whether this proposal is feasable, because I need a 1-to-n
tunnel and the tunnel should allow broadcast addressing. Perhaps you
can help me.

Regards 

Christian
-- 
Christian Riechmann    E-Mail: riechmann@fgan.de
c/o FGAN/FKIE          Tel: (+49) 228/9435 345,378
Neuenahrer Strasse 20  Fax: (+49) 228/9435 685
D-53343 Wachtberg, Germany


------ Commented Log file -------------

This is the IPv4/TCP packet captured at the sender:

process_loop: New packet has arrived.  : [21.04 17:21:50]
process_loop: 4510003c 66d14000 40069cc9 80071b06
process_loop: 80071bfd 04120017 6439742f 00000000
process_loop: a0c216d0 09300000 020405b4 0402080a
process_loop: 00a612fe 00000000 01030300

This packet will be encapsulated in userspace and transmitted
via IPv6/UDP-socket as

process_loop: New packet has arrived.  : [21.04 17:21:50]
process_loop: 45000065 00024000 40110373 80071b06
process_loop: 80071bff 040d008c 0051f99f 03010000
process_loop: 00000001 0101003c 4510003c 66d14000
process_loop: 40069cc9 80071b06 80071bfd 04120017
process_loop: 6439742f 00000000 a0c216d0 09300000
process_loop: 020405b4 0402080a 00a612fe 00000000
process_loop: 01030300 fd

On the receiver exactly this packet is captured and
given to the userspace program:

process_loop: New packet has arrived.  : [21.04 17:21:50]
process_loop: 45000065 00024000 40110373 80071b06
process_loop: 80071bff 040d008c 0051f99f 03010000
process_loop: 00000001 0101003c 4510003c 66d14000
process_loop: 40069cc9 80071b06 80071bfd 04120017
process_loop: 6439742f 00000000 a0c216d0 09300000
process_loop: 020405b4 0402080a 00a612fe 00000000
process_loop: 01030300 fd

The userspace program decapsulates the included packet
from the received one to:

process_WM_DATA: length_of_encap_packet = 60
process_loop: MODIFIED Packet: ACCEPTED
process_loop: 4510003c 66d14000 40069cc9 80071b06
process_loop: 80071bfd 04120017 6439742f 00000000
process_loop: a0c216d0 09300000 020405b4 0402080a
process_loop: 00a612fe 00000000 01030300

This packet is injected to the kernel.

A "tcpdump -x -n -s0 ip" running in the receiver host
shows the modified packet as:

17:21:50.855089 128.7.27.6.1042 > 128.7.27.253.23: SWE 1681486895:1681486895(0) win 5840 <mss 1460,sackOK,timestamp 10883838 0,nop,wscale 0> (DF) [tos 0x10]
                         4510 003c 66d1 4000 4006 9cc9 8007 1b06 \
                         8007 1bfd 0412 0017 6439 742f 0000 0000  |
                         a0c2 16d0 0930 0000 0204 05b4 0402 080a  > Original IPv6/TCP packet
                         00a6 12fe 0000 0000 0103 0300           /
                                                       0412 0017 \
                         6439 742f 0000 0000 a0c2 16d0 0930 0000  >  Surplus bytes (Don't know whether they
                         0204 05b4 0402 080a 00a6 12fe 0000 0000  >  can result in a checksum error within TCP)
                         0103 0300 fd                            /

It should be mentioned that, if I use "tcpdump -x -n -s0 ip \\tcp" instead,
tcpdump does not show the former packet. This may lead to the assumption
that this oversized packet may be the reason for the error (because of
checksum error).



