From: Andreas Herz <andi@geekosphere.org>
Subject: Re: IPv6 fragmentation next header missing in some cases in the skb
Date: Mon, 31 Aug 2015 16:33:22 +0200
Message-ID: <20150831143322.GA29140@kvmbude>
References: <20150831120302.GU29140@kvmbude>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150831120302.GU29140@kvmbude>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 31/08/15 at 14:03, Andreas Herz wrote:
> While playing around with the IPv6 extension headers i found a strange
> behaviour when it comes to the IPv6 fragmentation header. First i used the
> thc-ipv6 toolkit with that i could trigger the issue below in the first place.
>
> [...]
>
> Does anyone have an idea why this happens and where i might need to look for
> this issue?

Florian Westphal pointed out that it might be conntrack defrag and yes,
on systems without it i see the frag header in iptables.
So if defrag is on i have no chance to filter specific fragmentations i
guess and just hope that the defrag process sorts every messed up stuff
out ;)

Thanks

-- 
Andreas Herz
