From: Florian Westphal <fw@strlen.de>
Subject: Re: Why aren't INPUT and FORWARD chains available to a
 locally-generated packet?
Date: Wed, 11 Aug 2021 16:29:21 +0200
Message-ID: <20210811142921.GW607@breakpoint.cc>
References: <CACj4R39Zf=cK5p3-_YtDhvqqBMLd3Jyrk7uhcoc9pTm_PrUhtA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACj4R39Zf=cK5p3-_YtDhvqqBMLd3Jyrk7uhcoc9pTm_PrUhtA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry S <simonsharry@gmail.com>
Cc: netfilter@vger.kernel.org

Harry S <simonsharry@gmail.com> wrote:
> Hello,
> 
> I'm unable to understand why in Netfilter there are no INPUT versus
> FORWARD chain choices right after the packet has traversed the OUTPUT
> chain? Currently, a locally-generated packet goes straight from OUTPUT
> to POSTROUTING!

[..]
> Let's say a process on a router host generates a packet. This packet
> goes to the OUTPUT chain, following which a routing decision is made.

No, for output, routing decision happens before output.

Else you could not filter based on output interface name in OUTPUT.

There is a rerouting check/reroute enforcement in mangle:output
to handle a change in the packet mark.

Same for NAT in output: re-route if the destination ip
changed.

> Now, this packet could be destined either for the loopback interface,
> or for one of the host's many ethernet interfaces. If so, why
> shouldn't Netfilter bring the packet to the same INPUT / FORWARD
> decision-fork in the path that exists for an incoming packet soon
> after it has crossed PREROUTING?

If its loopback, packet ends up using:

OUTPUT -> POSTROUTING -> PREROUTING -> INPUT (or FORWARD).
