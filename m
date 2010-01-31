From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [REPORT] may be wrong place #endif in
 include/linux/netfilter_ipv4.h
Date: Sun, 31 Jan 2010 10:21:43 +0100 (CET)
Message-ID: <alpine.LSU.2.01.1001311019430.15188@obet.zrqbmnf.qr>
References: <4B64E732.3090507@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4B64E732.3090507@gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Helight.Xu" <helight.xu@gmail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, Patrick McHardy <kaber@trash.net>, coreteam@netfilter.org, linux-kernel@vger.kernel.org

On Sunday 2010-01-31 03:13, Helight.Xu wrote:

> hi all gys:
>
>   when I make LKM with netfilter on "NF_IP_PRE_ROUTING" point, but it was
> reported that "NF_IP_PRE_ROUTING" is not defined.
>
>   but I am surely including <linux/netfilter_ipv4.h>, when I opened
> include/linux/netfilter_ipv4.h I found that
> "NF_IP_PRE_ROUTING" is in this lable :
> #ifndef __KERNEL__
> .....
> /* IP Hooks */
> /* After promisc drops, checksum checks. */
> #define NF_IP_PRE_ROUTING       0
> /* If the packet is destined for this box. */
> #define NF_IP_LOCAL_IN          1
> /* If the packet is destined for another interface. */
> #define NF_IP_FORWARD           2
> /* Packets coming from a local process. */
> #define NF_IP_LOCAL_OUT         3
> /* Packets about to hit the wire. */
> #define NF_IP_POST_ROUTING      4
> #define NF_IP_NUMHOOKS          5
> #endif /* ! __KERNEL__ */
>
> So I think the "endif" is ended a little early!

Seems so. Are there any out-of-tree nf_ip_hook_priorities users? If not, 
we could possibly move it further below.
