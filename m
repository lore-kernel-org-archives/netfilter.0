From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Named sets/maps and atomic reload of the ruleset
Date: Fri, 11 Feb 2022 00:14:10 +0100
Message-ID: <YgWcQrSbXh/rKfYJ@salvia>
References: <63da5cd7-9afe-431f-e3b9-f1c62c96f652@average.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <63da5cd7-9afe-431f-e3b9-f1c62c96f652@average.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugene Crosser <crosser@average.org>
Cc: netfilter@vger.kernel.org

On Wed, Feb 09, 2022 at 10:50:44PM +0100, Eugene Crosser wrote:
> Hello all,
> 
> Both the ability to flush the ruleset and replace it with the new one
> atomically, without leaving an unprotected window, and the existence of named
> sets and maps, that can be updated dynamically when e.g. interfaces or routes
> are added and removed, are awesome features of nftables.
> 
> The problem is, though, how to make these two features play nice with one
> another. One use case that I have in mind is to replace the collection of rules
> in chains with a new improved version, while keeping (or dumping and later
> restoring) the contents of named maps and sets.

So you would like to replace one chain and its rules by a new chain
also containing new rules...

> Saving the data from maps and sets with a separate command before
> reload of the ruleset, and repopulating after leaves a window during
> which dynamic updates may be lost, and a window during which the set
> operates with unpopulated maps/sets.

... and you would like that sets/maps remain in the kernel while this
chain replacement operation happens.

> What would be the recommended way to solve this problem?

If what I describe above is accurate, then you could run a batch like this:

# nft -f update.nft
flush chain x y
chain x y {
        ... # new rules here
}
