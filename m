From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: prio + policing filter on ingress?
Date: Tue, 13 Dec 2011 14:19:06 -0600
Message-ID: <op.v6f2p4edx1lyi3@debiandesk2.net>
References: <op.v6dujdvsx1lyi3@debiandesk2.net>
 <1323800724.1995.58.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1323800724.1995.58.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 13 Dec 2011 12:25:24 -0600, Andrew Beverley <andy@andybev.com> wrote:

> Interesting case, which I think you've made a good start at. I don't
> have the textbook answer for you, but a couple of thoughts (I don't know
> whether these will necessarily work):
> - Could you do the policing by attaching an ingress qdisc to eth0 (in
> addition to the above rules)?

That's what I did at first (still untested).  I have a policing qdisc on ingress of each of the outward-facing interfaces, and I put a prio qdisc with filters as in my example on egress of the inward-facing (LAN) interface.  But I have my doubts this will work, since the policing qdiscs should pretty much eliminate any inbound queue in the router, right?

I should explain the goal here.  There are 5 outward-facing interfaces, and the router load-balances over them using ip and "nexthop via".  Each interface is currently only 5 Mgit, policed to 4 Mbit with ingress qdiscs, to keep the upstream provider from queuing, to improve latency.  This is for a small ISP (about 70 customers) belonging to a friend.  Internet is distributed via a wireless LAN to customers. The customers' radios do the bandwidth-limiting.  A typical download speed is 500Kbit.

Now, my friend wants to be able to make personal use of the UNUSED bandwidth without infringing on his customers' paid bandwidth.  So I got the idea of putting all traffic to his IP (192.168.0.5 in my example) into band 3 of a prio qdisc.

It seems to me that for this to work, a way has to be found for the policer to drop over-bandwidth packets bound for my friend's IP before it drops customers packets.  Would that enable customers to get their full download bandwidth, while giving access to EXTRA bandwidth to my friend?  I'm not even sure this would work in theory.

> - Could you set up another IFB device (that receives the same traffic)
> with a policer attached to it?

I'm not sure what you mean.  Can 2 ifb devices on the same interface receive the same traffic?
> - Could you do some sort of parent/child set up, such as a PRIO as the
> child of a HTB, so that the parent does the policing and the PRIO does
> the priority (although having just read the Traffic Control HOWTO you
> may not be able to do this because you cannot have differing types of
> qdiscs within each other).

Hmmm, I know it is possible to have HTB as root qdisc with PRIO as child, but I don't know how to combine a policing filter with PRIO.

I think the only way to do this may be to do bandwidth-limiting in the router (rather than in the radio) with HTB classes for each customer, with CEIL = total bandwidth for my ISP's personal IP.  Policing would remain on ingress of each outward-facing interface.

-- 
Lloyd
