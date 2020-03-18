From: Florian Westphal <fw@strlen.de>
Subject: Re: Advantage(s) of static over dynamic nftables sets?
Date: Wed, 18 Mar 2020 23:51:53 +0100
Message-ID: <20200318225153.GM979@breakpoint.cc>
References: <a2d41bb9-2cbe-8b5e-99d9-a00cb086ca0b@fhmtech.com>
 <20200318213528.GL979@breakpoint.cc>
 <bc6f84a4-6599-eb7b-cc1c-e82f88d79ee0@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bc6f84a4-6599-eb7b-cc1c-e82f88d79ee0@fhmtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Frank Myhr <fmyhr@fhmtech.com> wrote:
> > > Would performance and/or memory usage take a significant hit by
> > > [defining all sets dynamic]?
> > 
> > I don't think so, but this will probably depend a lot on the
> > system in question and on the type of elements stored.
> 
> Makes sense, thanks. I suppose efficiency gets progressively worse for
> element types with larger possible ranges (# of bits), something like?:

Right now (assuming static), size <= 16 bits is most efficient,
then <= 32 bit, rest uses hash table.

> I suppose intervals are more efficient than an equivalent group of single
> elements?

Memory-wise yes, performance-wise no.

> Is a concatenation like ipv4_addr . inet_service as efficient as a pure data
> type with the same number of bits?

Yes, as it makes no difference for the storage.  The kernel doesn't know
what its storing, it only knows the size of the element.

It does store a 'type' information, but that is only used by nftables
so it knows how to format the elements when listing the ruleset.
