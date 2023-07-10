From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Processing nftable rules without loading them into the kernel
Date: Mon, 10 Jul 2023 09:39:04 +0200
Message-ID: <ZKu1mF2S4dxhH3vj@calendula>
References: <431a99d3-38b6-7108-4b54-3f8620a58c6c@gmail.com>
 <DCRE19RgCyYzfyvb4gv3bKsN5oCut4gnJz4RbbOZ9xboIv61XcIxVf4M-7lNixc60MbBeJ6ni2G1a_fBHpsDjJ0MqVkzxTAh5SGFKgy1tuY=@proton.me>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DCRE19RgCyYzfyvb4gv3bKsN5oCut4gnJz4RbbOZ9xboIv61XcIxVf4M-7lNixc60MbBeJ6ni2G1a_fBHpsDjJ0MqVkzxTAh5SGFKgy1tuY=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric <evil.function@proton.me>
Cc: George Shuklin <george.shuklin@gmail.com>, netfilter@vger.kernel.org

On Sun, Jul 09, 2023 at 03:12:31PM +0000, Eric wrote:
> On Sunday, July 9th, 2023 at 01:02, George Shuklin <george.shuklin@gmail.com> wrote:
> > I got a rather interesting task: I need to check if a given set of rules
> > on the disk is the same as loaded into the kernel.
> > 
> > The main problem is that nft list is quite different from the original
> > config (ordering, comments, etc), so I wonder if there is a way to make
> > nft just to read rules, process them and output back in the same format
> > as it is from nft ruleset list. Is there a way to force nft to just
> > 'process' rules to stdout without loading them into the kernel?
> 
> Well, after experimenting a bit, I'm not going to say, "No, it can't be done" as I've got sort of a hack that might be usable.
> 
> $ nft list ruleset | nft -c -d netlink -f - > x
> $ nft -c -d netlink -f my_rules.nft > y
> $ diff x y
> 
> At the very least, the counter values are different (so sed them?), but maybe it might be made to sort of work???

`-s' can be used to remove the stateful part of the counters.
