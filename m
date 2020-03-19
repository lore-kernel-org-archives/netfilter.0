From: Florian Westphal <fw@strlen.de>
Subject: Re: Advantage(s) of static over dynamic nftables sets?
Date: Thu, 19 Mar 2020 01:08:34 +0100
Message-ID: <20200319000834.GN979@breakpoint.cc>
References: <a2d41bb9-2cbe-8b5e-99d9-a00cb086ca0b@fhmtech.com>
 <20200318213528.GL979@breakpoint.cc>
 <bc6f84a4-6599-eb7b-cc1c-e82f88d79ee0@fhmtech.com>
 <20200318225153.GM979@breakpoint.cc>
 <490f10f9-33fa-c85d-9fd3-4dfae823166a@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <490f10f9-33fa-c85d-9fd3-4dfae823166a@fhmtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Frank Myhr <fmyhr@fhmtech.com> wrote:
> > > I suppose intervals are more efficient than an equivalent group of single
> > > elements?
> > 
> > Memory-wise yes, performance-wise no.
> 
> Also good to know.
> 
> > > Is a concatenation like ipv4_addr . inet_service as efficient as a pure data
> > > type with the same number of bits?
> > 
> > Yes, as it makes no difference for the storage.  The kernel doesn't know
> > what its storing, it only knows the size of the element.
> > 
> > It does store a 'type' information, but that is only used by nftables
> > so it knows how to format the elements when listing the ruleset.
> 
> Thanks for confirming, and for all of your detailed answers.
> 
> If you find the time (and if it's comprehensible to a non-kernel
> programmer): How does a dynamic set change the above situation? Does it use
> a hash table for everything?

Yes, dynamic set always uses 'rhashtable' backend, thats the only type
that supports insertion from the packet path.

We have 3 hash tables, a simple one for 32bit keys, one for static sets
(table size decided at creation time) and rhashtable (table size is
auto-resized as needed).
