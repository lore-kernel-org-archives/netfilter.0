From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables] economics of reverse path filtering - FIB expression
 vs. kernel parameter
Date: Thu, 13 Feb 2020 13:48:07 +0100
Message-ID: <20200213124807.GP2991@breakpoint.cc>
References: <4c393f46-903c-bfe3-0b91-a4b5411b50d0@gmx.net>
 <075aab6d-0c81-f38a-eed1-41be303066d9@gmx.net>
 <0b6710c6-d2d2-59bd-8054-d4b6203781a1@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0b6710c6-d2d2-59bd-8054-d4b6203781a1@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> On 12/02/2020 11:03, ѽ҉ᶬḳ℠ wrote:
> > On 09/02/2020 12:51, ѽ҉ᶬḳ℠ wrote:
> > > Presumably NFT rule
> > > 
> > > * filter prerouting fib saddr . iif oif missing drop
> > > 
> > > and kernel parameter
> > > 
> > > net.ipv4.conf.<interface>.rp_filter = 2
> > > 
> > > achieving the same goal.
> > > 
> > > Which one comes into effect first, if there is difference assuming
> > > that both are being processed through netfilter?

prerouting hook comes before routing decision in network stack, so,
if you drop a packet there it will never make it to the routing
decision.

> > Been also wondering about potential conflicts between kernel parameters
> > Another example - here purposely creating a conflict:
> > 
> > * net.ipv6.conf.<interface>.accept_redirects = 0
> > 
> > vs.
> > 
> > * ip6 saddr fe80::/10 ip6 hoplimit 255 daddr FF02::1 icmpv6 type 137
> > accept;

Accepting packet means that processing continues, it
doesn't have any other effect.

So it doesn't matter if you accept redirect packets in nftables or if you
do not have nftables rules at all.
