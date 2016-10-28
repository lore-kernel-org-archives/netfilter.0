From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: named set for ipv4 networks
Date: Fri, 28 Oct 2016 10:04:19 +0200
Message-ID: <20161028080419.GB1553@salvia>
References: <20161023213822.16337e5c@doomgiver>
 <20161027192338.GA1570@salvia>
 <20161027234152.2c94a832@doomgiver>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161027234152.2c94a832@doomgiver>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Merten Lohse <leon@green-side.de>
Cc: netfilter@vger.kernel.org

On Thu, Oct 27, 2016 at 11:41:52PM +0200, Leon Merten Lohse wrote:
> (repost to list. sorry for the duplicate)
> 
> Thank you, Pablo!
> Unfortunately this results in a segfault for me. I was able to boil the
> ruleset down to a minimal example that segfaults. 
> 
> # nft -f segfault.ruleset 
> Segmentation fault
> 
> Even if I made a severe error, it should not segfault, right? ..
> 
> Versions of nftables and kernel are as in my previous emails.
> 
> Best 
> Leon
> 
> ---
> 
> # segfault.ruleset
> 
> flush ruleset
> 
> table inet filter {
>   # blocked networks
>   set blacklist_v4 { type ipv4_addr; flags interval; }
> }
> 
> # this would be included from a generated file
> add element inet filter blacklist_v4 {
> 192.168.0.1/24,
> }

This is working here.

Your nft version is probably missing this patch:

http://git.netfilter.org/nftables/commit/?id=24c9e993eeff0ed41875aa7efef5dd69db4eb537

Could you please grab a nftables git.netfilter.org clone and confirm
this works for you?

We're planning for the nft 0.7 release, so it would be good if you can
help us confirm that the problem is already gone.

Thanks.
