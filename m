From: "Eric B." <ebenze@hotmail.com>
Subject: Success routing mark'ed packets - but still confused why it didn't work the first time....
Date: Tue, 8 Apr 2008 18:06:32 -0400
Message-ID: <ftgq9j$mf$1@ger.gmane.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Okay - after an unbelievable number of hours struggling with this, I have
finally managed to get my server working; responding to packets using 2
different gateways based on 2 different virtual ips.  However, I don't
understand why my original concept wasn't working.

Step 0) Create a default route in the main routing table for all "regular"
packets
Step 1) Create an new iproute2 routing table with a default gw and an
associated ip rule that redirects all "mark"ed packets to that table/route.
Step 2) Marking the packets:
Originally, I tried mark'ing packets in the mangle Prerouting table destined
for my machine's virtual ip.  I was under the impression that any response
to those packets would maintain the mark and hence be routed through the
appropriate routing table created in step 1.  However, this didn't work.
And without any way of "seeing" whether the outgoing packets were marked, I
couldn't tell why they weren't being routed properly (BTW - is there a way
to "see" the mark on the packet in the log?)

My solution was to use the mangle Output table to mark all the outgoing
packets with their source being the virtual ip.  Once I did that, success.
My outgoing packets are properly redirected out the appropriate gateways.


However my question now is the root of my confusion.  If a packet is mark'ed
in the Preroute mangle table, is that mark not supposed to be maintained
throughout the life of the packet, including the machine's response to that
packet?  If not, there is a lot of documentation that indicates as much,
including several howtos and guides that seem to indicate it.  For example,
http://linux-ip.net/html/linux-ip.html#adv-multi-internet-outbound indicates
to set the mark in the mangle preroute table, and then to add an ip rule.
However, as much as I tried, that soln just didn't work.

Can anyhow help clear this up a little?  When/where/why does that mark get
cleared/reset?

Thanks,

Eric




