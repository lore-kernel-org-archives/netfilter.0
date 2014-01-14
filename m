From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: [PATCH] [RFC] netfilter: nf_conntrack: don't relase a conntrack
 with non-zero refcnt
Date: Tue, 14 Jan 2014 21:44:22 +0400
Message-ID: <20140114174421.GC1916@moon>
References: <1389710201.31367.255.camel@edumazet-glaptop2.roam.corp.google.com>
 <1389720948-7883-1-git-send-email-avagin@openvz.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=xjBNhkB6C5KvZ5dbQKHxIhe1c/WAEozqc4MKLp24JqQ=;
        b=Wzo1/rkCtkKed3Q4PYwzXkCwAlsAAbfm/0ZzpuvPGWIGdGgEmK1ka6UTxHnbmuQNOi
         FROJga2lAeyZPOjEhG3sM+FbQt6AAlJeP9XjZEA/2UDnQH6Boo8eUOz+PDke54QaT4sr
         HGjkmT26FRvmnruQCKc7mEvhRa54vDrikuT474BuVusM7MD2uB+OPoVfTmraQKRsAGmu
         bV4tGC+uwnaGLnUjJSbwBpMHKSFk9OELZxavhFfDtj55WPByd2XH+zhuDj9GBX+W6GLB
         Abz4a7TSf1v4bQdInpDhdvv+U3h7emFo4k8kAin09eoVDRpUkuJaWguhUoODVWh7k2mu
         8joQ==
Content-Disposition: inline
In-Reply-To: <1389720948-7883-1-git-send-email-avagin@openvz.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Vagin <avagin@openvz.org>
Cc: netfilter-devel@vger.kernel.org, Eric Dumazet <eric.dumazet@gmail.com>, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, vvs@openvz.org, Florian Westphal <fw@strlen.de>, Vasiliy Averin <vvs@parallels.com>

On Tue, Jan 14, 2014 at 09:35:48PM +0400, Andrey Vagin wrote:
> ----
> Eric and Florian, could you look at this patch. When you say,
> that it looks good, I will ask the user to validate it.
> I can't reorder these actions, because it's reproduced on a real host
> with real users. Thanks.
> ----
> 
> nf_conntrack_free can't be called for a conntract with non-zero ref-counter,
> because it can race with nf_conntrack_find_get().
> 
> A conntrack slab is created with SLAB_DESTROY_BY_RCU. Non-zero
> ref-conunter says that this conntrack is used now. So when we release a
> conntrack with non-zero counter, we break this assumption.
> 
> CPU1                                    CPU2
> ____nf_conntrack_find()
>                                         nf_ct_put()
>                                          destroy_conntrack()
>                                         ...
>                                         init_conntrack
>                                          __nf_conntrack_alloc (set use = 1)
> atomic_inc_not_zero(&ct->use) (use = 2)
>                                          if (!l4proto->new(ct, skb, dataoff, timeouts))
>                                           nf_conntrack_free(ct); (use = 2 !!!)
>                                         ...
>                                         __nf_conntrack_alloc (set use = 1)
>  if (!nf_ct_key_equal(h, tuple, zone))
>   nf_ct_put(ct); (use = 0)
>    destroy_conntrack()
>                                         /* continue to work with CT */

If I didn't miss something obvious this looks like a pretty possible
scenario. Thanks!
