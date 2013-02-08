From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: IPv6 routes too much
Date: Fri, 8 Feb 2013 16:34:24 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1302081615450.10125@nerf07.vanv.qr>
References: <CAG+XuE7FaAwwSq98JTSr3SOxSP2rN1hxFYQ7O=0L_3E=9kVreg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-newbie-owner@vger.kernel.org>
In-Reply-To: <CAG+XuE7FaAwwSq98JTSr3SOxSP2rN1hxFYQ7O=0L_3E=9kVreg@mail.gmail.com>
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Prashant Batra <prashant0100@gmail.com>
Cc: linux-newbie@vger.kernel.org, netfilter@vger.kernel.org

On Friday 2013-02-08 11:48, Prashant Batra wrote:

>I have a case wherein I have a route to a network connected to my
>linux machine via an interface, which I added like-
>
>route add -inet6 9aa::/16 gw 2001:db8:0:242::2 dev eth0

Forget net-tools already. It is not maintained.
There is no issue with iproute.

>like this I get 10k routes
>#cat /proc/net/ipv6_route | wc -l
>10015

It is correct - it dumps routes (for some definition of "route"), in 
particular all FIB entries. You will find the same for IPv4 in 
/proc/net/rt_cache on kernels where the cache has not already been 
removed. That said /proc/net only shows table 254, so the whole procfs 
business is pretty useless.

Just use iproute2, really.
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
