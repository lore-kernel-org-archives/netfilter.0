From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: bandwidth counting
Date: Sun, 27 Sep 2009 15:07:47 +1300
Message-ID: <4ABEC8F3.10304@treenet.co.nz>
References: <1253935760.26388.1092.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1253935760.26388.1092.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bob Miller <bob@computerisms.ca>
Cc: netfilter@vger.kernel.org

Bob Miller wrote:
> Greetings,
> I am not sure what it is about iptables, to me it's like a level 7 spell
> and I am only a level 6 mage.  I (think I) understand the concepts when
> I read them, but whenever I try to implement them, they seldom come out
> as I expect them too.
> I have a debian box I use as a firewall, I use the ipmasq package to
> manage my iptables setup.
> I saw an article some time ago on how to set up bandwidth monitoring
> using iptables.  I wanted to use this idea to track how much data is
> being passed across my external interface to see if it matches what my
> ISP says, as well as to find out which computers on my lan were using
> the data.  I also wanted to measure only the internet traffic from the
> lan, and avoid counting the data destined for other lan targets - I am
> not concerned with the intranet bandwidth.
> I think the forward chain of the filter table should pass all packets I
> want to keep track of, so I sent all packets on the forward chain to a
> custom chain to count bandwidth, and I sent all the packets with a
> source/dest ip from the lan passing through the forward chain to another
> custom chain for counting.  
> But the numbers dont' add up, I get a total of just over 2 GB for the
> lan ips in both directions, but the total count on the forward chain is
> 11 GB.  I expected them to be very close to the same. 
> So, obviously I don't have the understanding of the level 7 spell that I
> thought I did.
> I also think (thought) that the input and output chains of the filter
> table should give me a total count of bandwidth on my external
> interface, but some documentation I have been reading has me rethinking
> that perhaps the prerouting chain on the raw table for incoming and
> postrouting on the nat table for outgoing would give me a more accurate
> count of what my ISP will count.
> I am sure there are more ways to approach this than I wish to count, but
> I would very much welcome some suggestions and comments on which
> tables/chains would be best for my purposes...

I hit this same problem myself.
It turns out that FORWARD in filter only sees packets destined to other 
boxes on the network.

What you need to monitor is the mangle table. That table sees everything 
going in/out of the box.

AYJ
