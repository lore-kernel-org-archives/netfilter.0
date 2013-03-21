From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: netfilter+libvirt=(smth got broken?)
Date: Thu, 21 Mar 2013 03:30:46 +0100
Message-ID: <20130321023046.GA4189@localhost>
References: <5149AFD3.2070108@yandex.ru>
 <5149BC91.4090502@yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5149BC91.4090502@yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikolai Zhubr <n-a-zhubr@yandex.ru>
Cc: libvirt-users@redhat.com, netfilter@vger.kernel.org

Hi Nikolai,

On Wed, Mar 20, 2013 at 05:41:37PM +0400, Nikolai Zhubr wrote:
> Hello,
> 20.03.2013 16:47, I wrote:
> [...]
> >This all looks to me as if "--ctdir" argument somehow magically changed
> >its meaning to the opposite, but this just cannot be! I'm out of ideas
> >and looking for insights. Any hints appreciated quite a lot.
> 
> Some more searching over maillists yielded this (quite astonishing):
> 
> net/netfilter/xt_conntrack.c	
> diff --git a/net/netfilter/xt_conntrack.c b/net/netfilter/xt_conntrack.c
> index 2c0086a..481a86f 100644
> --- a/net/netfilter/xt_conntrack.c
> +++ b/net/netfilter/xt_conntrack.c
> @@ -195,7 +195,7 @@ conntrack_mt(const struct sk_buff *skb, struct
> xt_action_param *par,
>  		return info->match_flags & XT_CONNTRACK_STATE;
>  	if ((info->match_flags & XT_CONNTRACK_DIRECTION) &&
>  	    (CTINFO2DIR(ctinfo) == IP_CT_DIR_ORIGINAL) ^
> -	    !!(info->invert_flags & XT_CONNTRACK_DIRECTION))
> +	    !(info->invert_flags & XT_CONNTRACK_DIRECTION))
>  		return false;
> 
>  	if (info->match_flags & XT_CONNTRACK_ORIGSRC)
> 
> So apparently, netfilter's behaviour was indeed reversed at some
> point, therefore libvirt stopped working properly.

--ctdir was broken and it was fixed in patch:

commit 96120d86fe302c006259baee9061eea9e1b9e486
Author: Florian Westphal <fw@strlen.de>
Date:   Mon Apr 4 17:06:21 2011 +0200

    netfilter: xt_conntrack: fix inverted conntrack direction test

    --ctdir ORIGINAL matches REPLY packets, and vv:

    userspace sets "invert_flags &= ~XT_CONNTRACK_DIRECTION" in ORIGINAL
    case.

By looking at the changes you made:

>--A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate
>ESTABLISHED -m conntrack --ctdir ORIGINAL -j RETURN
>+-A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate
>ESTABLISHED -m conntrack --ctdir REPLY -j RETURN

The first rule looks wrong to me indeed, traffic coming in the
original direction will initiate the connection to destination port
TCP/110. Therefore, your change is correct.

It's unfortunate nobody noticed this rule was incorrect so far (even
if it was working).

> I'd guess libvirt needs to be adapted then? Is it a known issue or
> should I fill in bugreport at Novell/Red Hat?

I think you should file the bug.
