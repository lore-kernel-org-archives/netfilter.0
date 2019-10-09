From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft: auto-merge set doesn't merge overlapping intervals
Date: Wed, 9 Oct 2019 23:02:30 +0200
Message-ID: <20191009210230.z74pe5fvhldlgva2@salvia>
References: <CAKWQeyhnQJPoveHKFNBPHosict1v-fAOGoHHVt3_ksv74qNEig@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKWQeyhnQJPoveHKFNBPHosict1v-fAOGoHHVt3_ksv74qNEig@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Stanway <r1ch@teamliquid.net>
Cc: netfilter@vger.kernel.org

On Wed, Oct 02, 2019 at 12:17:49PM +0200, Richard Stanway wrote:
> Hello,
> I'm making the transition from iptables to nftables and running into
> an issue moving from ipset to native nftables sets. I've created a set
> with an interval and the auto-merge flag, however when adding an
> address with a mask that happens to cover an existing entry in the
> set, the command gives an error instead of merging the two as I
> expected. Example output:
> 
> # nft -v
> nftables v0.9.2 (Scram)
> 
> # nft add set ip filter blackhole "{ type ipv4_addr; flags interval;
> auto-merge }"
> 
> # nft list set ip filter blackhole
> table ip filter {
>         set blackhole {
>                 type ipv4_addr
>                 flags interval
>                 auto-merge
>         }
> }
> # nft add element ip filter blackhole { 10.0.0.1, }
> 
> # nft add element ip filter blackhole { 10.0.0.0/8, }
> Error: interval overlaps with an existing one
> add element filter blackhole { 10.0.0.0/8, }
>                                ^^^^^^^^^^
> Error: Could not process rule: File exists
> add element filter blackhole { 10.0.0.0/8, }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Am I misunderstanding how auto-merge works or is this a bug?

It should work if you specify both elements in the same command, ie.

# nft add element ip filter blackhole { 10.0.0.1, 10.0.0.0/8 }

Having said this, "smarter" merging should be possible from userspace,
like what you need, but this is not supported right now.
