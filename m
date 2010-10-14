From: Paul Amaranth <Paul@Auroragrp.Com>
Subject: Incorrect UDP checksums when using nfq to modify packets
Date: Thu, 14 Oct 2010 17:11:28 -0400
Message-ID: <20101014211128.GH21125@tiger.AuroraGrp.Com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I need to fix a broken protocol by modifying certain UDP packets as
they pass through a firewall.  I have network taps so I can see
what's on the wire both before and after the firewall.  I am
using the NFQUEUE facility with queue 0 so iptables rules can
use the QUEUE target.  The intercept rule is in the FORWARD
chain, before the 172 source address is translated to an
external address.  I'm using a security modified 2.6.18 kernel
with the latest libnfnetlink and libnetfilter_queue from the netfilter
page.

I use nfq_get_payload to get the packet, modify the packet contents   
without changing the size (actually, just change an embedded IP
address), then send it off with

 nfq_set_verdict(qh, id, NF_ACCEPT, size, packet)

All this works very nicely.

Now, since the nat rules will change the source IP address, the UDP
checksum will have to be recalculated at that point.  When it goes out
on the wire, the UDP checksum has been incorrectly calculated.  By
definition, UDP packets with bad checksums are dropped, so that is not good.

It doesn't matter if I put in a corrected udp checksum, or set it to 0,
the checksum on the wire is bad (note this is not a case of an offload
error, I'm looking at the actual wire traffic).  I have even tried
calculating the checksum using the address translation that has yet to
happen.  Doesn't matter, the checksum is incorrect.  If I do not modify
the packet contents and use nfq_set_verdict with a 0 size and NULL
pointer, the checksum is correctly calculated, as are packets that do
not go through the QUEUE.

As an aside, the protocol is a broken one and leaves the IP header length
set to 0.

Anyone have a clue to what's going on?  I have a couple of ideas:  

1) I'm using the wrong chain for the intercept.  However, my firewall
   generator puts them in the FORWARD chain which is sort of reasaonble.
   Maybe I should put them in the POSTROUTING chain and recalc the UDP
   checksum myself?  It is not clear to me where the checksum is calculated
   and whether this would solve the problem.

2) I'm not using the nfq routine correctly.  Possible, the documentation is
   a bit sparse, but everything on the wire is correct except for the udp checksum.

3) The IP header length set to 0 is affecting the checksum.  This doesn't
   affect packets that have not been modified, though, so I don't think that's
   an issue.

4) Maybe there have been kernel updates since 2.6.18 that correct this.  If so, I
   can incorporate the changes; I can't replace the kernel with a different
   version for reasons that are not worth mentioning.

Thanks for any ideas.
-- 
Paul Amaranth, GCIH  | Rochester MI, USA              
Aurora Group, Inc.   |   Security, Systems & Software 
paul@AuroraGrp.Com   |   Unix & Windows               

