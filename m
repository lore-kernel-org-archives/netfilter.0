From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: printk mac address --hangs
Date: Thu, 13 May 2010 18:19:36 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005131818450.9398@obet.zrqbmnf.qr>
References: <AANLkTinl1GZIOHaxfD7WgXPc2miKkRi3MDkkcaW4P6Zj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinl1GZIOHaxfD7WgXPc2miKkRi3MDkkcaW4P6Zj@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>


On Thursday 2010-05-13 17:45, ratheesh k wrote:

>Why this program cause kernel crash ? , If i comment out "memcpy " ,
>it works fine
>
>/* This is the hook function itself */
>unsigned int hook_func(unsigned int hooknum,
>                       struct sk_buff *skb,
>                       const struct net_device *in,
>                       const struct net_device *out,
>                       int (*okfn)(struct sk_buff *))
>{
>    struct iphdr* ip_header;
>    struct tcphdr* tcp_header;
>    struct ethhdr * eth_header ;
>    char src[ETH_ALEN+2];
>    char dst[ETH_ALEN+2];
>      src[ETH_ALEN+1]='\0';
>      dst[ETH_ALEN+1]='\0' ;
>
>     ip_header  = ip_hdr(skb);
>    tcp_header = tcp_hdr(skb);
>    eth_header = eth_hdr(skb);
>
>
>      memcpy(src , eth_header->h_source , ETH_ALEN );
>      memcpy(dst , eth_header->h_dest , ETH_ALEN );

If you do not have an Ethernet packet, this is going to explode.


>
>    return NF_ACCEPT;           /* Drop ALL packets */
>}
>
>/* Initialisation routine */
>int init_module()
                 ^ void

>{
>    /* Fill in our hook structure */
>    nfho.hook = hook_func;         /* Handler function */
>
>    nfho.hooknum  = NF_IP_LOCAL_OUT; /* First hook for IPv4 */
>
>    nfho.pf       = PF_INET;
>
>    nfho.priority = NF_IP_PRI_FIRST;   /* Make our function first */
>
>    nf_register_hook(&nfho);
>
>    return 0;
>}
>	
>/* Cleanup routine */
>void cleanup_module()
                     ^ void

>{
>    nf_unregister_hook(&nfho);
