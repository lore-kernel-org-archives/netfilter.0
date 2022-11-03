From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables and IPv6 prefix delegation (regression vs ip6tables)
Date: Fri, 4 Nov 2022 00:12:45 +0100
Message-ID: <20221103231245.GD29268@breakpoint.cc>
References: <tk16fd$hd2$1@ciao.gmane.io>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <tk16fd$hd2$1@ciao.gmane.io>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Pilcher <arequipeno@gmail.com>
Cc: netfilter@vger.kernel.org

Ian Pilcher <arequipeno@gmail.com> wrote:
> My plan to migrate from iptables to nftables seems to have hit a major
> snag.  nftables seems to lack the ability to use prefix-independent
> masks when matching IPv6 addresses.
> 
> For example, my ISP delegates a /56 prefix, which I can divide into as
> many as 256 separate /64 subnets.  So a routable IPv6 address in my
> network can be broken down like this.
> 
>   pppp:pppp:pppp:ppNN:hhhh:hhhh:hhhh:hhhh
> 
> Where the p's represent the delegated prefix, the N's represent an
> internal "network ID", and the h's represent the host address.  The
> prefix is relatively stable, but it can change occasionally, so hard-
> coding it into firewall rules is not really an option.
> 
> Assume that I want to match a particular host (pppp:pppp:pppp:ppc8::1)
> in a rule.  With ip6tables, I can match this address with this
> expression:
> 
>   0:0:0:c8::1/::ff:ffff:ffff:ffff:ffff

ip6tables-translate suggests:

nft add rule ip6 filter INPUT 'ip6 saddr & ::ff:ffff:ffff:ffff:ffff == ::c8:0:0:0:1'
