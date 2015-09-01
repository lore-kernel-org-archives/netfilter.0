From: Andreas Herz <andi@geekosphere.org>
Subject: Re: IPv6 fragmentation next header missing in some cases in the skb
Date: Tue, 1 Sep 2015 13:11:18 +0200
Message-ID: <20150901111118.GK29140@kvmbude>
References: <20150831120302.GU29140@kvmbude>
 <20150831143322.GA29140@kvmbude>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150831143322.GA29140@kvmbude>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 31/08/15 at 16:33, Andreas Herz wrote:
> On 31/08/15 at 14:03, Andreas Herz wrote:
> > While playing around with the IPv6 extension headers i found a strange
> > behaviour when it comes to the IPv6 fragmentation header. First i used the
> > thc-ipv6 toolkit with that i could trigger the issue below in the first place.
> >
> > [...]
> >
> > Does anyone have an idea why this happens and where i might need to look for
> > this issue?
> 
> Florian Westphal pointed out that it might be conntrack defrag and yes,
> on systems without it i see the frag header in iptables.
> So if defrag is on i have no chance to filter specific fragmentations i
> guess and just hope that the defrag process sorts every messed up stuff
> out ;)

To be more precise it only defrags valid fragmentation. When i used
thc-ipv6 implementation6 test i get:

> ip6tables -t raw -I PREROUTING -j LOG -m ipv6header --soft --header frag

Test 11: correct fragmentation          PASSED - we got a reply
Test 12: one-shot fragmentation         PASSED - we got a reply

=> won't match the rule, they are done in conntrack defrag

Test 13: overlap-first-zero fragmentation   FAILED - no reply
Test 14: overlap-last-zero fragmentation    FAILED - no reply
Test 15: overlap-first-dst fragmentation    FAILED - no reply
Test 16: overlap-last-dst fragmentation     FAILED - no reply

=> match the rule and they pass the conntrack defrag

So is my assumption correct that it would be fine to filter all traffic
with header frag set when i use conntrack_defrag_ipv6 at the same time?

-- 
Andreas Herz
