From: root <root@fgan.de>
Subject: Re: Need some clarification or help
Date: Thu, 22 Apr 2004 22:41:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040422204157.GA1993@rie.rie.priv>
References: <20040420182205.GA2948@rie.rie.priv> <200404201947.39774.Antony@Soft-Solutions.co.uk> <20040420205144.GC2997@rie.rie.priv> <003c01c4271e$ffbe9a00$68892090@grouse> <20040421111445.GA892@rie.rie.priv> <00e301c427b7$0ed49dd0$68892090@grouse> <20040421195154.GA1367@rie.rie.priv> <025901c427ee$6d883800$68892090@grouse>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <025901c427ee$6d883800$68892090@grouse>
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
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: Christian Riechmann <riechmann@fgan.de>, netfilter@lists.netfilter.org

Hi Jee,

sorry for my late response.

On Wed, Apr 21, 2004 at 11:17:26PM +0100, Jee J.Z. wrote:

> > > > As I mentioned in my first mail, this method works very well with
> > > > encapsulated UDP and ICMP packets, but not with TCP, although a tcpdump
> > > > running on the receiver displays the injected IP/TCP packet, but with some
> > > > additional bytes at the end. In other words tcpdump seems to display an
> > > > IP/TCP packet, which according to the length field of IP shall have only
> > > > 64 bytes but really consists of 80 bytes (numbers are only examples).
> > >
> > > Does tcpdump show whether the checksum is correct or not? Ethereal does.
> >
> > Ethereal does not capture the packet including surplus bytes.
> 
> Oh, yes. Ethereal only canptures the encapsulated packet. Right?

Yes.

> 
> > tcpdump shows that packet only in case of "tcpdump -x -n -s0 ip" but
> > that packet is not shown if I use the call "tcpdump -x -n -s0 tcp" or
> > "tcpdump -x -n -s0 ip \\tcp". Maybe because of checksum error?.
> 
> Hmmm. Sounds reasonable.
> 
> > >
> > > > My assumption is, that these surplus bytes beyond the end, lead to the
> > > > problem (maybe a checksum error because of those bytes not belonging to
> > > > the TCP packet.) I do not see why during injection the surplus bytes
> > > > have not been deleted, although the verdict call is parameterized with
> > > > the new length.
> > >
> > > Is the length of surplus bytes constant? I tried injecting more bytes
> > > before, and the system does not think these additional bytes as a part of
> > > the original packet; instead, the system thinks it as packet suffix and does
> > > not include it when calculating checksum. However, things might be
> > > different -- just for your information.
> >
> > Yes, the length of surplus bytes is always length_of_captured_packet -
> > length_of_modified_packet (parameter of the ipq_set_verdict call).
> 
> Since you know the number of the additional bytes, why not get rid of them
> before calling ipq_set_verdict? From your traces, it seems the surplus bytes
> are some duplicate part of the original packet. It's strange why they are
> here.

In my opinion the surplus bytes are not more part of the packet, because
I gave the new length as parameter of the ipq_set_verdict call. I do not
know any other method to get rid of them. Do you have an idea?
The fact that the surplus bytes are partly the same as of the original
packet can be explined: My program strips the IP, UDP and some
encapsulation bytes.

> 
> > For your info I attach a file including the commented sequence of the
> > packet flow from sender to receiver.
> 
> As you know, TCP, UDP, and ICMP checksums are calculated based on both their
> header and their payload, unlike IP. Therefore, these additional bytes in
> your trace may result in the checksum calculation incorrectness. I assume
> you don't have these additional bytes when you tested on UDP and ICMP
> packets.

No, in both cases they are there, but that has no bad effect. Therefore
my assumption that the calculation of the TCP checksum includes all
remaining bytes at the end.

On the other hand, I do not understand why after the verdict call the
packet holds the surplus bytes. Maybe this should be fixed?

Regards

Christian

> > ----------------------- Packet flow -----------------------
> >
> > This is the IPv4/TCP packet captured at the sender:
> >
> > process_loop: New packet has arrived.  : [21.04 17:21:50]
> > process_loop: 4510003c 66d14000 40069cc9 80071b06
> > process_loop: 80071bfd 04120017 6439742f 00000000
> > process_loop: a0c216d0 09300000 020405b4 0402080a
> > process_loop: 00a612fe 00000000 01030300
> >
> > This packet will be encapsulated in userspace and transmitted
> > via IPv6/UDP-socket as
> >
> > process_loop: New packet has arrived.  : [21.04 17:21:50]
> > process_loop: 45000065 00024000 40110373 80071b06
> > process_loop: 80071bff 040d008c 0051f99f 03010000
> > process_loop: 00000001 0101003c 4510003c 66d14000
> > process_loop: 40069cc9 80071b06 80071bfd 04120017
> > process_loop: 6439742f 00000000 a0c216d0 09300000
> > process_loop: 020405b4 0402080a 00a612fe 00000000
> > process_loop: 01030300 fd
> >
> > On the receiver exactly this packet is captured and
> > given to the userspace program:
> >
> > process_loop: New packet has arrived.  : [21.04 17:21:50]
> > process_loop: 45000065 00024000 40110373 80071b06
> > process_loop: 80071bff 040d008c 0051f99f 03010000
> > process_loop: 00000001 0101003c 4510003c 66d14000
> > process_loop: 40069cc9 80071b06 80071bfd 04120017
> > process_loop: 6439742f 00000000 a0c216d0 09300000
> > process_loop: 020405b4 0402080a 00a612fe 00000000
> > process_loop: 01030300 fd
> >
> > The userspace program decapsulates the included packet
> > from the received one to:
> >
> > process_WM_DATA: length_of_encap_packet = 60
> > process_loop: MODIFIED Packet: ACCEPTED
> > process_loop: 4510003c 66d14000 40069cc9 80071b06
> > process_loop: 80071bfd 04120017 6439742f 00000000
> > process_loop: a0c216d0 09300000 020405b4 0402080a
> > process_loop: 00a612fe 00000000 01030300
> >
> > This packet is injected to the kernel.
> >
> > A "tcpdump -x -n -s0 ip" running in the receiver host
> > shows the modified packet as:
> >
> > 17:21:50.855089 128.7.27.6.1042 > 128.7.27.253.23: SWE
> 1681486895:1681486895(0) win 5840 <mss 1460,sackOK,timestamp 10883838
> 0,nop,wscale 0> (DF) [tos 0x10]
> >                          4510 003c 66d1 4000 4006 9cc9 8007 1b06 \
> >                          8007 1bfd 0412 0017 6439 742f 0000 0000  |
> >                          a0c2 16d0 0930 0000 0204 05b4 0402 080a  >
> Original IPv6/TCP packet
> >                          00a6 12fe 0000 0000 0103 0300           /
> >                                                        0412 0017 \
> >                          6439 742f 0000 0000 a0c2 16d0 0930 0000  >
> Surplus bytes (Don't know whether they
> >                          0204 05b4 0402 080a 00a6 12fe 0000 0000  >  can
> result in a checksum error within TCP)
> >                          0103 0300 fd                            /
> >
> > It should be mentioned that, if I use "tcpdump -x -n -s0 ip \\tcp"
> instead,
> > tcpdump does not show the former packet. This may lead to the assumption
> > that this oversized packet may be the reason for the error (because of
> > checksum error).
> >
> >
> >
> 

