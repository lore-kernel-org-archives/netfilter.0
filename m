From: Florian Westphal <fw@strlen.de>
Subject: Re: conntrack: confirm existing but do not create new entries
Date: Wed, 18 Aug 2021 18:13:40 +0200
Message-ID: <20210818161340.GR607@breakpoint.cc>
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugene Crosser <crosser@average.org>
Cc: netfilter@vger.kernel.org

Eugene Crosser <crosser@average.org> wrote:
> My use case is to set up a stateful firewall allowing any outgoing connection
> from a host, and restricting incoming, which obviously requires conntracking.
> The twist is that there exists a rather high probability of DoS-like incoming
> traffic, that easily overflows conntrack table with unconfirmed entries, even
> though their lifetime is very short.

Create a rule that drops NEW packets in prerouting hook. For iptables,
mangle will work (raw is too early).  For nftables, youl need to choose
a hook prioriy of -199 or higher (-198, ... to anything below 2**31).

Such packets will create a new connection entry, but because packet gets
dropped before confirmation the entry will not be committed to the table.
