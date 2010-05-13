From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: printk mac address --hangs
Date: Thu, 13 May 2010 21:15:41 +0530
Message-ID: <AANLkTinl1GZIOHaxfD7WgXPc2miKkRi3MDkkcaW4P6Zj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=zC5V8VhCv1l3ZFI7CKiNnDZbPDf2I1V9yDQGST66bIQ=;
        b=XIP6egdfergtYkOSj7N7gU2qKs6a3ikc3RKaQF8mV1h0EBjw3jxcfv0RdzC/tzpU9e
         159NVOAbM3uvEU57QDWsYtVLTIiXEfuSE/qQ4MXiI/rE3fdMdyjoDtwzAD4MclI3SdJh
         S6te4VIkDBZFwjT72FIdUNej/WiAmwNY8mGBw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>

Why this program cause kernel crash ? , If i comment out "memcpy " ,
it works fine


*******************************************************************************************
 #include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/netfilter.h>
#include <linux/netfilter_ipv4.h>
# include <linux/skbuff.h>

# include <linux/ip.h>
# include <linux/tcp.h>
MODULE_LICENSE("Dual BSD/GPL");

#define NF_IP_LOCAL_OUT     3


/* This is the structure we shall use to register our function */

static struct nf_hook_ops nfho;

/* This is the hook function itself */
unsigned int hook_func(unsigned int hooknum,
                       struct sk_buff *skb,
                       const struct net_device *in,
                       const struct net_device *out,
                       int (*okfn)(struct sk_buff *))
{
    struct iphdr* ip_header;
    struct tcphdr* tcp_header;
    struct ethhdr * eth_header ;
    char src[ETH_ALEN+2];
    char dst[ETH_ALEN+2];
      src[ETH_ALEN+1]='\0';
      dst[ETH_ALEN+1]='\0' ;

     ip_header  = ip_hdr(skb);
    tcp_header = tcp_hdr(skb);
    eth_header = eth_hdr(skb);


      memcpy(src , eth_header->h_source , ETH_ALEN );
      memcpy(dst , eth_header->h_dest , ETH_ALEN );

    return NF_ACCEPT;           /* Drop ALL packets */
}

/* Initialisation routine */
int init_module()
{
    /* Fill in our hook structure */
    nfho.hook = hook_func;         /* Handler function */

    nfho.hooknum  = NF_IP_LOCAL_OUT; /* First hook for IPv4 */

    nfho.pf       = PF_INET;

    nfho.priority = NF_IP_PRI_FIRST;   /* Make our function first */

    nf_register_hook(&nfho);

    return 0;
}
	
/* Cleanup routine */
void cleanup_module()
{
    nf_unregister_hook(&nfho);
}
***********************************
