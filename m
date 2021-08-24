From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft tool slow down due to large ipv4 addresses sets
Date: Tue, 24 Aug 2021 12:07:15 +0200
Message-ID: <20210824100715.GA1566@salvia>
References: <CANCV4NNzVz-Ld+rgJ4a0ZLKXmkY6Xka1aEaV5TAGy-qS_QwEAg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANCV4NNzVz-Ld+rgJ4a0ZLKXmkY6Xka1aEaV5TAGy-qS_QwEAg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cristian Constantin <const.crist@googlemail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Wed, Aug 18, 2021 at 03:35:05PM +0200, Cristian Constantin wrote:
> hi!
> 
> while running some tests on my system I have noticed a (pretty big)
> slow down of the nft tool when manipulating ipv4 address sets.
> 
> system details:
> root@firiel:/home/cco# nft -v
> nftables v0.9.6 (Capital Idea #2)
> root@firiel:/home/cco# uname -a
> Linux firiel 5.8.0-63-generic #71-Ubuntu SMP Tue Jul 13 15:59:12 UTC
> 2021 x86_64 x86_64 x86_64 GNU/Linux
> 
> there are 2 ipv4 sets, "blackhole-0" and "blackhole-1" which contain
> about 1.3 million ip addresses. they were set up using something like
> this:
> 
> nft add set ip filter blackhole-* {type ipv4_addr;}
> 
> this sets were not used in any rule and there was no significant
> traffic on the machine.
> the next step in my test was to add _one_ new ip address in either one
> of the large sets or in a new empty one by using the 'nft' command
> line.
> this operation took a lot of time and 'top' showed the 'nft' process
> using a lot of CPU time.
> 
> ## adding an ipv4 addr to a new almost empty set
> root@firiel:/home/cco/nftables# time nft add element ip filter
> blackhole-test "{10.0.0.3}"
> 
> real 0m22,652s
> user 0m2,997s
> sys 0m19,512s
> 
> ## adding an ipv4 address to an existing large set
> root@firiel:/home/cco/nftables# time nft add element ip filter
> blackhole-0 "{10.127.0.3}"
> 
> real 0m22,520s
> user 0m2,939s
> sys 0m19,485s
> 
> after removing the large ipv4 address sets, everything seems to be
> back to normal in terms of how fast 'nft' utility is.
> blackhole-test has at most 10 ipv4 addresses.
> 
> root@firiel:/home/cco/nftables# time nft add element ip filter
> blackhole-test "{10.0.0.7}"
> 
> real 0m0,004s
> user 0m0,001s
> sys 0m0,004s
> 
> is this behaviour known and expected? or is there something
> misconfigured on my system?

It's the userspace cache logic: it should skip populating the set for
add / delete element commands.

Patch:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210824100418.29423-1-pablo@netfilter.org/
