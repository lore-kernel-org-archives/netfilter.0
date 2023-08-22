From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: List chain during attack high CPU usage
Date: Tue, 22 Aug 2023 11:56:26 +0200
Message-ID: <ZOSGSpWQ7X6FQswi@calendula>
References: <em36be3a75-afb4-4570-a9eb-bcdcdf9648af@68036a95.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <em36be3a75-afb4-4570-a9eb-bcdcdf9648af@68036a95.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brskt <contact@brskt.be>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Aug 03, 2023 at 11:49:59AM +0000, Brskt wrote:
> Hi,
> 
> Is there any updates on this ?
> 
> https://marc.info/?l=netfilter&m=166256224929259&w=2
> 
> I don't understand why using "nft list chain netdev firewall filter" take
> time and CPU usage even if a set have a high numbers of elements since we
> don't show the elements in the set.
> 
> There is the filter command in the chain "nft add rule netdev firewall
> filter update @ratelimit_test { ip saddr . ip daddr . th dport } counter
> drop" which use the set but, we don't see how many elements and/or which
> elements are in the set.
> 
> Listing a chain should not try to load the elements in the set(s) that are
> used in a filter like iptables with ipset does not.
> It also do the same even if "counter" is not used.

Patch to address this issue:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230822095324.23656-1-pablo@netfilter.org/
