From: Florian Westphal <fw@strlen.de>
Subject: Re: Advantage(s) of static over dynamic nftables sets?
Date: Wed, 18 Mar 2020 22:35:28 +0100
Message-ID: <20200318213528.GL979@breakpoint.cc>
References: <a2d41bb9-2cbe-8b5e-99d9-a00cb086ca0b@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a2d41bb9-2cbe-8b5e-99d9-a00cb086ca0b@fhmtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Frank Myhr <fmyhr@fhmtech.com> wrote:
> As an nftables newbie I was a bit surprised to discover that defining a set
> as static prevents adding or deleting elements not only from the packet path
> but also from the nft command line:
> 
> #  nft add element ip ip_filter static_set { a.b.c.d }
> Error: Could not process rule: Device or resource busy

Yes, such set is immutable.

> Which is easily remedied by defining the set as dynamic instead.
> 
> So now I wonder: why not define every set as dynamic?

Sets that are made static allow kernel to pick a more efficient
representation for the set type.

> Which would allow
> modification of any set's elements without having to reload the entire
> firewall -- thereby preserving accumulated counters and other stateful
> objects. Would performance and/or memory usage take a significant hit by
> doing this?

I don't think so, but this will probably depend a lot on the
system in question and on the type of elements stored.
