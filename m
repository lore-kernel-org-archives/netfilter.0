From: Laurent Bercot <ska-devel@skarnet.org>
Subject: Re: nftables: nft fails to add rules to chains
Date: Sat, 21 Mar 2015 21:16:17 +0100
Message-ID: <550DD191.6060105@skarnet.org>
References: <550B3069.7080209@skarnet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <550B3069.7080209@skarnet.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


  Bumping, since it looks like there are people from the project
reading this list at this time.

  Any idea on what is happening and how to solve it ? This is
preventing me from using nftables in my project. On the other
hand, if nftables, which is supposed to be the shiny new thing,
is still considered alpha and not to be used yet in real life,
it would be nice to know it ASAP.

  Thanks.

On 19/03/2015 21:24, Laurent Bercot wrote:
>
>   Hello,
>
>   (Platform: Intel Atom (x86_64), Linux 3.19.1, musl 1.1.7,
> latest nftables/libnftnl/libmnl from git. All iptables modules
> out of the kernel, all necessary nftables modules in.)
>
>   I can flush tables, create tables and create chains with nft
> without trouble; however, every time I try and add a rule to
> a chain, no matter what chain, no matter in what table, I get
> the following error:
>
>   netlink.c:182: Memory allocation failure
>
>   I dug a bit and found that the error always happens when
> alloc_nft_expr() is called for the *first* time (which is also
> the last, since nft exits at that point...) and it is always
> called with the argument "payload".
>
>   What is happening ? Anything I could do to help fix it ?
>   Thanks,
>

-- 
  Laurent

