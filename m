From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables v0.9.2] inet <> ip | ip6 family tables processing
 order?
Date: Wed, 5 Feb 2020 12:21:04 +0100
Message-ID: <20200205112104.GA26952@breakpoint.cc>
References: <dad1e392-ae29-a3bf-7411-d1dfe2095de2@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dad1e392-ae29-a3bf-7411-d1dfe2095de2@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> Having deployed family tables:
> 
> * inet
> * ip
> * ip6
> 
> and to my understanding the _base chain definitions_, hook priority and
> policy, are only applicable to chains within the same family table but are
> mutually exclusive between the different family tables I am struggling to
> comprehend as to the order of packet processing among the aforementioned
> family tables:
> 
> * which family table the packet is processed trough first/last - inet or ip
> | ip6?

None.  Ordering is by prio, not by family.

In ip vs ip6 case its even irrelevant because an ipv4 packet will never
travel any of the ip6 base chains, ever (and vice versa).

> * if the hook priority in the base chains of each family is the same but
> different policies being applied how would such conflict, inet vs. ip | ip6,
> resolve?

Implementation defined, right now its 'last added'.
But result is the same, if verdict is "drop", packet is discarded and
evaluation ends.

Just like with iptables: if you drop in mangle input, filter table won't
even get a chance to see the packet.

> As far as I comprehend jump | goto works with chains in the same family
> table but it is not possible to jump | goto from the inet table to ip | ip6
> or vice versa, or is it?

Its not, each table is a distinct entity.
